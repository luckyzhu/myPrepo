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


@interface ViewController ()

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear应该程序-----%zd",[UIApplication sharedApplication].applicationState);

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(0, 0, 50, 50);
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor redColor];
    button.backgroundColor = [UIColor blueColor];
    button.exclusiveTouch = YES;
    [self.view addSubview:button];



////    //调用有参无返回值的方法
//    NSMethodSignature *signature = [[self class] methodSignatureForSelector:@selector(test1:str2:)];
//    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
//
//    invocation.target = self;
//    invocation.selector = @selector(test1:str2:);
//    NSString *name = @"SJM";
//    int age = 18;
//
//    [invocation setArgument:&name atIndex:2];
//    [invocation setArgument:&age atIndex:3];
////    [invocation retainArguments];
//    [invocation invoke];

//    // 1. 根据方法创建签名对象sig
//    NSMethodSignature *sig = [[self class] instanceMethodSignatureForSelector:@selector(method)];
//
//    // 2. 根据签名对象创建调用对象invocation
//    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
//
//    // 3. 设置调用对象的相关信息
//    // 注意：target不要设置成局部变量
//    invocation.target = self;
//    invocation.selector = @selector(method);
//
//    //4. 调用方法
//    [invocation invoke];

}
- (void)methodWithArg1:(NSString *)arg1 arg2:(int)arg2 {

    NSLog(@"我叫%@，今年%d岁。", arg1, arg2);
}
+(void)test1:(NSString *)str str2:(int)str2{
    NSLog(@"test函数测试...%@---%zd",str,str2);
}
- (void)method {

    NSLog(@"无参无返回值");
}

@end
