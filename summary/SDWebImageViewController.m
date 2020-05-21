//
//  SDWebImageViewController.m
//  summary
//
//  Created by NewBoy on 2020/5/15.
//  Copyright © 2020 LX. All rights reserved.
//

#import "SDWebImageViewController.h"
#import "UIImageView+WebCache.h"
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
}


@end
