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



@interface managerTool:NSObject

@end

@implementation managerTool

@end

@interface ViewController()

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
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    /*
     GET
     https://transformer-web--develop.bbaecache.com/api/v2/trade/positions?paged=0&usAccountID=296
     */

//    NSString *urlStr = @"https://transformer-web--develop.bbaecache.com/api/v2/account/countryList";
//
//    NSDictionary *dict = @{
////                           @"ticket":@"311e679f-e418-47fe-b8d5-9fc4569f25c9",
////                           @"usAccountID":@296,
////                           @"token":@"uZwKMvK8iaOrCNWztZv2jb6u25JUrTM75SyV",
////                           @"userID":@"135956817",
////                           @"username":@"m1359568172",
//                           };
//
//    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
//    [session POST:urlStr parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"responseObject----%@",responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"error--%@",error);
//    }];


//    NSURLSession *session = [NSURLSession sessionWithConfiguration:<#(nonnull NSURLSessionConfiguration *)#>];

}




@end
