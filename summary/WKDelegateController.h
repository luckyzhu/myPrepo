//
//  WKDelegateController.h
//  summary
//
//  Created by NewBoy on 2020/3/31.
//  Copyright © 2020 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
// 创建新的控制器设置代理（解决不能释放的问题）
@class WKUserContentController,WKScriptMessage;
@protocol WKDelegate <NSObject>
-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message;
@end

@interface WKDelegateController : UIViewController
@property (weak , nonatomic) id<WKDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
