//
//  LXRedView.m
//  summary
//
//  Created by NewBoy on 2020/4/28.
//  Copyright © 2020 LX. All rights reserved.
//

#import "LXRedView.h"

@implementation LXRedView


-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    NSDictionary *dict = @{
        NSFontAttributeName : [UIFont systemFontOfSize:20],
        NSForegroundColorAttributeName : [UIColor blueColor],
    };
    [@"123" drawInRect:self.bounds withAttributes:dict];
}

@end
