//
//  SDWebImageViewController.m
//  summary
//
//  Created by NewBoy on 2020/5/15.
//  Copyright © 2020 LX. All rights reserved.
//

#import "SDWebImageViewController.h"
#import "UIImageView+WebCache.h"
#import "YYTestViewController.h"

@interface SDWebImageViewController ()

@end

@implementation SDWebImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSString *imageStr = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1589523435658&di=403e362644304b7bee6b10da8b6c054d&imgtype=0&src=http%3A%2F%2Fa2.att.hudong.com%2F36%2F48%2F19300001357258133412489354717.jpg";
    //占位图片
    UIImage *holderImage = [UIImage imageNamed:@"123.png"];

    //创建UIImageView
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 200, 200, 100)];
    [imageView sd_setImageWithURL:[NSURL URLWithString:imageStr] placeholderImage:holderImage];
    [self.view addSubview:imageView];

    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(100, 400, 50, 50);
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor redColor];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    button.exclusiveTouch = YES;
    [self.view addSubview:button];


}

- (void)btnClick {

    YYTestViewController *vc = [[YYTestViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"test通知" object:nil];

}


@end
