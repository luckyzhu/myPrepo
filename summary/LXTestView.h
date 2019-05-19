//
//  LXTestView.h
//  summary
//
//  Created by NewBoy on 2019/5/15.
//  Copyright © 2019 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger,BBAEDealTipAlterViewType){

    BBAEDealTipAlterViewType_Default, // 默认左边是取消，右边是确定
    BBAEDealTipAlterViewType_NoOptionPackage,//左边是”继续交易“ 右边是”购买套餐“
};

@protocol LXTestViewDelegate <NSObject>

-(void)leftButtonClick:(BBAEDealTipAlterViewType)dealType;

-(void)rightButtonClick:(BBAEDealTipAlterViewType)dealType;

-(void)alertView2DidClickLink:(NSURL *)URL inRange:(NSRange)characterRange;

@end

@interface LXTestView : UIView

-(instancetype)initWithDealTipViewType:(BBAEDealTipAlterViewType)dealType showStr:(NSString *)showStr useMd:(BOOL)useMd;

@property (nonatomic,weak) id<LXTestViewDelegate> delegate;

-(void)show;

@end

NS_ASSUME_NONNULL_END
