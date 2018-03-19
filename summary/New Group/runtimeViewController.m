//
//  runtimeViewController.m
//  summary
//
//  Created by ZhuLuxi on 2018/3/11.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "runtimeViewController.h"
#import <objc/message.h>

@interface runtimeViewController ()

@end

@implementation runtimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     1> 使用objc_msgSend给某个对象发送消息的时候,如果出现Too many arguments to function call,expected 0,have 2 错误的时候。
     解决方法:
     选中项目 - Project - Build Settings - ENABLE_STRICT_OBJC_MSGSEND 将其设置为 NO 即可
     
     */
    
    //[[NSObject alloc]init] 在runtime底层实现。相当于:给NSObject 发送alloc和init消息
    NSObject *obj = objc_msgSend(objc_msgSend(objc_getClass("NSObject"), sel_registerName("alloc")), sel_registerName("init"));
    
    
    
    
    /*
     2.地址有两种情况
     2.1 指针指向的对象的内存地址，也就是这个指针保存的内容 <obj>
     2.2 指针自己的内存地址 <&obj>
     */
}






@end
