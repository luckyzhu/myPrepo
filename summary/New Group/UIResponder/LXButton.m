//
//  LXButton.m
//  summary
//
//  Created by NewBoy on 2018/4/13.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "LXButton.h"

@implementation LXButton

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"LXButton-----hitTest");
    return [super hitTest:point withEvent:event];
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"LXButton----pointInside--%zd",[super pointInside:point withEvent:event]);
    return [super pointInside:point withEvent:event];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    NSLog(@"%s",__func__);
}

@end
