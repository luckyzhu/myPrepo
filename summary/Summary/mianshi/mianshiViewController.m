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
#import "LXButton.h"


@interface mianshiViewController ()
{
    NSString *_lastName;
    
}
//@property(nonatomic,strong)  NSArray *resuletArray;
//@property(nonatomic,strong)  NSArray *array1;
//@property(nonatomic,strong)  NSArray *array2;
//@property(nonatomic,strong)  NSArray *array1AndArray2;
@property(nonatomic,copy)    NSString *lastName;

@end

@implementation mianshiViewController
//创造一个带下划线前缀的实例变量名，同时使用这个属性生成getter 和 setter 方法
//@synthesize lastName = _lastName;
@dynamic lastName;

- (void)viewDidLoad {
    [super viewDidLoad];


    LXButton *button = [LXButton new];
    button.frame =CGRectMake(0, 100, 600, 100);
    button.backgroundColor = [UIColor blueColor];
//    [button setImage:[UIImage imageNamed:@"111.png"] forState:UIControlStateNormal];
    [button setTitle:@"xxxxx" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
}



/*
 @synthesize 和 @property 做了三件事:
  setter + getter + _ivar
 
 @synthesize 的语义是如果你没有手动实现 setter 方法和 getter 方法，那么编译器会自动为你加上这两个方法
 
 @dynamic 告诉编译器，属性的 setter 与 getter 方法由用户自己实现，不自动生成
 
 动态绑定:编译时没问题，运行时才执行相应的方法
 
 2.为什么声明一个属性，同时重写set和get方法会报错？
   因为@property默认给该属性生成getter和setter方法.当getter和setter方法同时被重写时.则系统就不会自动生成getter和setter方法了，也不会自动帮你生成_myDic实例变量,所以不会识别.
 2.1> 如果 @synthesize和 @dynamic都没写，默认lastName = _lastName;
 
 */
-(void)setLastName:(NSString *)lastName
{
        NSLog(@"setLastName");
}

-(NSString *)lastName
{
    return _lastName;
}











/**
 1.KVC:Key-value coding.键值编码.在iOS中允许开发者通过key名（字符串）访问对象的属性（读写某个对象的属性）
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
//     Person *testModel = [Person new];
//     [testModel setValue:@(10) forKey:@"age"];
     //    testModel.name = @"小明name";
     //    testModel->_name = @"小明_name";
     //    testModel->_isName = @"小明_isName";
     //    testModel->isName = @"小明isName";
    
    Person *testModel = [Person new];
    [testModel setValue:@"哈哈" forKey:@"level"];
    //    NSLog(@"level的值----%@",testModel.level);
    NSLog(@"_level的值----%@",testModel->_level);
    NSLog(@"isLevel的值----%@",testModel->isLevel);
    NSLog(@"_isLevel的值----%@",testModel->_isLevel);
}


















@end
