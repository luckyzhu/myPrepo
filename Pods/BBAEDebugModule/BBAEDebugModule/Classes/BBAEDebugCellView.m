//
//  BBAEDebugCellView.m
//  BBAEDebugModule
//
//  Created by NewBoy on 2019/6/19.
//  Copyright © 2019 newboy. All rights reserved.
//

#import "BBAEDebugCellView.h"

@implementation BBAEDebugCellView

-(instancetype)initWithFrame:(CGRect)frame  title:(NSString *)title{
    if (self = [super initWithFrame:frame]) {

        UILabel *leftLabel = [[UILabel alloc]init];
        leftLabel.text = title;
        [leftLabel sizeToFit];
        leftLabel.frame = CGRectMake(16, 0, leftLabel.frame.size.width,frame.size.height);
        [self addSubview:leftLabel];

        UIView *lineView = [[UIView alloc]init];
        lineView.frame = CGRectMake(0, frame.size.height-0.5, frame.size.width, 0.5);
        lineView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:lineView];

        UILabel *rightLabel = [[UILabel alloc]init];
        rightLabel.text = @">";
        rightLabel.font = [UIFont systemFontOfSize:30];
        rightLabel.frame = CGRectMake(frame.size.width - 20-10, 0, 20,frame.size.height);
        [self addSubview:rightLabel];

        [self setBackgroundImage:[self imageWithColor:[UIColor lightGrayColor]] forState:UIControlStateHighlighted];

    }

    return self;
}


-(UIImage*)imageWithColor:(UIColor*)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}


@end
