//
//  BTTestView.m
//  summary
//
//  Created by NewBoy on 2020/5/20.
//  Copyright © 2020 LX. All rights reserved.
//

#import "BTTestView.h"

@implementation BTTestView

- (void)drawRect:(CGRect)rect {
    //    [[UIImage imageNamed:@"123"] drawInRect:self.bounds];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
//    //翻转起来---上下颠倒
    CGContextTranslateCTM(ctx, 0.0, self.bounds.size.height);
    CGContextScaleCTM(ctx, 1.0, -1.0);

    ////假设想在10,30,80,80的地方绘制,颠倒过来后的Rect应该是 10, self.bounds.size.height - 110, 80, 80
    CGContextDrawImage(ctx, self.bounds, [UIImage imageNamed:@"123"].CGImage);
//    CGContextRestoreGState(ctx);
}

@end
