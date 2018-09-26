//
//  firstViewController.m
//  summary
//
//  Created by NewBoy on 2018/8/29.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "firstViewController.h"

@interface firstViewController ()

@end

@implementation firstViewController

-(void)loadView
{
    [super loadView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    self.view.backgroundColor = [UIColor redColor];

    UILabel *topLabel = [[UILabel alloc]init];
    topLabel.text = @"firstVc 的label 2222";
    topLabel.frame = CGRectMake(0, 0, 375,30);
    topLabel.textAlignment = NSTextAlignmentCenter;
    topLabel.backgroundColor = [UIColor blueColor];
    [self.view addSubview:topLabel];

    UILabel *bottomLabel = [[UILabel alloc]init];
    bottomLabel.text = @"firstVc 的底部label 2222";
    bottomLabel.frame = CGRectMake(0, CGRectGetHeight(self.view.frame)-88-34-30, CGRectGetWidth(self.view.frame),30);
    bottomLabel.textAlignment = NSTextAlignmentCenter;
    bottomLabel.backgroundColor = [UIColor blueColor];
    [self.view addSubview:bottomLabel];


    UILabel *middleLabel = [[UILabel alloc]init];
    middleLabel.text = @"您的升级申请已提交";
    middleLabel.textColor = [UIColor redColor];
    middleLabel.backgroundColor = [UIColor lightGrayColor];
    middleLabel.frame = CGRectMake(0, 200, self.view.frame.size.width, 100);
    middleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:middleLabel];


}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    NSLog(@"viewWillAppear");
}


@end
