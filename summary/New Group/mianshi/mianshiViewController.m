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
#import "test.h"
#import "NSArray+Extension.h"



@interface mianshiViewController ()
@property(nonatomic,strong)  NSArray *resuletArray;
@property(nonatomic,strong)  NSArray *array1;
@property(nonatomic,strong)  NSArray *array2;
@property(nonatomic,strong)  NSArray *array1AndArray2;


@end

@implementation mianshiViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    
}

- (void)testModel{
    test *model1 = [[test alloc]init];
    model1.name = @"小明";
    model1.height = 12.01;
    model1.age = [NSNumber numberWithInteger:20];


    test *model2 = [[test alloc]init];
    model2.name = @"小王";
    model2.height = 77.68;
    model2.age = [NSNumber numberWithInteger:50];

    test *model3 = [[test alloc]init];
    model3.name = @"小三";
    model3.height = 189.99;
    model3.age = [NSNumber numberWithInteger:13];


    test *model4 = [[test alloc]init];
    model4.name = @"小四";
    model4.height = 77.68;
    model4.age = [NSNumber numberWithInteger:20];


    test *model5 = [[test alloc]init];
    model5.name = @"小五";
    model5.height = 189.99;
    model5.age = [NSNumber numberWithInteger:50];

    test *model6 = [[test alloc]init];
    model6.name = @"小六";
    model6.height = 8.19;
    model6.age = [NSNumber numberWithInteger:13];

    self.array1 = @[model1,model2,model3];
    self.array2 = @[model4,model5,model6];
    self.array1AndArray2 = @[self.array1,self.array2];
    self.resuletArray = [self.array1AndArray2 valueForKeyPath:@"height"];
    NSLog(@"1111----%@",self.resuletArray);

    //使用字典去重
    self.array1 = @[@"1",@"1",@"2",@"2",@"3",@"4",@"1",];
    NSArray *resuArray = [NSArray removeTheSameElementInArray:self.array1];
    NSLog(@"去重后的数组---%@",resuArray);
}
@end
