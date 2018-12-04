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
#import "subViewController.h"
#import "CameraViewController.h"
#import <AVFoundation/AVCaptureDevice.h>
#import "BBAECutomCameraViewController.h"
#import "BBAEPreviewPhotoViewController.h"
#import "LXNavigationViewController.h"
#import "firstViewController.h"
#import "Masonry.h"
#import "BBAESlideShowView.h"
#import "BannerScrollView.h"
#import "BBAESlideIntervalView.h"

@interface ViewController()<UINavigationControllerDelegate, UIImagePickerControllerDelegate,BBAESlideShowViewDelegate>

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

- (void)dismiss{

    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)buttonClick{
    
    subViewController *subVc = [subViewController new];
    subVc.view.backgroundColor = [UIColor redColor];
    subVc.title = nil;
    [self.navigationController pushViewController:subVc animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button setTitle:@"按钮一" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    return;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismiss) name:@"第一个vc dismiss" object:nil];



    return;

    NSArray *imageArray =  @[
                             @"http://img.zcool.cn/community/0117e2571b8b246ac72538120dd8a4.jpg@1280w_1l_2o_100sh.jpg",
                             @"http://img.zcool.cn/community/01f09e577b85450000012e7e182cf0.jpg@1280w_1l_2o_100sh.jpg",
                             @"http://img.zcool.cn/community/0125fd5770dfa50000018c1b486f15.jpg@1280w_1l_2o_100sh.jpg",
                             @"http://img05.tooopen.com/images/20141217/sy_77493739982.jpg",
                             @"http://img.zcool.cn/community/01102d57d161e80000012e7e57d0c9.jpg@1280w_1l_2o_100sh.jpg",
                             @"http://pic.58pic.com/58pic/15/57/84/70H58PICCJt_1024.jpg",
                             @"http://pic38.nipic.com/20140212/17942401_101320663138_2.jpg",
                             ];

//    BannerScrollView *slideView = [[BannerScrollView alloc]initWithImageUrls:imageArray clickBlock:^(NSInteger index) {
//
//        NSLog(@"index---%zd",index);
//    }];

    BBAESlideIntervalView *slideView = [[BBAESlideIntervalView alloc]initWithCGSize:CGSizeMake(375, 200) dataArray:imageArray];
    [self.view addSubview:slideView];
    [slideView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(100);
        make.left.right.mas_equalTo(self.view).offset(0);
        make.height.mas_equalTo(@200);
    }];

//    BBAESlideShowView *slideView = [[BBAESlideShowView alloc]initWithCGSize:CGSizeMake(self.view.frame.size.width, 200) dataArray:imageArray];
////    slideView.hasPageControl = YES;
////    slideView.scrollType = BBAESlideShowViewScrollType_Timer;
//    slideView.delegate = self;
////    slideView.frame = CGRectMake(0, 100, self.view.frame.size.width, 200);
//    [self.view addSubview:slideView];


}

-(void)slideShowViewDidClick:(NSInteger)index{

    NSLog(@"点击的是第%zd个图片...",index);
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


    firstViewController *firstVc = [[firstViewController alloc]init];
    [self presentViewController:firstVc animated:YES completion:nil];


//    LXNavigationViewController *imageVc = [LXNavigationViewController new];
//    imageVc.view.backgroundColor = [UIColor blueColor];
//    [self presentViewController:imageVc animated:YES completion:nil];

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
