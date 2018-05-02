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

@end

@implementation AFNViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    /*
     GET
     https://transformer-web--develop.bbaecache.com/api/v2/trade/positions?paged=0&usAccountID=296
     */

    NSString *urlStr = @"https://transformer-web--develop.bbaecache.com/api/v2/account/countryList";
    //
    NSDictionary *dict = @{
                           @"ticket":@"311e679f-e418-47fe-b8d5-9fc4569f25c9",
                           @"usAccountID":@296,
                           @"token":@"uZwKMvK8iaOrCNWztZv2jb6u25JUrTM75SyV",
                           @"userID":@"135956817",
                           @"username":@"m1359568172",
                           };


    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session.requestSerializer setValue:@"Fri, 12 May 2006 18:53:33 GMT" forHTTPHeaderField:@"If-Modified-Since"];
    [session POST:urlStr parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"task.response----%@",task.response);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error111--%@",error);
    }];


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
