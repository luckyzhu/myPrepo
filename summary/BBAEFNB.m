//
//  BBAEFNB.m
//  summary
//
//  Created by NewBoy on 2019/9/3.
//  Copyright © 2019 LX. All rights reserved.
//

#import "BBAEFNB.h"

@interface BBAEFNB()
{
     NSDecimalNumber *_decimalStr;
}

@end
@implementation BBAEFNB

//block作为返回值
+(BBAEFNB *(^)(NSString *str))inputStr{

    return ^(NSString *str){
        return [[BBAEFNB alloc]initWithStr:str];
    };
}

//默认自带截取小数点后两位
-(id)initWithStr:(NSString*)str{
    _decimalStr = [[NSDecimalNumber alloc] initWithString:str];
    return self;
}

-(NSString*)commit{

    NSDecimalNumberHandler *roundingBehavior = [NSDecimalNumberHandler
                                       decimalNumberHandlerWithRoundingMode:NSRoundBankers
                                       scale:1
                                       raiseOnExactness:NO
                                       raiseOnOverflow:NO
                                       raiseOnUnderflow:NO
                                       raiseOnDivideByZero:NO];
     NSDecimalNumber *roundedOunces = [_decimalStr decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    return [NSString stringWithFormat:@"%@",roundedOunces];

}


@end
