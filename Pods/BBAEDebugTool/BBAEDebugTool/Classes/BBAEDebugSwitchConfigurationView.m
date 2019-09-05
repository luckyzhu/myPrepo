//
//  BBAEDebugSwitchConfigurationView.m
//  BBAEDebugModule
//
//  Created by NewBoy on 2019/6/19.
//  Copyright © 2019 newboy. All rights reserved.
//

#import "BBAEDebugSwitchConfigurationView.h"

@interface  BBAEDebugSwitchConfigurationView()

@property (nonatomic,copy) NSString *leftText;
@property (nonatomic,copy) NSString *rightText;

@end
@implementation BBAEDebugSwitchConfigurationView

-(instancetype)initWithFrame:(CGRect)frame leftText:(NSString *)leftText rightText:(NSString *)rightText;{

    if (self = [super initWithFrame:frame]) {

        self.leftText = leftText;
        self.rightText = rightText;

        [self configSubviews];

    }

    return self;
}

-(void)configSubviews{

    CGFloat buttonWidth = 90;
    CGFloat buttonHeight = self.frame.size.height;

    UITextField *textField = [[UITextField alloc]init];
    textField.text = self.leftText;
//    textField.backgroundColor = [UIColor redColor];
    textField.frame = CGRectMake(16, 0, self.frame.size.width - buttonWidth-16, buttonHeight);
    textField.adjustsFontSizeToFitWidth = YES;
    [self addSubview:textField];
    self.textField = textField;

    UILabel *rightLabel = [[UILabel alloc]init];
    rightLabel.text = self.rightText;
    rightLabel.textColor = [UIColor blueColor];
    rightLabel.frame = CGRectMake(CGRectGetMaxX(textField.frame), 0, buttonWidth-16, buttonHeight);
    rightLabel.textAlignment = NSTextAlignmentRight;
    rightLabel.userInteractionEnabled = YES;
    [self addSubview:rightLabel];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
    [tap addTarget:self action:@selector(rightLabelClick)];
    [rightLabel addGestureRecognizer:tap];

}


-(void)rightLabelClick{

    if (self.delegate && [self.delegate respondsToSelector:@selector(rightBtnClick:)]) {
        [self.delegate rightBtnClick:self];
    }

}



@end
