//
//  MasonryViewController.m
//  summary
//
//  Created by NewBoy on 2018/10/12.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "MasonryViewController.h"

@interface MasonryViewController ()

@end

@implementation MasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    /*
     1. [MASViewConstraint setSecondViewAttribute:]  崩溃在此处...
     约束关联到了一个还没有进行初始化的控件或者这个控件为nil

     2.自动布局中的抗压系数 和 抗拉伸系数
    https://blog.csdn.net/x567851326/article/details/51513212
    https://www.jianshu.com/p/e763e784bf2f
     */


}


@end
