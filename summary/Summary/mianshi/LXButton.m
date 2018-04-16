//
//  LXButton.m
//  summary
//
//  Created by NewBoy on 2018/4/14.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "LXButton.h"

@implementation LXButton

-(void)layoutSubviews
{
    [super layoutSubviews];

     CGRect labelFrame = self.titleLabel.frame;
    labelFrame.origin.y = 100;
    self.titleLabel.frame = labelFrame;
//
//    [super layoutSubviews];

}

@end
