//
//  testTableViewController.h
//  summary
//
//  Created by ZhuLuxi on 2018/4/23.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface testTableViewController : UITableViewController

//1.利用masonry布局tableViewHeaderView
/*
    1 headerview的高度由子控件的高度决定
      先设置top left right 宽度。
       bottom最后设置，与子控件保持一致
    设置tableView.tableHeaderView = 自定义headerview时。
    [self.tableView layoutIfNeeded]; 不调用headerview会发生错乱。

    2 headerview子控件A的高度也是A的子控件决定的。
    可以在A的内部算好高度 在外部只设置top left right 即可。


 */

@end
