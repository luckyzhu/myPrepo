//
//  ViewController.m
//  summary
//
//  Created by ZhuLuxi on 2017/11/20.
//  Copyright © 2017年 LX. All rights reserved.
//
#import <objc/message.h>
#import "ViewController.h"
#import "Student.h"
#import "Person.h"
#import "subPerson.h"


//@interface Student:NSObject
//{
//    NSString *_name;
//    int _age;
//    
//}
//@end
#import <AVFoundation/AVFoundation.h>
#import  "AFNetworking.h"
#import <objc/runtime.h>
#import "Person.h"
#import "subPerson.h"
#import "CameraViewController.h"
#import <AVFoundation/AVCaptureDevice.h>
#import "BBAECutomCameraViewController.h"
#import "BBAEPreviewPhotoViewController.h"
#import "LXNavigationViewController.h"
#import "Masonry.h"

@interface ViewController()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *topLabel;
@property (nonatomic,strong) UILabel *bottomLabel;

@property (nonatomic,strong)UIImageView *lastImage;
@property (nonatomic,strong)UIImageView *originImage;






@end

@implementation ViewController

-(instancetype)init{

    if (self = [super init]) {
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PostAction) name:@"调用ViewController里的loadview方法" object:nil];
    }
    return self;
}

//- (void)PostAction{
//
//    NSLog(@"接收到通知...要调用loadview方法..");
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//
//    __weak typeof(self)weakSelf = self;
//    [self.view addSubview:self.topLabel];
//    [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.equalTo(weakSelf.view).offset(0);
//        make.height.equalTo(@30);
//    }];
//
//    [self.view addSubview:self.bottomLabel];
//    [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(weakSelf.view).offset(0);
//        make.bottom.equalTo(weakSelf.view.mas_safeAreaLayoutGuideBottom).offset(0);
//        make.height.equalTo(@30);
//    }];
//
//
//}

//调用时机：[super loadView]  第一次访问view的时候。
-(void)setView:(UIView *)view
{
    [super setView:view];

    NSLog(@"setViewsetViewsetView");
}
-(UILabel *)topLabel
{
    if (_topLabel == nil) {
        _topLabel = [[UILabel alloc]init];
        _topLabel.text = @"父vc的label...";
        _topLabel.textColor = [UIColor cyanColor];
        _topLabel.textAlignment = NSTextAlignmentCenter;
        _topLabel.backgroundColor = [UIColor lightGrayColor];
    }
    return _topLabel;
}

-(UILabel *)bottomLabel
{
    if (_bottomLabel == nil) {
        _bottomLabel = [[UILabel alloc]init];
        _bottomLabel.text = @"父vc的bottom label...";
        _bottomLabel.textColor = [UIColor blueColor];
        _bottomLabel.textAlignment = NSTextAlignmentCenter;
        _bottomLabel.backgroundColor = [UIColor cyanColor];
    }
    return _bottomLabel;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

//    if ([self.view.subviews containsObject:self.topLabel]) {
//        [self.view addSubview:self.topLabel];
//    }


}

-(void)loadView
{
    [super loadView];




}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


//    if ([self respondsToSelector:@selector(loadView)]) {
//        NSLog(@"这个类调用了loadView...");
//        [self loadView];
//    }

//    [self.view addSubview:self.topLabel];

//    CGRect viewFrame = self.view.frame;
//    self.view.bounds = CGRectMake(viewFrame.origin.x, viewFrame.origin.y-30, viewFrame.size.width, viewFrame.size.height-30-30);
//
//    _bottomLabel = [[UILabel alloc]init];
//    _bottomLabel.text = @"父vc的bottom label...";
//    _bottomLabel.textColor = [UIColor cyanColor];
//    _bottomLabel.textAlignment = NSTextAlignmentCenter;
//    _bottomLabel.backgroundColor = [UIColor cyanColor];
//    _bottomLabel.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds)-88-34, CGRectGetWidth(self.view.bounds), 30);
//    [self.view addSubview:_bottomLabel];



    self.edgesForExtendedLayout = UIRectEdgeNone;

    __weak typeof(self)weakSelf = self;
    [self.view addSubview:self.topLabel];
    [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf.view).offset(0);
        make.height.equalTo(@30);
    }];

    [self.view addSubview:self.bottomLabel];
    [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view).offset(0);
        make.bottom.equalTo(weakSelf.view.mas_safeAreaLayoutGuideBottom).offset(0);
        make.height.equalTo(@30);
    }];






//    self.view.backgroundColor = [UIColor colorWithRed: 17/225.0 green:28/225.0 blue:36/225.0 alpha:1.0];
//    self.view.backgroundColor = [UIColor lightGrayColor];
//
//
//
//    UIImageView *imageView = [[UIImageView alloc]init];
//    imageView.image = [UIImage imageNamed:@"22.jpeg"];
//    imageView.frame = CGRectMake(0, 100, 200, 200);
//    [self.view addSubview:imageView];
//
//    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 100, 200, 200)];
//    toolBar.barStyle = UIBarStyleBlackTranslucent;
//    toolBar.backgroundColor = [UIColor colorWithRed: 17/225.0 green:28/225.0 blue:36/225.0 alpha:0.6];
//    [self.view addSubview:toolBar];
//
//    return;
//
//    UIButton *button = [[UIButton alloc]init];
//    button.frame = CGRectMake(30, 100, 300, 200);
//    [button setTitle:@"跳转" forState:UIControlStateNormal];
//    button.backgroundColor = [UIColor blueColor];
//    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
//    self.button = button;
//
//    UIImageView *originImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"123"]];
//    originImage.frame = CGRectMake(0, 120, originImage.frame.size.width, originImage.frame.size.height);
//    [self.view addSubview:originImage];
//    self.originImage = originImage;
//
//    //449, 291
//    NSLog(@"originImage---%@",NSStringFromCGRect(originImage.frame));
//
//
//    UIImageView *lastImage = [[UIImageView alloc]init];
//    lastImage.frame = CGRectMake(0, self.view.frame.size.height-200,300, 100);
//    [self.view addSubview:lastImage];
//    self.lastImage = lastImage;


//
//    UILabel *topLabel = [[UILabel alloc]init];
//    topLabel.text = @"您的升级申请已提交";
//    topLabel.textColor = [UIColor blueColor];
//    topLabel.font = [UIFont systemFontOfSize:13];
//    topLabel.frame = CGRectMake(50, 300, 200, 30);
//    topLabel.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:topLabel];
//    self.topLabel = topLabel;
//
//    UILabel *topLabel1 = [[UILabel alloc]init];
//    topLabel1.text = @"您的升级申请已提交";
//    topLabel1.textColor = [UIColor whiteColor];
//    topLabel1.font = [UIFont systemFontOfSize:13];
//    topLabel1.backgroundColor = [UIColor redColor];
//    topLabel1.frame = CGRectMake(50, 300, 200, 30);
//    [self.view addSubview:topLabel1];

    NSLog(@"77777");

}

CGAffineTransform  GetCGAffineTransformRotateAroundPoint(float centerX, float centerY ,float x ,float y ,float angle)
{
    x = x - centerX; //计算(x,y)从(0,0)为原点的坐标系变换到(CenterX ，CenterY)为原点的坐标系下的坐标
    y = y - centerY; //(0，0)坐标系的右横轴、下竖轴是正轴,(CenterX,CenterY)坐标系的正轴也一样

    CGAffineTransform  trans = CGAffineTransformMakeTranslation(x, y);
    trans = CGAffineTransformRotate(trans,angle);
    trans = CGAffineTransformTranslate(trans,-x, -y);
    return trans;


}

//弹出相机
- (void)btnClick{
    NSLog(@"888");


    LXNavigationViewController *imageVc = [LXNavigationViewController new];
    imageVc.view.backgroundColor = [UIColor blueColor];
    [self presentViewController:imageVc animated:YES completion:nil];

    /*
     锚点  (0,0)  代表试图左上角
     */
//    self.topLabel.layer.anchorPoint = CGPointMake(1,1);
//    self.topLabel.transform = CGAffineTransformMakeRotation(M_PI_2);
//    self.topLabel.transform = CGAffineTransformRotate(<#CGAffineTransform t#>, <#CGFloat angle#>)
//
//    float centerX = self.topLabel.bounds.size.width/2;
//    float centerY = 0;
//    float x = self.topLabel.bounds.size.width/2;
//    float y = self.topLabel.bounds.size.height;
//
//    CGAffineTransform trans = GetCGAffineTransformRotateAroundPoint(centerX,centerY ,x ,y ,90.0/180.0*M_PI);
//    self.topLabel.transform = CGAffineTransformIdentity;
//    self.topLabel.transform = trans;
//
//    NSLog(@"最后的frame----%@",NSStringFromCGRect(self.topLabel.frame));
//    return;


//    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
//
//
//    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//
//    if (status != AVAuthorizationStatusAuthorized && status != AVAuthorizationStatusNotDetermined) {
//
//       NSLog(@"权限不够....");
//        return;
//    }

//    BBAECutomCameraViewController *imagePickerVC = [[BBAECutomCameraViewController alloc] init];
//    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
//    {
//        sourceType = UIImagePickerControllerSourceTypeCamera;
//        imagePickerVC.delegate = self;
////        imagePickerVC.allowsEditing = YES;
//        imagePickerVC.sourceType = sourceType;
//        [imagePickerVC setShowsCameraControls:NO];
//        [self presentViewController:imagePickerVC animated:YES completion:nil];
//    }

//    测试系统自带的闪光灯
//    UIImagePickerController *imagePickerVC = [[UIImagePickerController alloc] init];
//    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
//    {
//        sourceType = UIImagePickerControllerSourceTypeCamera;
//        imagePickerVC.delegate = self;
//        imagePickerVC.allowsEditing = YES;
//        imagePickerVC.sourceType = sourceType;
//        [self presentViewController:imagePickerVC animated:YES completion:nil];
//    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo{

    NSLog(@"1111111");
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{

    NSLog(@"22222---%@",info);
    [picker dismissViewControllerAnimated:YES completion:nil];

    UIImage *srcImage = [info valueForKey:UIImagePickerControllerEditedImage];
    if (srcImage == nil)
        srcImage = [info valueForKey:UIImagePickerControllerOriginalImage];

    // UIImageOrientationUp  逆时针旋转90度 当scale设置为1的时候，新创建的图像将和原图像尺寸一摸一样
     srcImage =  [UIImage imageWithCGImage:srcImage.CGImage scale:srcImage.scale orientation:UIImageOrientationUp];
//    UIImage *tempImage =  [UIImage imageWithCGImage:srcImage.CGImage scale:srcImage.scale orientation:UIImageOrientationUp];

//    UIImage *tempImage = srcImage;
//
//    CGFloat imageWidth = self.view.frame.size.width;
//    CGFloat imageHeight = self.view.frame.size.height;
//
////    UIGraphicsBeginImageContext(CGSizeMake(imageWidth, imageHeight));
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageWidth, imageHeight), NO, 0);
//
//    // 绘制改变大小的图片
//    [tempImage drawInRect:CGRectMake(0, 0, imageWidth, imageHeight)];
//    // 从当前context中创建一个改变大小后的图片
//    UIImage* destImage = UIGraphicsGetImageFromCurrentImageContext();
//    // 使当前的context出堆栈
//    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
//
//    //跳转到下一个预览界面
//    BBAEPreviewPhotoViewController *previewVc = [[BBAEPreviewPhotoViewController alloc]initWithImage:destImage];
//    previewVc.photoBlock = ^{
        [self.button setImage:srcImage forState:UIControlStateNormal];
//    };
//    [picker pushViewController:previewVc animated:YES];

}

////相机弹出的“取消”按钮。如果实现此方法，相当于拦截取消方法
//- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
//
//   NSLog(@"33333--");
//}




@end
