//
//  UIColor+InkColor.h
//  InkStoneDemo
//
//  Created by xiazhiyao on 2019/4/22.
//  Copyright © 2019 bbae. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (InkColor)

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
//alpha为1.0
+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
