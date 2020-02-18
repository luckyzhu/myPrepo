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
#import "BBAEPickerBtn.h"
#import "MJRefresh.h"
#import "UIColor+InkColor.h"
#import "MSStrokeLabel.h"
#import "VLSubmmitButton.h"


@interface ViewController()<UINavigationControllerDelegate, UIImagePickerControllerDelegate,BBAESlideShowViewDelegate,LXTestViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,strong) VLSubmmitButton *button;

@property (nonatomic,strong)UIImageView *lastImage;
@property (nonatomic,strong)UIImageView *originImage;
@property (nonatomic,strong) Person *person;
@property (nonatomic,strong) UIView *headerView;
@property (nonatomic,strong) UILabel *topLabel;
@property (nonatomic,assign) CGFloat tempContentOffsetY;
@property (nonatomic,strong) CAShapeLayer *shapeLayer;
@property (nonatomic,strong) UITextField *textField;
@property (nonatomic,strong) NSMutableArray *subviewsArray;
@property (nonatomic,strong) UIButton *doneView;


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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * identifer = @"UITableViewCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }

    cell.textLabel.text = [NSString stringWithFormat:@"测试数据第%zd行",indexPath.row];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [self.tableView reloadData];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]init];
    headerView.frame = CGRectMake(0, 0, 375, 44);
    headerView.backgroundColor = [UIColor redColor];
    return headerView;
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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self.navigationController.navigationBar setHidden:YES];
}


-(void)btnClickOne{

    NSLog(@"btnClickOne");
}


-(void)btnClickTWo{

    NSLog(@"btnClickTWo");
}


-(void)bubbleSort{
    NSArray *dataArray = @[@"1",@"3",@"56",@"78",@"34",@"9",@"45",@"27",@"62",@"16",];
    NSMutableArray *sortArray = [NSMutableArray arrayWithArray:dataArray];


    /*
     总共需要多少趟？
     找出第一个数，需要比较n-1次
     找出第二个数，因为第一趟已经找出一个最大的数。这次需要把这个最大的数排除掉。需要比较n-2次。
     找出第n-1个数，需要1次。
     剩下的就是第n个数.
     ...
     */

    for (int end = (int)sortArray.count-1; end > 0; end--) {
        //每一趟排序找出一个最大的数。放在最右边。
        for (int begin = 1; begin <= end; begin++) {
            //如果左侧的数比右边的数大
            if ([sortArray[begin] integerValue] < [sortArray[begin-1] integerValue]) {
                NSString *temp = sortArray[begin];
                sortArray[begin] = sortArray[begin-1];
                sortArray[begin-1] = temp;
            }
        }
    }

    NSLog(@"排序前数组---%@",[dataArray componentsJoinedByString:@","]);
    NSLog(@"排序后数组---%@",[sortArray componentsJoinedByString:@","]);
}

-(void)btnClick{

    [self.button loadingWithMessage:@"按钮"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.button backToNormal];
    });

}
- (void)keyboardWillShow:(NSNotification *)info {

    NSLog(@"keyboardWillShow");

    [self.subviewsArray removeAllObjects];


    NSArray *Windows = [[UIApplication sharedApplication] windows];
    for(UIView *subWindow in Windows){
        if ([subWindow isKindOfClass:NSClassFromString(@"UIRemoteKeyboardWindow")]) {
            [self getSub:subWindow andLevel:1];
        }
    }
//

}

- (void)btnClicked{

    NSLog(@"btnClicked");
}
// 递归获取子视图
- (void)getSub:(UIView *)view andLevel:(int)level {
    NSArray *subviews = [view subviews];

    // 如果没有子视图就直接返回
    if ([subviews count] == 0) return;

    for (UIView *subview in subviews) {

        // 根据层级决定前面空格个数，来缩进显示
        NSString *blank = @"";
        for (int i = 1; i < level; i++) {
            blank = [NSString stringWithFormat:@"  %@", blank];
        }

        // 打印子视图类名
        NSLog(@"%@%d: %@", blank, level, subview.class);

        if ([subview isKindOfClass:NSClassFromString(@"UIKBKeyplaneView")]) {

            UIView *lastView = [subview.subviews lastObject];
            CGRect frame = CGRectMake(282.5, 169, 91.5, 46);
            if (CGRectEqualToRect(lastView.frame, frame)) {
                [lastView setHidden:YES];
                UIButton *doneView = [[UIButton alloc]init];
                doneView.frame = frame;
                [doneView addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
                doneView.backgroundColor = [UIColor redColor];
                [subview addSubview:doneView];
                [subview bringSubviewToFront:doneView];
                self.doneView = doneView;
            }
        }
        // 递归获取此视图的子视图
        [self getSub:subview andLevel:(level+1)];

        [self.subviewsArray addObject:subview.class];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.textField resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loading"]];
    imageView.frame = CGRectMake(100, 100, imageView.frame.size.width, imageView.frame.size.height);
    [self.view addSubview:imageView];
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 1;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 10000;
    [imageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];


    Student *stu = [[Student alloc]init];
    [stu performSelector:@selector(test)];



//    //遍历一个类的所有属性
//    unsigned int count = 0;
//    objc_property_t *properties =  class_copyPropertyList(NSClassFromString(@"UIKBKeyView"), &count);
//    for (int i = 0; i < count; i ++) {
//        objc_property_t property = properties[i];
//        NSString *propertyName = [[NSString alloc]initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
//        NSLog(@"这个类的属性 ----%@",propertyName);
//    }
//    free(properties);

    unsigned int count;
    Ivar *ivarList = class_copyIvarList(NSClassFromString(@"UIKBKeyView"), &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        NSLog(@"该类的成员变量----%s", ivar_getName(ivar));
    }
    free(ivarList);






//    NSArray *array = @[@"10",@"8",@"23",@"45",@"67",@"5",@"99",@"34",];
//
//    NSArray *sortArray =
//    [array sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1,NSString *obj2) {
//
//        return [obj1 intValue] > [obj2 intValue];
//    }];
//
//    NSLog(@"sortArray----%@",sortArray);

//    UITableView *tableView = [[UITableView alloc]init];
//    tableView.frame = self.view.bounds;
//    tableView.dataSource = self;
//    tableView.delegate = self;
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    tableView.showsVerticalScrollIndicator = NO;
//    [self.view addSubview:tableView];
//    self.tableView = tableView;


//    UILabel *topLabel = [[UILabel alloc]init];
//    topLabel.frame = CGRectMake(0, 100, self.view.frame.size.width, 50);
//    topLabel.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:topLabel];
//
//    //图文混排
//    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:@"不要问123455..."];
//    [attriStr addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, 5)];
//    [attriStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, 5)];
//
//    NSTextAttachment *attchImage = [[NSTextAttachment alloc] init];
//    // 表情图片
//    attchImage.image = [UIImage imageNamed:@"123"];
//    // 设置图片大小
//    attchImage.bounds = CGRectMake(0, 0, 17, 17);
//    NSAttributedString *stringImage = [NSAttributedString attributedStringWithAttachment:attchImage];
//    [attriStr insertAttributedString:stringImage atIndex:2];
//
//    topLabel.attributedText = attriStr;








//    /*
//     贝塞尔曲线指定路径
//     cashapelayer绘制内容
//     */
//
//
//    UIView *testView = [[UIView alloc]init];
//    testView.backgroundColor = [UIColor redColor];
//    testView.frame = CGRectMake(50,400, 200, 80);
//    [self.view addSubview:testView];
//
//    NSArray *pointArray = @[
//                            [NSValue valueWithCGPoint:CGPointMake(0, 20)],
//                            [NSValue valueWithCGPoint:CGPointMake(20, 50)],
//                            [NSValue valueWithCGPoint:CGPointMake(40, 70)],
//                            [NSValue valueWithCGPoint:CGPointMake(60, 40)],
//                            [NSValue valueWithCGPoint:CGPointMake(80, 30)],
//                            [NSValue valueWithCGPoint:CGPointMake(100, 50)],
//                            [NSValue valueWithCGPoint:CGPointMake(120, 60)],
//                            [NSValue valueWithCGPoint:CGPointMake(140, 45)],
//                            [NSValue valueWithCGPoint:CGPointMake(160, 67)],
//                            ];
//    UIBezierPath *bPath = [UIBezierPath bezierPath];
//    //画折线
//    for (int i = 0; i < pointArray.count; i++) {
//        if (i == 0) {
//            [bPath moveToPoint:[(NSValue *)pointArray[0] CGPointValue]];
//        }else{
//            [bPath addLineToPoint:[(NSValue *)pointArray[i] CGPointValue]];
//        }
//    }
//    [bPath closePath];
//    [bPath addClip];
//
//
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    //填充颜色
//    layer.fillColor = [UIColor clearColor].CGColor;
//    //线宽
//    layer.lineWidth = 1;
//    // 线条的颜色
//    layer.strokeColor = [UIColor yellowColor].CGColor;
//    layer.path = bPath.CGPath;
//    [testView.layer addSublayer:layer];
//
//
//    UIImage *image = [UIImage imageNamed:@"AFN01"];
//
//    //add it directly to our view's layer
//    self.view.layer.contents =(__bridge id)image.CGImage;
//    self.view.layer.contentsGravity =  kCAGravityResizeAspect;
//







//     CGRect frame = CGRectMake(0, 100, 200, 200);
//    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:frame];
//
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    //填充颜色
//    layer.fillColor = [UIColor clearColor].CGColor;
//    //线宽
//    layer.lineWidth = 1;
//    // 线条的颜色
//    layer.strokeColor = [UIColor yellowColor].CGColor;
//
//    layer.path = circlePath.CGPath;
//
//    [self.view.layer addSublayer:layer];


//    UITableView *tableView = [[UITableView alloc]init];
//    tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-88-78);
//    tableView.dataSource = self;
//    tableView.delegate = self;
//    [self.view addSubview:tableView];
//
//
//    /*
//     选择排序的思想:
//     第一趟:从所有的数中找出最大的数，放在最后一个
//     第二趟:从剩下的数中找出最大的数，放在剩下的数中的最后一个
//     ...
//     */
//    NSArray *dataArray = @[@"1",@"3",@"56",@"78",@"34",@"9",@"45",@"27",@"62",@"16",];
//    NSMutableArray *sortArray = [NSMutableArray arrayWithArray:dataArray];
//
//    for (int end = (int)sortArray.count; end > 0 ; end--) {
//        int maxIndex = 0;
//        for (int begin = 0; begin < end; begin++) {
//            if ([sortArray[maxIndex] intValue]< [sortArray[begin] intValue]) {
//                maxIndex = begin;
//            }
//        }
//
//        //最大数和最后一个数交换
//        NSString *temp = sortArray[end-1];
//        sortArray[end-1] = sortArray[maxIndex];
//        sortArray[maxIndex] = temp;
//    }
//
//    NSLog(@"排序前数组---%@",[dataArray componentsJoinedByString:@","]);
//    NSLog(@"排序后数组---%@",[sortArray componentsJoinedByString:@","]);

//    MSStrokeLabel *label = [MSStrokeLabel new];
//    label.frame = CGRectMake(160, 70, 150, 100);
//    label.text = @"0";
//    label.backgroundColor = [UIColor clearColor];
//    label.textColor = [UIColor greenColor];
//    label.font = [UIFont systemFontOfSize:50];
//    //描边
//    label.strokeColor = [UIColor orangeColor];
//    label.strokeWidth = 1;
//    //发光
//    label.layer.shadowRadius = 2;
//    label.layer.shadowColor = [UIColor redColor].CGColor;
//    label.layer.shadowOffset = CGSizeMake(0, 0);
//    label.layer.shadowOpacity = 1.0;
//    [self.view addSubview:label];


    //底部发光阴影
//    LXTestView *bottomSuperView = [[LXTestView alloc]init];
//    bottomSuperView.backgroundColor = [UIColor yellowColor];
//    bottomSuperView.frame = CGRectMake(0, 100, self.view.frame.size.width, 100);
//    [self.view addSubview:bottomSuperView];
//
//    UIButton *button = [[UIButton alloc]init];
//    button.frame = CGRectMake(30, 30, 50, 50);
//    [button setTitle:@"按钮" forState:UIControlStateNormal];
//    button.titleLabel.textColor = [UIColor redColor];
//    button.backgroundColor = [UIColor blueColor];
//    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [bottomSuperView addSubview:button];


//    UIView *bottomView = [[UIView alloc]init];
//    bottomView.backgroundColor = [UIColor redColor];
//    bottomView.frame = CGRectMake(0, 100, self.view.frame.size.width, 20);
//    [bottomSuperView addSubview:bottomView];
//    bottomView.layer.shadowOpacity = 1.0;
//    bottomView.layer.shadowOffset = CGSizeMake(0, 0);
//    bottomView.layer.shadowRadius = 10;
//    bottomView.layer.shadowColor = [UIColor blueColor].CGColor;
//    bottomView.layer.masksToBounds = NO;
//    CGFloat spread = 10;
//    CGFloat dx = -spread;
//    CGRect rect = CGRectInset(bottomView.bounds, dx, dx);
//    bottomView.layer.shadowPath = [UIBezierPath bezierPathWithRect:rect].CGPath;
//
//    UIView *twoView = [[UIView alloc]init];
//    twoView.backgroundColor = [UIColor whiteColor];
//    twoView.frame = CGRectMake(0, 200, self.view.frame.size.width, 100);
//    [self.view addSubview:twoView];

//
//    CAGradientLayer *layer = [CAGradientLayer layer];
//
//    CGColorRef fromColor = [UIColor colorWithHexString:@"00DDF4"].CGColor;
//    CGColorRef endColor = [[UIColor colorWithHexString:@"00DDF4"] colorWithAlphaComponent:0.0].CGColor;
//    layer.colors = @[
//                    ((__bridge id)fromColor),
//                    ((__bridge id)endColor),
//    ];
//    layer.locations = @[@0,@1];
//    layer.startPoint = CGPointMake(0, 1.0);
//    layer.endPoint = CGPointMake(0, 0.0);
//    layer.frame = CGRectMake(0, bottomView.frame.size.height-30, bottomView.frame.size.width, 30);
//    [bottomView.layer addSublayer:layer];







    //平铺图片
//    UIImageView *noticeView = [[UIImageView alloc]initWithFrame:CGRectMake(0,100, self.view.frame.size.width, 60)];
//    UIImage *image =  [UIImage imageNamed:@"pingpu04"];   //图片
//    image = [image resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeTile];
//    noticeView.image = image;
//    [self.view addSubview:noticeView];


//    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0,100, self.view.frame.size.width, 100)];
//    UIImage *image = [UIImage imageNamed:@"Rectangle"];
//    UIImage *newImage = [UIImage imageWithCGImage:[image CGImage] scale:image.scale orientation:image.imageOrientation];
//    [bottomView setBackgroundColor:[UIColor colorWithPatternImage:newImage]];
//    [self.view addSubview:bottomView];



    //创建出CAShapeLayer
//    self.shapeLayer = [CAShapeLayer layer];
//    self.shapeLayer.frame = CGRectMake(0, 0, 200, 200);//设置shapeLayer的尺寸和位置
//    self.shapeLayer.position = self.view.center;
//    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;//填充颜色为ClearColor
//
//    //设置线条的宽度和颜色
//    self.shapeLayer.lineWidth = 1.0f;
//    self.shapeLayer.strokeColor = [UIColor redColor].CGColor;
//
//    //创建出圆形贝塞尔曲线
//    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
//
//    //让贝塞尔曲线与CAShapeLayer产生联系
//    self.shapeLayer.path = circlePath.CGPath;
//
//    //添加并显示
//    [self.view.layer addSublayer:self.shapeLayer];


//    CAGradientLayer *gradient = [CAGradientLayer layer];
//    gradient.frame = self.view.bounds;
//    gradient.startPoint = CGPointMake(0, 0);
//    gradient.endPoint = CGPointMake(1, 2);
//    gradient.locations = @[@0.3, @0.5, @0.6];
//    gradient.colors = [NSArray arrayWithObjects:
//                       (id)[UIColor redColor].CGColor,
//                       (id)[UIColor greenColor].CGColor,
//                       (id)[UIColor blueColor].CGColor,
//                       nil];
//    [self.view.layer addSublayer:gradient];


//    UIView *v=[[UIView alloc]initWithFrame:CGRectMake(10, 100, 100, 100)];
//    v.backgroundColor=[UIColor yellowColor];
//    //v.layer.masksToBounds=YES;这行去掉
//    v.layer.cornerRadius=10;
//    v.layer.shadowColor=[UIColor redColor].CGColor;
//    v.layer.shadowOffset=CGSizeMake(10, 10);
//    v.layer.shadowOpacity=0.5;
//    v.layer.shadowRadius=5;
//    [self.view addSubview:v];

/*-------------------------------------------------------------------------------------------------------------------------*/

    //近似
//    CAGradientLayer *gradient = [CAGradientLayer layer];
//    gradient.frame = self.view.bounds;
//    gradient.colors = @[
//                        (id)[UIColor colorWithHexString:@"001E65"].CGColor,
//                        (id)[UIColor colorWithHexString:@"005A87"].CGColor,
//                        (id)[UIColor colorWithHexString:@"00688F"].CGColor,
//                        (id)[UIColor colorWithHexString:@"006E93"].CGColor,
//                        (id)[UIColor colorWithHexString:@"006F93"].CGColor,
//                        ];
//    gradient.startPoint = CGPointMake(0, 0);
//    gradient.endPoint = CGPointMake(1.0,2.0);
//
//    CGFloat a = 325.0/2;
//    CGFloat b = 521.0/2;
//    CGFloat c = 668.0/2;
//    gradient.locations = @[
//                           @(0.0),
//                           @(a/375.0),
//                           @(b/375.0),
//                           @(c/375.0),
//                           @(1.0),
//                           ];
//    [self.view.layer addSublayer:gradient];


/*-------------------------------------------------------------------------------------------------------------------------*/

//    UIView *testView = [[UIView alloc]init];
//    testView.frame = CGRectMake(0, 64, 37.5 * 20, 66.7*6);
//    [self.view addSubview:testView];
//
//    CAGradientLayer *gradient = [CAGradientLayer layer];
//    gradient.frame = testView.bounds;
//    gradient.colors = @[
//                        (id)[UIColor redColor].CGColor,
//                        (id)[UIColor blueColor].CGColor,
//                        ];
//    gradient.startPoint = CGPointMake(0, 0);
//    gradient.endPoint = CGPointMake(1,0.5);
//    gradient.locations = @[
//                          @(0.0),
//                          @(0.7),
//                            ];
//
//    //相当于把两个0-0.5之间是渐变的。
//    [testView.layer addSublayer:gradient];

}
//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//    NSLog(@"scrollViewWillEndDragging");
//
//}
//
//-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
//{
//
//    NSLog(@"scrollViewDidEndScrollingAnimation");
//}
//
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//
//    NSLog(@"scrollViewDidEndDecelerating");
//    if (scrollView.contentOffset.y < ( self.headerView.frame.size.height - self.topLabel.frame.size.height)  && scrollView.contentOffset.y > 0) {
//        CGRect frame = self.topLabel.frame;
//        frame.origin.y = scrollView.contentOffset.y;
//        self.topLabel.frame = frame;
//    }else{
//        NSLog(@"22-----*%f",scrollView.contentOffset.y);
//        NSLog(@"444444---");
//    }
//}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating");
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    NSLog(@"scrollViewDidScroll");
    //根据滚动方向
//    CGRect frame = self.topLabel.frame;
//
//    if (scrollView.contentOffset.y > (self.headerView.frame.size.height - self.topLabel.frame.size.height)) {
//        frame.origin.y = (self.headerView.frame.size.height - self.topLabel.frame.size.height);
//    }else if (scrollView.contentOffset.y > 0){
//        frame.origin.y = scrollView.contentOffset.y;
//    }else{
//        frame.origin.y = 0;
//    }
//    if (scrollView.contentOffset.y < self.tempContentOffsetY) { //向下
//        NSLog(@"向下...");
//        if (scrollView.contentOffset.y > (self.headerView.frame.size.height - self.topLabel.frame.size.height)) {
//            frame.origin.y = (self.headerView.frame.size.height - self.topLabel.frame.size.height);
//        }else if (scrollView.contentOffset.y > 0){
//            frame.origin.y = scrollView.contentOffset.y;
//        }else{
//            frame.origin.y = 0;
//        }
//    }else{//向上
//        NSLog(@"向上...");
//        if (scrollView.contentOffset.y <= 0) {
//            frame.origin.y = 0;
//        }else if (scrollView.contentOffset.y <= ( self.headerView.frame.size.height - self.topLabel.frame.size.height)  && scrollView.contentOffset.y > 0){
//            frame.origin.y = scrollView.contentOffset.y;
//        }else{
//            frame.origin.y = (self.headerView.frame.size.height - self.topLabel.frame.size.height);
//        }
//    }

//    NSLog(@"滚动的距离----*%f",scrollView.contentOffset.y);
//    self.topLabel.frame = frame;
//    self.tempContentOffsetY = scrollView.contentOffset.y;
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
