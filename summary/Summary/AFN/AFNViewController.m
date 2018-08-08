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

//    NSString *urlStr = @"https://transformer-web--develop.bbaecache.com/api/v2/account/countryList";
//    NSDictionary *dict = @{
//                           @"ticket":@"311e679f-e418-47fe-b8d5-9fc4569f25c9",
//                           @"usAccountID":@296,
//                           @"token":@"uZwKMvK8iaOrCNWztZv2jb6u25JUrTM75SyV",
//                           @"userID":@"135956817",
//                           @"username":@"m1359568172",
//                           };
//
//    // 执行异步任务1
//    NSURLSessionDataTask *task = [self.session POST:urlStr parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"11111");
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"22222");
//    }];
//    task.
//
//    [task resume];

    NSString *urlStr = @"https://transformer-web--develop.bbaecache.com/api/v2/account/countryList";

    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
//    session.requestSerializer.timeoutInterval = 0.01;
    NSDictionary *dict = @{
                           @"ticket":@"311e679f-e418-47fe-b8d5-9fc4569f25c9",
                           @"usAccountID":@296,
                           @"token":@"uZwKMvK8iaOrCNWztZv2jb6u25JUrTM75SyV",
                           @"userID":@"135956817",
                           @"username":@"m1359568172",
                           };
        // 执行异步任务1
        [session POST:urlStr parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"11111");
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"22222");
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


    [NSTimer scheduledTimerWithTimeInterval:2.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self btnClick];
    }];



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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
