//
//  MasonryViewController.h
//  summary
//
//  Created by NewBoy on 2018/10/12.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasonryViewController : UIViewController

//masonry错误
//1. [MASViewConstraint setSecondViewAttribute:]  崩溃在此处...


//2.UIScrollview+Masonry 约束总结 https://www.jianshu.com/p/9948d917696b
 /*
 1> scrollView 的edges 与superView相等
 2> contentView 的edges 与scrollView相等.
 make.edges.equalTo(scrollView);
 make.width.equalTo(scrollView); //如果我们需要竖向的滑动 就把width设为和scrollview相同
 如果需要横向的滑动 就把height设为和scrollview相同
 布局完 子控件后，再次设置 right或bottom与子控件相等。
 */
@end
