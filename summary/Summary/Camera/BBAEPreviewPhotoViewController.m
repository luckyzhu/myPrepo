//
//  BBAEPreviewPhotoViewController.m
//  summary
//
//  Created by NewBoy on 2018/5/29.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "BBAEPreviewPhotoViewController.h"
#import "Masonry.h"

@interface BBAEPreviewPhotoViewController ()

@property (nonatomic,strong) UIImage *image;
@end

@implementation BBAEPreviewPhotoViewController
-(instancetype)initWithImage:(UIImage *)image{
    if (self = [super init]) {
        self.image = image;

    }

    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];


    UIView *topView = [[UIView alloc]init];
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset([[UIApplication sharedApplication] statusBarFrame].size.height);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(@44);
    }];

    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(0, 7, 50, 44);
    button.titleLabel.textColor = [UIColor redColor];
    [button setImage:[UIImage imageNamed:@"back_white"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:button];


    UILabel *topLabel = [[UILabel alloc]init];
    topLabel.text = @"预览";
    topLabel.textColor = [UIColor whiteColor];
    topLabel.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:topLabel];
    [topLabel sizeToFit];
    [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topView.mas_top).offset(20);
        make.centerX.mas_equalTo(topView.mas_centerX);
    }];

    //要预览的图片  204 325
    CGFloat topImageWidth = 325;
    CGFloat topImageHeight = 204;
    UIImageView *topImage = [[UIImageView alloc]init];
    topImage.image = self.image;
    [topView layoutIfNeeded];
    topImage.frame = CGRectMake((self.view.frame.size.width-topImageWidth)/2, CGRectGetMaxY(topView.frame)+75, topImageWidth, topImageHeight);
    [self.view addSubview:topImage];

    //确认label
    UILabel *confirmLabel = [[UILabel alloc]init];
    confirmLabel.text = @"*请确认您的证件信息完整呈现";
    confirmLabel.textColor = [UIColor whiteColor];
    confirmLabel.numberOfLines = 0;
    confirmLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:confirmLabel];
    [confirmLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topImage.mas_bottom).offset(10);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.lessThanOrEqualTo(@(self.view.frame.size.width - 30));
    }];

    //确定 重拍
    UIButton *sureButton = [[UIButton alloc]init];
    [sureButton setTitle:@"确定" forState:UIControlStateNormal];
    [sureButton addTarget:self action:@selector(sureButtonClick) forControlEvents:UIControlEventTouchUpInside];
    sureButton.layer.masksToBounds = YES;
    sureButton.layer.cornerRadius = 3;
    [self.view addSubview:sureButton];
    [sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(22);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-22);
        make.size.mas_equalTo(CGSizeMake(225, 44 ));
    }];


    UIButton *rephotoButton = [[UIButton alloc]init];
    [rephotoButton setTitle:@"重拍" forState:UIControlStateNormal];
    rephotoButton.layer.masksToBounds = YES;
    rephotoButton.layer.cornerRadius = 3;
    rephotoButton.layer.borderWidth = 0.5;
    rephotoButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rephotoButton addTarget:self action:@selector(rephotoButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rephotoButton];
    [rephotoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(sureButton.mas_top);
        make.right.mas_equalTo(self.view.mas_right).offset(-22);
        make.left.mas_equalTo(sureButton.mas_right).offset(10);
        make.height.mas_equalTo(sureButton.mas_height);
    }];


}

#pragma mark -  按钮点击方法

- (void)sureButtonClick{
    //确定跳转到原来的预览身份证界面
    if (self.photoBlock) {
        self.photoBlock();
    }
    [self dismissViewControllerAnimated:YES completion:^{
    }];

}

- (void)rephotoButtonClick{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)leftClick{

    [self.navigationController popViewControllerAnimated:YES];
}

@end
