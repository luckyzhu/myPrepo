//
//  LXButton.m
//  summary
//
//  Created by NewBoy on 2018/4/14.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "LXButton.h"

@implementation LXButton

-(instancetype)init
{
    if (self = [super init]) {
        NSLog(@"LXButton----init");
    }

    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        NSLog(@"LXButton----initWithFrame");

    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];

    NSLog(@"LXButton-----layoutSubviews");

//     CGRect labelFrame = self.titleLabel.frame;
//    labelFrame.origin.y = 100;
//    self.titleLabel.frame = labelFrame;
//
//    [super layoutSubviews];

}



@end
