//
//  AFNViewController.m
//  summary
//
//  Created by NewBoy on 2018/4/27.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "AFNViewController.h"
#import <AFNetworking.h>

@interface AFNViewController ()
@property (nonatomic,strong) NSOperationQueue  *queue;
@property (nonatomic,strong) dispatch_queue_t serialQueue;
@property (nonatomic,strong) AFHTTPSessionManager *session;
@property (nonatomic,strong) NSMutableArray *taskArray;

@property (nonatomic,assign) BOOL isRequest;
@end

@implementation AFNViewController


- (void)btnClick{

//    //1. 用原生的NSURLSession请求
//    NSString *urlStr = @"https://transformer-web--develop.bbaecache.com/api/v2/account/countryList";
//    NSDictionary *dict = @{
//                          @"ticket":@"311e679f-e418-47fe-b8d5-9fc4569f25c9",
//                          @"usAccountID":@296,
//                          @"token":@"uZwKMvK8iaOrCNWztZv2jb6u25JUrTM75SyV",
//                          @"userID":@"135956817",
//                          @"username":@"m1359568172",
//                          };
//
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.HTTPMethod = @"POST";
//    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    // 执行异步任务1
//    NSURLSessionDataTask *task =  [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//
//        NSLog(@"11111----%@",response);
//    }];
//    [task resume];



         //2.用AFN发送网络请求
        NSString *urlStr = @"https://transformer-web--develop.bbaecache.com/api/v2/account/countryList";
        AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    NSLog(@"session-----%@",session);

        NSDictionary *dict = @{
                               @"ticket":@"311e679f-e418-47fe-b8d5-9fc4569f25c9",
                               @"usAccountID":@296,
                               @"token":@"uZwKMvK8iaOrCNWztZv2jb6u25JUrTM75SyV",
                               @"userID":@"135956817",
                               @"username":@"m1359568172",
                               };
        // 执行异步任务1
        [session POST:urlStr parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

            NSLog(@"11111---%@",(NSHTTPURLResponse *)task.response);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"error111--%@",error);
        }];


}
- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(100, 400, 50, 50);
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor redColor];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    button.exclusiveTouch = YES;
    [self.view addSubview:button];

    self.queue = [[NSOperationQueue alloc]init];
    dispatch_queue_t queue = dispatch_queue_create("123", DISPATCH_QUEUE_SERIAL);
    self.serialQueue = queue;

    self.taskArray = [NSMutableArray array];

   self.session = [AFHTTPSessionManager manager];


}


-(void)testCode{

    //        NSDictionary *dict = @{
    //                               @"ticket":@"311e679f-e418-47fe-b8d5-9fc4569f25c9",
    //                               @"usAccountID":@296,
    //                               @"token":@"uZwKMvK8iaOrCNWztZv2jb6u25JUrTM75SyV",
    //                               @"userID":@"135956817",
    //                               @"username":@"m1359568172",
    //                               };
    //    // 执行异步任务1
    //    NSURLSessionDataTask *task = [self.session POST:urlStr parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //        NSLog(@"11111----%@",responseObject);
    //    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //        NSLog(@"22222----%@",error);
    //    }];

    //    [self.taskArray addObject:task];
    //    if (self.isRequest) return;
    //    self.isRequest = YES;
    //    NSString *urlStr = @"https://transformer-web--develop.bbaecache.com/api/v2/account/countryList";
    //
    //    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    //    NSDictionary *dict = @{
    //                           @"ticket":@"311e679f-e418-47fe-b8d5-9fc4569f25c9",
    //                           @"usAccountID":@296,
    //                           @"token":@"uZwKMvK8iaOrCNWztZv2jb6u25JUrTM75SyV",
    //                           @"userID":@"135956817",
    //                           @"username":@"m1359568172",
    //                           };
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        // 执行异步任务1
    //        [session POST:urlStr parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //            self.isRequest = NO;
    //            NSLog(@"11111");
    //        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //            NSLog(@"22222");
    //        }];
    //    });


    //    dispatch_group_async(group, queue, ^{
    //        NSLog(@"bbb");
    //        // 执行异步任务2
    //        dispatch_group_enter(group);
    //        NSString *urlStr2 = @"https://transformer-web--develop.bbaecache.com/api/v2/account/countryList";
    //        [session POST:urlStr2 parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //            NSLog(@"22222");
    //            dispatch_group_leave(group);
    //        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //            NSLog(@"shibaile");
    //        }];
    //
    //    });


    //    dispatch_group_t group =dispatch_group_create();
    ////     dispatch_queue_t queue =dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
    //
    //    dispatch_queue_t queue = dispatch_queue_create("ted.queue.next1", DISPATCH_QUEUE_CONCURRENT);
    //
    //    NSString *urlStr = @"https://transformer-web--develop.bbaecache.com/api/v2/account/countryList";
    //
    //    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    //
    //    NSDictionary *dict = @{
    //                           @"ticket":@"311e679f-e418-47fe-b8d5-9fc4569f25c9",
    //                           @"usAccountID":@296,
    //                           @"token":@"uZwKMvK8iaOrCNWztZv2jb6u25JUrTM75SyV",
    //                           @"userID":@"135956817",
    //                           @"username":@"m1359568172",
    //                           };
    //
    //    dispatch_group_enter(group);
    //    dispatch_group_async(group, queue, ^{
    //
    //        NSLog(@"aaaa");
    //        // 执行异步任务1
    //        [session POST:urlStr parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //            NSLog(@"11111");
    //            dispatch_group_leave(group);
    //        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //            NSLog(@"error111--%@",error);
    //        }];
    //    });
    //
    //    dispatch_group_async(group, queue, ^{
    //        NSLog(@"bbb");
    //        // 执行异步任务2
    //        dispatch_group_enter(group);
    //        NSString *urlStr2 = @"https://transformer-web--develop.bbaecache.com/api/v2/account/countryList";
    //        [session POST:urlStr2 parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //            NSLog(@"22222");
    //            dispatch_group_leave(group);
    //        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //            NSLog(@"shibaile");
    //        }];
    //
    //    });
    //
    //    dispatch_group_notify(group,dispatch_get_main_queue(), ^{
    //        NSLog(@"33---%@", [NSThread currentThread]);
    //        NSLog(@"完成...");
    //    });
}

//7.用户访问网站的原理过程
-(void)summary1{

    /*
     01. DNS域名解析，获悉域名对应IP地址
     02. 根据IP地址访问网站服务器，TCP三次握手过程
     03. 用户向网站服务请求信息，HTTP请求过程（HTTP请求报文）
     04. 网站服务对用户请求进行响应，HTTP响应过程（HTTP响应报文）
      说明：03 04步骤就称为HTTP协议原理过程
     05. 断开网络连接，TCP四次挥手过程

     */
}

@end
