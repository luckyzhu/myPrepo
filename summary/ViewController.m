//
//  ViewController.m
//  summary
//
//  Created by ZhuLuxi on 2017/11/20.
//  Copyright © 2017年 LX. All rights reserved.
//
#import <objc/message.h>
#import "ViewController.h"
#import "Student.h"
#import "Person.h"
#import "subPerson.h"


//@interface Student:NSObject
//{
//    NSString *_name;
//    int _age;
//    
//}
//@end
#import  "AFNetworking.h"
#import <objc/runtime.h>
#import "Person.h"
#import "subPerson.h"




@interface ViewController()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,weak) UITableView *tableView;

@end


@implementation ViewController


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
   
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    self.tableView = tableview;
    
    return;
    /*
     GET
     https://transformer-web--develop.bbaecache.com/api/v2/trade/positions?paged=0&usAccountID=296
     */


//    Person *p = [Person new];
    subPerson *subP = [subPerson new];

    return;

//    NSString *urlStr = @"https://transformer-web--develop.bbaecache.com/api/v2/account/countryList";
    NSString *urlStr1 = @"https://news.l.qq.com/app?";
    NSString *urlStr2 = @"http://adse.ximalaya.com/ting/home?appid=0&device=iPhone&name=titlebar_middle_bottom&network=WIFI&operator=3&scale=2&version=6.3.84&xt=1523811253448";
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);

//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [session GET:urlStr1 parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                dispatch_semaphore_signal(sem);
                NSLog(@"返回数据111------");
                //            NSLog(@"返回数据111------%@",responseObject);
                [session GET:urlStr2 parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    NSLog(@"返回数据222------");
                    dispatch_semaphore_signal(sem);
                    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
                    //        NSLog(@"返回数据222------%@",responseObject);
                    
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    NSLog(@"error222--%@",error);
                }];
                
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"error111--%@",error);
            }];
//        });

}


#pragma  mark - tableView的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    [NSThread sleepForTimeInterval:3.0];
    NSLog(@"numberOfRowsInSection");
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据－－－－－%zd",indexPath.row];
    NSLog(@"cellForRowAtIndexPath----%@",[NSThread currentThread]);

    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView reloadData];
//    [self.tableView layoutIfNeeded];
    NSLog(@"222222");
//    dispatch_async(dispatch_get_main_queue(), ^{
//        // do sth
//        NSLog(@"11111");
//    });
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"heightForRowAtIndexPath");

    return 44;

}



@end
