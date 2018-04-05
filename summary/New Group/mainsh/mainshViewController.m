//
//  mainshViewController.m
//  summary
//
//  Created by NewBoy on 2018/3/22.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "mainshViewController.h"
#import "NSArray+Extension.h"
#include <objc/runtime.h>


@interface mainshViewController ()
@property (nonatomic,weak) NSArray *array;
@end

@implementation mainshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    /*
     1.待解决的问题
    for (int i =0; i < someLargeNumber; i++)
     {
     NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
     NSString *string =@"Abc";
     string = [string lowercaseString];
     string = [string stringByAppendingString:@"xyz"];
     NSLog(@"%@", string);
     [pool release];
     }
     */

//    NSArray *array = @[@"1",@"1",@"1",@"1",@"1",@"2",@"3",@"4",@"5",@"5",@"5",@"6",];
//    NSMutableArray *newArray = [NSMutableArray array];
    //2.使用KVO 去重
//    NSArray *array = @[@"mgen", @"tom", @"martin"];
//    //选择所有字符串的length为新的数组
//    NSLog(@"11--%@", [array valueForKeyPath:@"length"]);
//    //选择最大长度
//    NSLog(@"22--%@", [array valueForKeyPath:@"@max.length"]);

    //遍历一个类的所有属性
    unsigned int count = 0;
    NSMutableArray *array = [NSMutableArray array];
    objc_property_t *properties =  class_copyPropertyList([NSArray class], &count);
    for (int i = 0; i < count; i ++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [[NSString alloc]initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [array addObject:propertyName];
    }
    NSLog(@"这个类的属性 ----%@",array);
    free(properties);


}




@end
