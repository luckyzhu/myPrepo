//
//  SUMTestView.m
//  summary
//
//  Created by NewBoy on 2018/11/8.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "SUMTestView.h"

@interface SUMTestView()
@property (nonatomic,strong) UILabel *zeroLabel;

@end

@implementation SUMTestView

-(instancetype)init
{
    if (self = [super init]) {

        UILabel *zeroLabel = [[UILabel alloc]init];
        zeroLabel.textColor = [UIColor redColor];
        zeroLabel.font = [UIFont systemFontOfSize:9];
        self.zeroLabel = zeroLabel;


    }
    return self;
}


-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];

    CGFloat bottomLabelWidth = 100;
    CGFloat bottomLabelHeight = 10;
    self.zeroLabel.text = @"2018-12-20";//CGRectGetHeight(self.bounds)-bottomZoneHeight
    [self.zeroLabel drawTextInRect:CGRectMake(0, 0, bottomLabelWidth, bottomLabelHeight)];



}
//-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    UIView *view = [super hitTest:point withEvent:event];
//
//    CGPoint finalPoint = [self convertPoint:point toView:self.button];
//    if ([self.button pointInside:finalPoint withEvent:event]) {
//        return nil;
//    }
//    return view;
//}


//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [super touchesBegan:touches withEvent:event];
//    NSLog(@"2222222");
//}
@end
