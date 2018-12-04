//
//  NSArrayViewController.m
//  summary
//
//  Created by NewBoy on 2018/11/2.
//  Copyright © 2018年 LX. All rights reserved.
//
#import "NSArrayViewController.h"

@interface NSArrayViewController ()

@end

@implementation NSArrayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    NSArray *arr1 = @[@"1",@"2",@"3",@"4",];
    NSArray *arr2 = @[@"10",@"2",@"3",@"40",];



    //arr2不在arr1的元素
    NSPredicate * filterPredicate = [NSPredicate predicateWithFormat:@"NOT (SELF IN %@)",arr1];
    NSArray * filter = [arr2 filteredArrayUsingPredicate:filterPredicate];
    NSLog(@"arr2不在arr1的元素----%@",filter);


    //arr1不在arr2的元素
    NSPredicate * filterPredicate2 = [NSPredicate predicateWithFormat:@"NOT (SELF IN %@)",arr2];
    NSArray * filter2 = [arr1 filteredArrayUsingPredicate:filterPredicate2];
    NSLog(@"arr1不在arr2的元素----%@",filter2);


    //arr1 arr2共同个元素
    NSPredicate * filterPredicate3 = [NSPredicate predicateWithFormat:@"(SELF IN %@)",arr2];
    NSArray * filter3 = [arr1 filteredArrayUsingPredicate:filterPredicate3];
    NSLog(@"共同元素----%@",filter3);


}


@end
