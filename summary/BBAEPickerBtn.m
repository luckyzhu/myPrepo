//
//  BBAEPickerBtn.m
//  summary
//
//  Created by NewBoy on 2019/9/5.
//  Copyright © 2019 LX. All rights reserved.
//

#import "BBAEPickerBtn.h"

@implementation BBAEPickerBtn
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        [self initElements];
    }
    return self;

}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initElements];
    }
    return self;
}
- (void)initElements {


    [self addTarget:self action:@selector(selfClick:) forControlEvents:UIControlEventTouchUpInside];


}

-(void)setPlaceHolder:(NSString *)placeHolder
{
    _placeHolder = placeHolder;

    [self setTitle:_placeHolder forState:UIControlStateNormal];
}


#pragma mark - 按钮点击方法:
-(void)selfClick:(UIButton *)button{

    NSLog(@"selfClickselfClick-----");
}

@end
