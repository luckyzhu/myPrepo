//
//  mianshiViewController.m
//  summary
//
//  Created by ZhuLuxi on 2018/3/28.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "mianshiViewController.h"
#import "LXControl.h"
#import <Masonry.h>
#import <objc/runtime.h>
#import "Person.h"
#import "NSArray+Extension.h"

@interface mianshiViewController ()
@property(nonatomic,strong)  NSArray *resuletArray;
@property(nonatomic,strong)  NSArray *array1;
@property(nonatomic,strong)  NSArray *array2;
@property(nonatomic,strong)  NSArray *array1AndArray2;
@property(nonatomic,copy)    NSString *lastName;

@end

@implementation mianshiViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Person *testModel = [Person new];
    [testModel setValue:@(10) forKey:@"age"];

//    testModel.name = @"小明name";
//    testModel->_name = @"小明_name";
//    testModel->_isName = @"小明_isName";
//    testModel->isName = @"小明isName";

    NSLog(@"111---%@",[[testModel valueForKey:@"age"] class]);

}


/**
 KVC:Key-value coding.键值编码.在iOS中允许开发者通过key名（字符串）访问对象的属性（读写某个对象的属性）
 1> setValue:forKey是怎么通过字符串key找到对象内部的key？
     以level为例
   1.1 如果类声明了该属性，首先调用setLevel:(set方法)
   1.2 找不到set方法.找_level成员变量
   1.3 找不到_level成员变量.找_isLevel成员变量
   1.4 找不到_isLevel成员变量.找isLevel成员变量
   1.5 找不到isLevel成员变量.调用setValue:forUndefinedKey: 找不到这个key
 
 2.使用KVC应该注意什么？
   2.1 调用setValue:forKey 和valueForKey 方法时。如果传的key不存在，如果不重写方法，会崩溃
   2.2 对非对象属性传递一个nil的值。比如对int类型的age传递nil，如果不重写setNilValueForKey，会崩溃。
 
 */
- (void)howKVCLookForTheKey{
    Person *testModel = [Person new];
    [testModel setValue:@"哈哈" forKey:@"level"];
    //    NSLog(@"level的值----%@",testModel.level);
    NSLog(@"_level的值----%@",testModel->_level);
    NSLog(@"isLevel的值----%@",testModel->isLevel);
    NSLog(@"_isLevel的值----%@",testModel->_isLevel);
}


















@end
