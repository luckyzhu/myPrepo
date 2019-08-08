//
//  BBAEDebugSwitchConfigurationView.h
//  BBAEDebugModule
//
//  Created by NewBoy on 2019/6/19.
//  Copyright © 2019 newboy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class BBAEDebugSwitchConfigurationView;
@protocol BBAEDebugSwitchConfigurationViewDelegate <NSObject>

-(void)rightBtnClick:(BBAEDebugSwitchConfigurationView* )configView;

@end

@interface BBAEDebugSwitchConfigurationView : UIView

-(instancetype)initWithFrame:(CGRect)frame leftText:(NSString *)leftText rightText:(NSString *)rightText;

@property (nonatomic,weak) id<BBAEDebugSwitchConfigurationViewDelegate> delegate;
@property (nonatomic,strong) UITextField *textField;

@end

NS_ASSUME_NONNULL_END
