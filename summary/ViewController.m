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

//@interface Student:NSObject
//{
//    NSString *_name;
//    int _age;
//    
//}
//@end


@interface ViewController ()



@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    Student *stu = [[Student alloc]init];
    NSLog(@"111--%@",stu.class);
    
//    NSString* str = @"Hello World";
    
    

   


}



@end
