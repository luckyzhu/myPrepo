//
//  BBAECutomCameraViewController.m
//  summary
//
//  Created by NewBoy on 2018/5/29.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "Masonry.h"
#import "BBAECutomCameraViewController.h"
#import <objc/runtime.h>
#import "BBAEPreviewPhotoViewController.h"
#import <AVFoundation/AVCaptureDevice.h>

@interface BBAECutomCameraViewController ()
@property(nonatomic,strong) UIView *overlayView;

@property(nonatomic, strong) UILabel *tipLabel;

@property(nonatomic, strong) AVCaptureDevice *device;

@end

@implementation BBAECutomCameraViewController

-(void)setSourceType:(UIImagePickerControllerSourceType)sourceType
{
    self.allowsEditing = NO;
    [super setSourceType:sourceType];

}

-(UIView*)createOverlayView
{
    UIView *superView = [[UIView alloc]init];
    superView.backgroundColor = [UIColor clearColor];
    superView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);


    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"camera_border"]];
    imageView.frame = CGRectMake((self.view.frame.size.width - imageView.frame.size.width)/2, (self.view.frame.size.height-100 - imageView.frame.size.height)/2, imageView.frame.size.width, imageView.frame.size.height);
    [superView addSubview:imageView];

    //照相按钮
    CGFloat takeCameraBtnWidth = 80;
    CGFloat takeCameraBtnHeight = 40;

    UIButton *takeCameraBtn = [[UIButton alloc]init];
    takeCameraBtn.frame = CGRectMake(0, self.view.frame.size.height - 100, self.view.frame.size.width, 100);
    [takeCameraBtn setTitle:@"照相" forState:UIControlStateNormal];
    takeCameraBtn.backgroundColor = [UIColor blueColor];
    [takeCameraBtn addTarget:self action:@selector(takeCameraBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:takeCameraBtn];

    _tipLabel = [UILabel new];
    _tipLabel.textColor = [UIColor whiteColor];
    _tipLabel.text = @"啊哈哈哈哈";
    _tipLabel.textAlignment = NSTextAlignmentCenter;
    _tipLabel.frame = CGRectMake(-50, 200, 200, 30);
    _tipLabel.transform = CGAffineTransformMakeRotation(M_PI_2);
    [superView addSubview:_tipLabel];

    //topView
    UIView *topView = [[UIView alloc]init];
    [superView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(superView);
        make.height.mas_equalTo(@64);
    }];

    //返回键
    UIImageView *leftBtnImage = [[UIImageView alloc]init];
    leftBtnImage.image = [UIImage imageNamed:@"back"];
    leftBtnImage.userInteractionEnabled = YES;
//    leftBtnImage.frame = CGRectMake(20, 20, 50, 50);
    leftBtnImage.contentMode = UIViewContentModeCenter;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(leftBtnImageClick)];
    [leftBtnImage addGestureRecognizer:tapGesture];
    [topView addSubview:leftBtnImage];
    [leftBtnImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(topView.mas_centerY);
        make.left.mas_equalTo(@20);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];

    //闪光灯状态view
    UIView *flashLightView = [[UIView alloc]init];

    //调整想 x和y
//    flashLightView.frame = CGRectMake(self.view.frame.size.width - 80, 60, 100, 30);
    flashLightView.frame = CGRectMake(self.view.frame.size.width - 280, 60, 210, 30);
//    flashLightView.transform = CGAffineTransformMakeRotation(M_PI_2);
//    flashLightView.layer.anchorPoint = CGPointMake(0, 0); // 最终按锚点显示其准确性
    flashLightView.backgroundColor = [UIColor redColor];
    [superView addSubview:flashLightView];

    //闪光灯图片按钮
    UIButton *flashBtn = [[UIButton alloc]init];
    flashBtn.frame = CGRectMake(0, 0, 30, 30);
    [flashBtn setImage:[UIImage imageNamed:@"auto"] forState:UIControlStateNormal];
    flashBtn.backgroundColor = [UIColor blueColor];
    flashBtn.contentMode = UIViewContentModeCenter;
    [flashBtn addTarget:self action:@selector(flashBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [flashLightView addSubview:flashBtn];


    //自动 打开 关闭
    NSArray *array = @[@"自动",@"打开",@"关闭"];
    CGFloat buttonWidth = (flashLightView.frame.size.width -flashBtn.frame.size.width) / array.count ;
    CGFloat buttonHeight = flashLightView.frame.size.height;
    for (int i = 0; i < array.count; i++) {
        UIButton *button = [[UIButton alloc]init];
        button.frame = CGRectMake(CGRectGetMaxX(flashBtn.frame) + i * buttonWidth, 0, buttonWidth, buttonHeight);
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100 + i;
        [flashLightView addSubview:button];
    }



    return superView ;
}


#pragma mark -按钮点击方法
- (void)buttonClick:(UIButton *)button{

    //创建输入设备
    if (![self.device hasFlash]) return;
    [self.device lockForConfiguration:nil];
    switch (button.tag) {
        case 100:
        {
            NSLog(@"点击了自动-----");
            [self.device setFlashMode:AVCaptureFlashModeAuto];
            [self.device setTorchMode:AVCaptureTorchModeAuto];
        }
            break;
        case 101:
        {
            NSLog(@"点击了打开-----");
            [self.device setFlashMode:AVCaptureFlashModeOn];
            [self.device setTorchMode:AVCaptureTorchModeOn];

        }
            break;
        case 102:
        {
            NSLog(@"点击了关闭-----");
            [self.device setFlashMode:AVCaptureFlashModeOff];
            [self.device setTorchMode:AVCaptureTorchModeOff];

        }
            break;

        default:
            break;
    }

    [self.device unlockForConfiguration];


}


- (void)flashBtnClick{


}
- (void)takeCameraBtnClick{

    [self takePicture];
    NSLog(@"takeCameraBtnClick");
}

- (void)leftBtnImageClick{

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//
    self.overlayView = [self createOverlayView];
    self.cameraOverlayView = self.overlayView;

    self.view.backgroundColor = [UIColor blueColor];


//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(leftBtnClick)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"左边" style:UIBarButtonItemStyleDone target:self action:@selector(leftBtnClick)];

    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];

//    unsigned int count;
//    Ivar *ivarList = class_copyIvarList([UIImagePickerController class], &count);
//    for (int i = 0; i < count; i++) {
//        Ivar ivar = ivarList[i];
//        NSLog(@"该类的成员变量----%s", ivar_getName(ivar));
//    }
//    free(ivarList);


    CGSize screenBounds = [UIScreen mainScreen].bounds.size;
    CGFloat cameraAspectRatio = 4.0f/3.0f;
    CGFloat camViewHeight = screenBounds.width * cameraAspectRatio;
    CGFloat scale = screenBounds.height / camViewHeight;
    self.cameraViewTransform = CGAffineTransformMakeTranslation(0, (screenBounds.height - camViewHeight) / 2.0);
    self.cameraViewTransform = CGAffineTransformScale(self.cameraViewTransform, scale, scale);

}


- (void)leftBtnClick{
    NSLog(@"leftBtnClick");
}
//
//-(void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//
//    Class shutterButtonClass = nil;
//    Class overlayPreviewBottomBarClass = nil;
//
////    if (iOS9)
////    {
////        shutterButtonClass =  NSClassFromString(@"CMKShutterButton");
////        overlayPreviewBottomBarClass = NSClassFromString(@"PLCropOverlayPreviewBottomBar");
////    }
////    else
////    {
//        shutterButtonClass =  NSClassFromString(@"CAMShutterButton");
//        overlayPreviewBottomBarClass = NSClassFromString(@"PLCropOverlayPreviewBottomBar");
//
////    }
//
//    [self addInnerButtonAction:self.view shutterButtonClass:shutterButtonClass overlayPreviewBottomBarClass:overlayPreviewBottomBarClass];
//}


@end
