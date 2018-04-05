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




@interface ViewController()

@property (nonatomic,strong) NSMutableArray *array;
@end


@implementation ViewController


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"array=====%@",self.array[100]);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

<<<<<<< HEAD

    return;
=======
>>>>>>> b3a2837d92a72bd55632bb4307768026dc0551cc
    /*
     GET
     https://transformer-web--develop.bbaecache.com/api/v2/trade/positions?paged=0&usAccountID=296
     */



    NSString *urlStr = @"https://transformer-web--develop.bbaecache.com/api/v2/account/countryList";
//
    NSDictionary *dict = @{
//                           @"ticket":@"311e679f-e418-47fe-b8d5-9fc4569f25c9",
//                           @"usAccountID":@296,
//                           @"token":@"uZwKMvK8iaOrCNWztZv2jb6u25JUrTM75SyV",
//                           @"userID":@"135956817",
//                           @"username":@"m1359568172",
                           };



    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session.requestSerializer setValue:@"Fri, 12 May 2006 18:53:33 GMT" forHTTPHeaderField:@"If-Modified-Since"];
    NSLog(@"requestSerializer.HTTPRequestHeaders---%@",session.requestSerializer.HTTPRequestHeaders);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [session POST:urlStr parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"task.response----%@",task.response);

            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"error--%@",error);
            }];
        });

}



@end
