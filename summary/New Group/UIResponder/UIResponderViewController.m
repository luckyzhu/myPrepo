//
//  UIResponderViewController.m
//  summary
//
//  Created by NewBoy on 2018/4/13.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "UIResponderViewController.h"
#import "LXView.h"

@interface UIResponderViewController ()
@property (nonatomic,strong) UILabel *textLabel;
@property (nonatomic,strong) UIView *superView;

@end

@implementation UIResponderViewController

-(void)loadView
{
    //事件的传递:
    /*
     当用户的手指触摸屏幕的某一个view的时候，此时就发生了触摸事件，系统会把该事件加入UIApplication管理的事件队列中去，这个队列是先进先出的，然后UIApplication会从事件队列中去除最前面的事件，并将事件分发下去以便处理，通常，先发送事件给应用程序的主窗口（keyWindow），主窗口会在视图层次结构上面找到一个最合适的视图来处理触摸事件，这是整个事件处理的第一步，找到合适的视图控件之后，他就会调用试图的touches方法来处理事件，
     */

    self.view = [LXView new];
    self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);

    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    UIView *firstView = [[UIView alloc]init];
//    firstView.backgroundColor = [UIColor redColor];
//    firstView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//    [self.view addSubview:firstView];
//
//    CGFloat margin = 10;
//    UIView *secondView = [[UIView alloc]init];
//    secondView.backgroundColor = [UIColor blueColor];
//    secondView.frame = CGRectMake(margin, margin, self.view.frame.size.width-margin*2, self.view.frame.size.height-margin*2);
//    [self.view addSubview:secondView];
//
//    UIView *thirdView = [[UIView alloc]init];
//    thirdView.backgroundColor = [UIColor greenColor];
//    thirdView.frame = CGRectMake(margin*2, margin*2, self.view.frame.size.width-margin*4, self.view.frame.size.height-margin*4);
//    [self.view addSubview:thirdView];




}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}




@end
