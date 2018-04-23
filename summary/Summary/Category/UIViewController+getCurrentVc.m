//
//  UIViewController+getCurrentVc.m
//  summary
//
//  Created by NewBoy on 2018/4/23.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "UIViewController+getCurrentVc.h"

@implementation UIViewController (getCurrentVc)
+ (UIViewController *)getAppCurrentViewController {
    UIViewController *resultVC;

    resultVC = [[[self alloc]init] getTopViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [[[self alloc]init] getTopViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)getTopViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self getTopViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self getTopViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

@end
