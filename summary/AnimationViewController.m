//
//  AnimationViewController.m
//  summary
//
//  Created by NewBoy on 2020/1/12.
//  Copyright © 2020 LX. All rights reserved.
//

#import "AnimationViewController.h"
#import "SUMTestView.h"
@interface AnimationViewController()<CAAnimationDelegate>
@property (nonatomic,strong) UIImageView *topImageView;
@property (nonatomic,strong) CALayer *colorLayer;



@end
@implementation AnimationViewController

- (UIButton *)customButton
{
  //create button
  CGRect frame = CGRectMake(0, 0, 150, 50);
  UIButton *button = [[UIButton alloc] initWithFrame:frame];
  button.backgroundColor = [UIColor whiteColor];
  button.layer.cornerRadius = 10;

  //add label
  frame = CGRectMake(20, 10, 110, 30);
  UILabel *label = [[UILabel alloc] initWithFrame:frame];
  label.text = @"Hello World";
    label.backgroundColor = [UIColor blueColor];
  label.textAlignment = NSTextAlignmentCenter;
  [button addSubview:label];
  return button;
}

-(void)viewDidLoad {
    [super viewDidLoad];

    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50.0f, 200.0f, 100.0f, 100.0f);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    //add it to our view
    [self.view.layer addSublayer:self.colorLayer];

    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(100, 400, 50, 50);
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor redColor];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

-(void)btnClick {
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    //create a basic animation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.toValue = (__bridge id)color.CGColor;
    animation.delegate = self;
    //apply animation to layer
    [self.colorLayer addAnimation:animation forKey:nil];
}

//CAAnimationDelegate代理方法
- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag{
    NSLog(@"animationDidStop");
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
//    [CATransaction setAnimationDuration:5.0];

    self.colorLayer.backgroundColor = (__bridge CGColorRef)anim.toValue;
    [CATransaction commit];
}

- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"animationDidStart");

}


@end
