//
//  ViewController.m
//  summary
//
//  Created by ZhuLuxi on 2017/11/20.
//  Copyright © 2017年 LX. All rights reserved.
//
#import <objc/runtime.h>
#import "Masonry.h"
#import "ViewController.h"
#import  "AFNetworking.h"
#import "singletonClass.h"
#import "singletonClass2.h"

@interface Student:NSObject

@property (nonatomic,copy) NSString *stuName;
- (void)test;
@end

@implementation Student
//- (void)test{
//    NSLog(@"1111");
//}

@end

@interface ViewController()

@property (nonatomic,strong) NSMutableArray *array;
@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"array=====%@",self.array[100]);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    __block NSMutableArray *array = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [array addObject:@"5555"];
    });

    self.array = array;

    return;
    /*
     GET
     https://transformer-web--develop.bbaecache.com/api/v2/trade/positions?paged=0&usAccountID=296
     */

    NSString *urlStr = @"https://transformer-web--develop.bbaecache.com/api/v2/account/countryList";

    NSDictionary *dict = @{
//                           @"ticket":@"311e679f-e418-47fe-b8d5-9fc4569f25c9",
//                           @"usAccountID":@296,
//                           @"token":@"uZwKMvK8iaOrCNWztZv2jb6u25JUrTM75SyV",
//                           @"userID":@"135956817",
//                           @"username":@"m1359568172",
                           };



    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];

    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    [requestSerializer setValue:@"Fri, 12 May 2006 18:53:33 GMT" forHTTPHeaderField:@"If-Modified-Since"];

    NSLog(@"requestSerializer.HTTPRequestHeaders---%@",requestSerializer.HTTPRequestHeaders);
    [session POST:urlStr parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"task.response----%@",task.response);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error--%@",error);
    }];

    NSLog(@"%@",NSHomeDirectory());

//    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];


}




@end
