//
//  edgeView.h
//  summary
//
//  Created by NewBoy on 2018/9/17.
//  Copyright © 2018年 LX. All rights reserved.
//

/*
 自定义一个view，四种情况。不显示，显示上面，显示下面，上面和下面都显示
 用位移枚举
 */
#import <UIKit/UIKit.h>
typedef NS_OPTIONS(NSUInteger, NBHeaderAndFooterType) {
    NBHeaderAndFooterUp = 1 << 0,//1 左移0位  header
    NBHeaderAndFooterDown = 1 << 1,//1 左移1位  footer
    NBHeaderAndFooterNone = 1 << 2,//1 左移2位  none
};

@interface edgeView : UIView

-(id)initWithOriginView:(UIView *)originView type:(NBHeaderAndFooterType)type;

@end
