//
//  BlockViewController.m
//  summary
//
//  Created by ZhuLuxi on 2018/5/27.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "BlockViewController.h"

@interface BlockViewController ()

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    /*
     1.block的本质是一个oc对象
     ,用clang翻译出C++代码，可以发现其内部有一个isa指针
     
     */
    //1.1 写一个block 取其父类的父类，结果是NSObject
//    NSLog(@"111---%@",[[[[^(){
//        NSLog(@"1111----");
//    } class] superclass] superclass] superclass]);
    
    
    
    //2. 不访问auto变量的block 是__NSGlobalBlock__
//    NSLog(@"3333-----%@",[^(){
//        NSLog(@"block----------");
//    } class]);
    
    /*
     3. 访问auto变量的block __NSStackBlock__
     3. 访问auto变量的block copy之后是 __NSMallocBlock__
     */
    
    int age = 10;
    NSLog(@"3333-----%@",[^(){
        NSLog(@"age----%d",age);
    } class]);
    
    NSLog(@"4444-----%@",[[^(){
        NSLog(@"age----%d",age);
    } copy] class]);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}



@end
