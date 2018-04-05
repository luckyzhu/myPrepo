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

@interface mianshiViewController ()

@end

@implementation mianshiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    LXControl *control1 = [[LXControl alloc]initWithImageHeight:50.0 imageName:@"111.png" labelText:@"哈哈哈哈哈哈哈哈哈哈哈哈"];
    [control1 addTarget:self action:@selector(contorl1Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:control1];
    __weak typeof(self) weakSelf = self;
    [control1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.view.mas_top).offset(60);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(10);
        make.width.mas_equalTo(@100);
    }];
    
    LXControl *control2 = [[LXControl alloc]initWithImageHeight:50.0 imageName:@"111.png" labelText:@"哈哈哈哈哈"];
    [control2 addTarget:self action:@selector(contorl1Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:control2];
    [control2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.view.mas_top).offset(60);
        make.left.mas_equalTo(control1.mas_right).offset(10);
        make.width.mas_equalTo(@100);
    }];
    
    
}
 - (void)contorl1Click{
     
     NSLog(@"contorl1Click");
    
     }

@end
