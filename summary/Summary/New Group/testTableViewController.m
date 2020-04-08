//
//  testTableViewController.m
//  summary
//
//  Created by ZhuLuxi on 2018/4/23.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "Masonry.h"
#import "testTableViewController.h"
#import "testTableViewCell.h"
#import "MJExtension.h"
#import <arpa/inet.h>
#import <resolv.h>
#import <netdb.h>

@interface testTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,assign) NSInteger count;
@property (nonatomic,strong) NSConditionLock *lock;
@property (nonatomic,strong) dispatch_group_t downloadGroup;

@end

@implementation testTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    Boolean result,bResolved;
    CFHostRef hostRef;
    CFArrayRef addresses = NULL;
    NSMutableArray * ipsArr = [[NSMutableArray alloc] init];

    CFStringRef hostNameRef = CFStringCreateWithCString(kCFAllocatorDefault, "www.bbae.com", kCFStringEncodingASCII);

    hostRef = CFHostCreateWithName(kCFAllocatorDefault, hostNameRef);
    CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
    result = CFHostStartInfoResolution(hostRef, kCFHostAddresses, NULL);
    if (result == TRUE) {
        addresses = CFHostGetAddressing(hostRef, &result);
    }
    bResolved = result == TRUE ? true : false;

    if(bResolved)
    {
        struct sockaddr_in* remoteAddr;
        for(int i = 0; i < CFArrayGetCount(addresses); i++)
        {
            CFDataRef saData = (CFDataRef)CFArrayGetValueAtIndex(addresses, i);
            remoteAddr = (struct sockaddr_in*)CFDataGetBytePtr(saData);

            if(remoteAddr != NULL)
            {
                //获取IP地址
                char ip[16];
                strcpy(ip, inet_ntoa(remoteAddr->sin_addr));
                NSString * ipStr = [NSString stringWithCString:ip encoding:NSUTF8StringEncoding];
                [ipsArr addObject:ipStr];
            }
        }
    }
    CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
    NSLog(@"33333 === ip === %@ === time cost: %0.3fs", ipsArr,end - start);
    CFRelease(hostNameRef);
    CFRelease(hostRef);

}


- (NSString *)getStr {
    NSCondition *condition = [[NSCondition alloc]init];

    __block BOOL isDone = NO;
    //1. 用原生的NSURLSession请求
    NSString *urlStr = @"https://transformer-web--develop.bbaecache.com/api/v2/account/countryList";
    NSDictionary *dict = @{
                           @"ticket":@"311e679f-e418-47fe-b8d5-9fc4569f25c9",
                           @"usAccountID":@296,
                           @"token":@"uZwKMvK8iaOrCNWztZv2jb6u25JUrTM75SyV",
                           @"userID":@"135956817",
                           @"username":@"m1359568172",
                           };

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    // 执行异步任务1
    __block NSString *str = @"";

    NSURLSessionDataTask *task =  [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            str = @"被更改的str";

            [condition lock];
            isDone = YES;
            [condition signal];
            [condition unlock];
        dispatch_group_leave(self.downloadGroup);
    }];

    [task resume];

    [condition lock];
    while (isDone == NO) {
        [condition wait];
    }
    [condition unlock];
    return str;
}

#pragma  mark - tableView的代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    static NSString *cellId = @"cell";
    testTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[testTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据－－－－－%zd",indexPath.row];
    cell.detailTextLabel.text = @"111";
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{


}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
    
}

//-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}


-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{

 NSLog(@"moveRowAtIndexPath-----fromIndex--%@-----toIndex---%@",sourceIndexPath,destinationIndexPath);

}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleInsert;
}



@end
