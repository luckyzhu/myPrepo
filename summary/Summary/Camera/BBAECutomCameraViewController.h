//
//  BBAECutomCameraViewController.h
//  summary
//
//  Created by NewBoy on 2018/5/29.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBAECutomCameraViewController : UIImagePickerController

/*
 1.UIGraphicsBeginImageContext 与 UIGraphicsBeginImageContextWithOptions 区别
 使用两个方法同样都可以创建，但是使用第一个方法将来创建的图片清晰度和质量没有第二种方法的好。
 方法1：该函数的功能同UIGraphicsBeginImageContextWithOptions的功能相同,相当与UIGraphicsBeginImageContextWithOptions的opaque参数为NO,scale因子为1.0。

 方法2接收三个参数：
 CGSize size：指定将来创建出来的bitmap的大小
 BOOL opaque：设置透明YES代表透明，NO代表不透明
 CGFloat scale：代表缩放,0代表不缩放
 创建出来的bitmap就对应一个UIImage对象


 //裁剪图片
 https://www.jianshu.com/p/af0bc1883752
 http://www.jb51.net/article/81318.htm

 */

@end
