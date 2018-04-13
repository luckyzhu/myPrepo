//
//  LXLabel.m
//  summary
//
//  Created by NewBoy on 2018/4/13.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "LXLabel.h"

@implementation LXLabel

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"LXLabel-----hitTest--%@",[super hitTest:point withEvent:event]);
    return [super hitTest:point withEvent:event];
}
@end
