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
#import "LXTestView.h"
#import "subViewController.h"
#import "testViewController.h"
#import "BBAEFNB.h"


@interface ViewController()<UINavigationControllerDelegate, UIImagePickerControllerDelegate,BBAESlideShowViewDelegate,LXTestViewDelegate>

@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,strong) UIButton *button;


@property (nonatomic,strong)UIImageView *lastImage;
@property (nonatomic,strong)UIImageView *originImage;
@property (nonatomic,strong) Person *person;




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

//
//-(UILabel *)topLabel
//{
//    if (_topLabel == nil) {
//        _topLabel = [[UILabel alloc]init];
//        _topLabel.text = @"父vc的label...";
//        _topLabel.textColor = [UIColor cyanColor];
//        _topLabel.textAlignment = NSTextAlignmentCenter;
//        _topLabel.backgroundColor = [UIColor lightGrayColor];
//    }
//    return _topLabel;
//}

//-(UILabel *)bottomLabel
//{
//    if (_bottomLabel == nil) {
//        _bottomLabel = [[UILabel alloc]init];
//        _bottomLabel.text = @"父vc的bottom label...";
//        _bottomLabel.textColor = [UIColor blueColor];
//        _bottomLabel.textAlignment = NSTextAlignmentCenter;
//        _bottomLabel.backgroundColor = [UIColor cyanColor];
//    }
//    return _bottomLabel;
//}
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

    NSString *tempStr = @"123.45678";

    //保留两位:
    NSString *finalStr = BBAEFNB.inputStr(tempStr).commit;
    NSLog(@"finalStr----%@",finalStr);



}

-(void)btnClick{

    testViewController *testVc = [[testViewController alloc]init];
    [self.navigationController pushViewController:testVc animated:YES];
//    NSArray *array = @[@"111",@"222",@"333",@"444",];
//    self.person.name = array[arc4random() % array.count];
//    NSLog(@"self.person.name---%@",self.person.name);
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{

    NSLog(@"new----%@",[change objectForKey:@"new"]);
    NSLog(@"old----%@",[change objectForKey:@"old"]);

    if ([change objectForKey:@"new"] != [change objectForKey:@"old"]) {
        NSLog(@"两个值不一样..");
    }

}
-(void)buttonOneClick{

    NSString *str  = @"https://openapi.bbae.com/sdk/ios-getting-started.html";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

-(void)slideShowViewDidClick:(NSInteger)index{

    NSLog(@"点击的是第%zd个图片...",index);
}

-(void)leftButtonClick:(BBAEDealTipAlterViewType)dealType{

    NSLog(@"leftButtonClick");
}

-(void)rightButtonClick:(BBAEDealTipAlterViewType)dealType{
    NSLog(@"rightButtonClick");
}

-(void)alertView2DidClickLink:(NSURL *)URL inRange:(NSRange)characterRange{

    NSLog(@"alertView2DidClickLink");

//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.baidu.com"]];

    subViewController *subVc = [[subViewController alloc]init];
    [self.navigationController pushViewController:subVc animated:YES];
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
