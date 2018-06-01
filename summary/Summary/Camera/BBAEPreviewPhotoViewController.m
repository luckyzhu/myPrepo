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

    self.title = @"预览";

    self.view.backgroundColor = [UIColor redColor];

//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"left" style:UIBarButtonItemStyleDone target:self action:@selector(leftBtnClick)];

    UIView *topView = [[UIView alloc]init];
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(20);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(@44);
    }];

    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(20, 7, 30, 30);
    button.titleLabel.textColor = [UIColor redColor];
    [button setImage:[UIImage imageNamed:@"back_white"] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:button];


    UIImageView *topImage = [[UIImageView alloc]init];
    topImage.image = self.image;
    [self.view addSubview:topImage];
    [topImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(75);
        make.left.mas_equalTo(self.view.mas_left).offset(22);
        make.right.mas_equalTo(self.view.mas_right).offset(-22);
        make.height.mas_equalTo(@208);
    }];


    //确定 重拍
    UIButton *sureButton = [[UIButton alloc]init];
    sureButton.frame = CGRectMake(22, self.view.frame.size.height-44-22, 200, 44);
    [sureButton setTitle:@"确定" forState:UIControlStateNormal];
    sureButton.backgroundColor = [UIColor blueColor];
    [sureButton addTarget:self action:@selector(sureButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sureButton];

    UIButton *rephotoButton = [[UIButton alloc]init];
    rephotoButton.frame = CGRectMake(CGRectGetMaxX(sureButton.frame)+10, self.view.frame.size.height-44-22, 50, 44);
    [rephotoButton setTitle:@"重拍" forState:UIControlStateNormal];
    rephotoButton.backgroundColor = [UIColor lightGrayColor];
    [rephotoButton addTarget:self action:@selector(rephotoButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rephotoButton];


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
