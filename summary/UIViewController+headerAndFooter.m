//
//  UIViewController+headerAndFooter.m
//  summary
//
//  Created by NewBoy on 2018/9/2.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "UIViewController+headerAndFooter.h"
#import <objc/message.h>
#import "ViewController.h"

@implementation UIViewController (headerAndFooter)
+(void)load{

    NSLog(@"加载分类的时候调用");

        //获得对象方法
        Method loadViewMethod =  class_getInstanceMethod([UIViewController class], @selector(loadView));
        Method bbaeLoadViewMethod = class_getInstanceMethod([UIViewController class], @selector(bbae_loadView));
        //进行方法调用
        method_exchangeImplementations(loadViewMethod, bbaeLoadViewMethod);




    //获得对象方法
//    Method viewdidLoadMethod =class_getClassMethod([UIViewController class], @selector(viewDidLoad));
//    Method bbaeViewdidLoadMethod=class_getClassMethod([UIViewController class], @selector(bbae_viewDidLoad));
//    //进行方法调用
//    method_exchangeImplementations(viewdidLoadMethod, bbaeViewdidLoadMethod);

}
- (void)bbae_loadView{

    [self bbae_loadView];

    // 获取类的父类
//    Class vc  = class_getSuperclass([self class]);
////    [vc bbae_loadView];
//
//    NSLog(@"父类是----%@",[vc class]);
     //在调用一次super loadview就能达到目的
//
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"调用ViewController里的loadview方法" object:nil];
//
//    NSLog(@"要替换的方法...");

}

@end
