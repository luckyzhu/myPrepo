//
//  testTableViewCell.m
//  summary
//
//  Created by NewBoy on 2018/5/2.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "testTableViewCell.h"

@implementation testTableViewCell

-(void)layoutSubviews
{
    [super layoutSubviews];

    UILabel *topLeftLabel = [[self.subviews[0] subviews] firstObject];
    topLeftLabel.frame = CGRectMake(0, 0, self.frame.size.width/2, 44);
    topLeftLabel.backgroundColor = [UIColor lightGrayColor];

    UILabel *topDownLabel = [[self.subviews[0] subviews] lastObject];
    topDownLabel.frame = CGRectMake(self.frame.size.width/2, 0, self.frame.size.width/2, 44);
    topDownLabel.backgroundColor = [UIColor blueColor];

}

@end
