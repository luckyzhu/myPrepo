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




@interface ViewController()

@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,weak) UITableView *tableView;

@end


@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSString *str1 = @"11111111";
    
    NSString *str2 = @"222222";

    if ([str1 compare:str2] == NSOrderedDescending) {
      NSLog(@"str1比str2大...");
    }else{
      NSLog(@"str1不大于str2...");
    }

//    if ([str1 longLongValue] > [str2 longLongValue]) {
//        NSLog(@"str2比str1大...");
//    }else{
//        NSLog(@"str2不大于。。str1不大于...");
//    }

    
    
    

}



@end
