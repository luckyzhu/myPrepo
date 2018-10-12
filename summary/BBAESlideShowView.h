//
//  BBAESlideShowView.h
//  summary
//
//  Created by NewBoy on 2018/9/26.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS (NSUInteger ,BBAESlideShowViewScrollType){
    BBAESlideShowViewScrollType_Manual = 0, // 仅支持手动拖动
    BBAESlideShowViewScrollType_Timer = 1, //手动拖动和自动都支持
};

typedef NS_OPTIONS (NSUInteger ,BBAESlideShowSubViewType){
    BBAESlideShowSubViewType_OnlyOneOnScreen = 0, // 屏幕上只有一个图片，宽度和父视图一样
    BBAESlideShowSubViewType_MoreOnScreen = 1, //屏幕上有3个图片，左右各留一点
};

@protocol BBAESlideShowViewDelegate<NSObject>

-(void)slideShowViewDidClick:(NSInteger)index;

@end

@interface BBAESlideShowView : UIView

@property (nonatomic,weak) id<BBAESlideShowViewDelegate> delegate;

-(instancetype)initWithCGSize:(CGSize)size dataArray:(NSArray *)dataArray;

@property (nonatomic,assign) BBAESlideShowViewScrollType scrollType;

@property (nonatomic,assign) BOOL hasPageControl; //是否有UIPageControl控件

@end
