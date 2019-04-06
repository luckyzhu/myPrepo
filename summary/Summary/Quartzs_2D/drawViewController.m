//
//  drawViewController.m
//  summary
//
//  Created by NewBoy on 2018/3/23.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "drawViewController.h"
#import "drawView.h"

@interface drawViewController ()

@end

@implementation drawViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    drawView *view = [drawView new];
    view.frame = self.view.bounds;
    view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view];




}




@end
