//
//  ViewController.m
//  summary
//
//  Created by ZhuLuxi on 2017/11/20.
//  Copyright © 2017年 LX. All rights reserved.
//
#import <objc/message.h>
#import "ViewController.h"
<<<<<<< HEAD
#import "Student.h"

//@interface Student:NSObject
//{
//    NSString *_name;
//    int _age;
//    
//}
//@end
=======
#import  "AFNetworking.h"
#import "singletonClass.h"
#import "singletonClass2.h"
>>>>>>> 917feec42dbc4c693677e943ab814167e3325073

@interface managerTool:NSObject

@end

@implementation managerTool

@end

@interface ViewController()



@end

@implementation ViewController

<<<<<<< HEAD

=======
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
>>>>>>> 917feec42dbc4c693677e943ab814167e3325073

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    Student *stu = [[Student alloc]init];
    NSLog(@"111--%@",stu.class);
    
//    NSString* str = @"Hello World";
    
    

<<<<<<< HEAD
   


}
=======

    singletonClass2 *obj1 = [[singletonClass2 alloc]init];
    singletonClass2 *obj2 = [[singletonClass2 alloc]init];
    singletonClass2 *obj3 = [singletonClass2 sharesingletonClass2];


    NSLog(@" %p  %p %p",obj1,obj2,obj3);

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

>>>>>>> 917feec42dbc4c693677e943ab814167e3325073



@end
