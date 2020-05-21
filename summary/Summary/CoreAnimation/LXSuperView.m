//
//  LXSuperView.m
//  summary
//
//  Created by NewBoy on 2020/4/28.
//  Copyright © 2020 LX. All rights reserved.
//

#import "LXSuperView.h"
#import "LXRedView.h"
#import "LXBlueView.h"

@interface LXSuperView()
@property (nonatomic,strong) LXRedView *redView;
@property (nonatomic,strong) LXBlueView *blueView;

@end
@implementation LXSuperView

-(instancetype)init {
    if (self = [super init]) {
        LXRedView *redView = [[LXRedView alloc]init];
        redView.backgroundColor = [UIColor redColor];
        redView.userInteractionEnabled = NO;
        redView.frame = CGRectMake(0, 200, 200, 50);
        [self addSubview:redView];
        self.redView = redView;

        LXBlueView *blueView = [[LXBlueView alloc]init];
        blueView.frame = CGRectMake(50, 100, 50, 200);
        blueView.userInteractionEnabled = NO;
        blueView.backgroundColor = [UIColor blueColor];
        [self addSubview:blueView];
        self.blueView = blueView;
        
    }

    return self;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    NSLog(@"3333333");

    [self.redView touchesBegan:touches withEvent:event];
    [self.blueView touchesBegan:touches withEvent:event];
}

//-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    for (int i = (self.subviews.count -1); i > 0; i --) {
//        UIView *testView = self.subviews[i];
//        CGPoint pointLast = [self convertPoint:point toView:testView];
//        UIView *view = [testView hitTest:pointLast withEvent:event];
//        if (view) return view;
//    }
//    return [super hitTest:point withEvent:event];
//}

@end
