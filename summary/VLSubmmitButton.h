//
//  VLSubmmitButton.h
//  summary
//
//  Created by NewBoy on 2019/10/31.
//  Copyright © 2019 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VLSubmmitButton : UIButton
- (void)loadingWithMessage:(NSString *)message;
//- (void)loadingWithMessage:(NSString *)message font:(UIFont *)font textColor:(UIColor *)textColor;
- (void)backToNormal;

@end

NS_ASSUME_NONNULL_END
