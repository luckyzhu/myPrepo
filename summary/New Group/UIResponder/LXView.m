//
//  LXView.m
//  summary
//
//  Created by NewBoy on 2018/4/13.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "LXView.h"
#import "LXButton.h"
#import "LXLabel.h"


@implementation LXView

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){

        LXButton *button = [[LXButton alloc]init];
        button.frame = CGRectMake(50, 200, 200, 30);
        [button setTitle:@"我是按钮" forState:UIControlStateNormal];
        button.titleLabel.textColor = [UIColor redColor];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        self.button = button;

//        LXLabel *textLabel = [LXLabel new];
//        textLabel.backgroundColor = [UIColor redColor];
//        textLabel.frame = CGRectMake(100, 50, 50, 300);
//        [self addSubview:textLabel];
    }

    return self;
}

- (void)btnClick{
    NSLog(@"按钮---btnClick---");
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [super touchesBegan:touches withEvent:event];
    NSLog(@"%s",__func__);

}

//寻找最合适的处理事件的view
//返回为nil时，该view处理不了当前的触摸事件
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    NSLog(@"LXView---被触摸到的屏幕上的点---%@",NSStringFromCGPoint(point));
    //把当前view上的点转到label上的点
//    NSLog(@"转换后的点----%@",NSStringFromCGPoint([self convertPoint:point toView:self.button]));
     NSLog(@"LXView---hitTest---%@",[super hitTest:point withEvent:event]);
//    NSLog(@"111-----%@",NSStringFromCGPoint(point));
//    NSLog(@"222-----%@",event);
    return [super hitTest:point withEvent:event];
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"LXView----pointInside--%zd",[super pointInside:point withEvent:event]);
    return [super pointInside:point withEvent:event];
}

/*
 当用户点击屏幕后产生一个触摸事件，经过经过一系列的传递过程后，会找到最合适的视图控件来处理这个事件，找到最合适的视图之后，就会调用空间的touches那三个方法，这些方法的默认做法是把事件顺着响应者链条向上传递，将事件传递给上一个响应者进行处理

 1.首先它会判断它自己是否能接受触摸事件，如果它不能接收触摸事件，那么它肯定不是最合适的
 2.view首先调用pointInside，判断被触摸的点是否在当前view上
   返回NO,point不在当前view里.hitTest方法nil,当前view处理不了触摸事件。不再遍历子控件
   返回YES,point在当前view里.view会遍历当前view的subViews
        从最上层开始遍历（最后被添加的子控件）
 */




@end
