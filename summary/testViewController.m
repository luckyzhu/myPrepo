//
//  testViewController.m
//  summary
//
//  Created by NewBoy on 2018/8/29.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "testViewController.h"
#import "subViewController.h"
#import "firstViewController.h"
#import "SUMTestView.h"
#import "Student.h"
#import "summary-Swift.h"


@interface testViewController ()
@property (nonatomic,strong) NSArray *testArray;


@end

@implementation testViewController

- (void)viewDidLoad{
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    self.testArray = mutableArray;
    
    NSLog(@"%p",mutableArray);
    NSLog(@"%p",self.testArray);
}



@end
