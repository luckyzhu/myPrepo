//
//  BBAESlideIntervalView.h
//  summary
//
//  Created by NewBoy on 2018/10/14.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BBAESlideIntervalViewDelegate<NSObject>

-(void)slideShowViewDidClick:(NSInteger)index;

@end

@interface BBAESlideIntervalView : UIView

-(instancetype)initWithCGSize:(CGSize)size dataArray:(NSArray *)dataArray;

//@property (nonatomic,assign) BBAESlideShowViewScrollType scrollType;

//@property (nonatomic,assign) BOOL hasPageControl; //是否有UIPageControl控件

@end
