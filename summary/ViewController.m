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
        NSLog(@"1========%@",[NSThread currentThread]);



//    //创建一个串行队列
    dispatch_queue_t queue = dispatch_queue_create("com.dispatch.serial", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t queue2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//
    dispatch_sync(queue, ^{
        NSLog(@"2222-------");
    });
//
////    dispatch_sync(dispatch_get_main_queue(), ^{
////        NSLog(@"2222---*****");
////    });
//
    NSLog(@"3333---");
//    return;

    dispatch_queue_t serialdispatchQueue1 = dispatch_queue_create("com.Sky.serialTest", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t serialdispatchQueue2 = dispatch_queue_create("com.Sky.serialTest", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t serialdispatchQueue3 = dispatch_queue_create("com.Sky.serialTest", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t serialdispatchQueue4 = dispatch_queue_create("com.Sky.serialTest", DISPATCH_QUEUE_SERIAL);
    dispatch_async(serialdispatchQueue1, ^{NSLog(@"serialdispatchQueue1  %@", [NSThread currentThread]);});
//    dispatch_async(serialdispatchQueue2, ^{NSLog(@"serialdispatchQueue2  %@", [NSThread currentThread]);});
//    dispatch_async(serialdispatchQueue3, ^{NSLog(@"serialdispatchQueue3  %@", [NSThread currentThread]);});
//    dispatch_async(serialdispatchQueue4, ^{NSLog(@"serialdispatchQueue4  %@", [NSThread currentThread]);});


    return;


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
