//
//  edgeView.m
//  summary
//
//  Created by NewBoy on 2018/9/17.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "edgeView.h"
#import "Masonry.h"

@implementation edgeView

//-(instancetype)init
//{
//    if (self = [super init]) {
//    }
//    return self;
//}


//约束好
- (void)createHeaderAndFooterView{

//    UIView *containView = [UIView new];
//    containView.backgroundColor = [UIColor redColor];
//    [self addSubview:containView];

    UILabel *topLabel = [[UILabel alloc]init];
    topLabel.text = @"您的升级申请已提交测试label";
    topLabel.textColor = [UIColor whiteColor];
    topLabel.numberOfLines = 0;
    [self addSubview:topLabel];

    [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(self);
    }];
}


-(id)initWithOriginView:(UIView *)originView type:(NBHeaderAndFooterType)type{


    [self createHeaderAndFooterView];


    if (type & NBHeaderAndFooterUp) {

        NSLog(@"显示header-----");
    }

    if (type & NBHeaderAndFooterDown) {

        NSLog(@"显示footer-----");

    }

    return self;


}


@end
