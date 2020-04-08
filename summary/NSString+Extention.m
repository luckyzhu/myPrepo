//
//  NSString+Extention.m
//  summary
//
//  Created by NewBoy on 2020/3/19.
//  Copyright © 2020 LX. All rights reserved.
//

#import "NSString+Extention.h"


@implementation NSString (Extention)
-(NSString *)divideStr:(NSString *)str{
    NSString *firstStr = [self copy]; //nil对象进行decimal运算会崩溃
    if (firstStr == nil || firstStr.length == 0) {
        firstStr = @"0";
    }
    if (str == nil || str.length == 0) {
        str = @"1";
    }
    if ([str isEqualToString:@"0"]) {//0 不能作为除数
        str = @"1";
    }
    NSDecimalNumber *number1 = [NSDecimalNumber decimalNumberWithString:firstStr];
    NSDecimalNumber *number2 = [NSDecimalNumber decimalNumberWithString:str];
    NSDecimalNumber *num = [number1 decimalNumberByDividingBy:number2];
    return [NSString stringWithFormat:@"%@",num];
}
@end
