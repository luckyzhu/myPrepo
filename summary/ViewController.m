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
#import "subViewController.h"




@interface ViewController()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,weak) UITableView *tableView;

@end


@implementation ViewController


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
   
    
}

- (void)buttonClick{
    
    subViewController *subVc = [subViewController new];
    subVc.view.backgroundColor = [UIColor redColor];
    subVc.title = nil;
    [self.navigationController pushViewController:subVc animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button setTitle:@"按钮一" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    return;
    NSLog(@"111----%@",NSStringFromCGRect(self.view.frame));
    
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



@end
