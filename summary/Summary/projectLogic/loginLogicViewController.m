//
//  loginLogicViewController.m
//  summary
//
//  Created by NewBoy on 2018/4/19.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "loginLogicViewController.h"

@interface loginLogicViewController ()

@end

@implementation loginLogicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //*******屏幕锁屏的逻辑

    /*
     什么时候进入解锁界面？
     1> 进入后台开始计时，进入前台，计算前后时间差。大于5分钟，进入解锁密码界面
     2> 手动登录成功成功会进入解锁界面

     什么时候dismiss掉解锁界面
     2>进入前台如果发现当前界面有解锁界面，直接return
     3>退出登录会dismiss掉锁屏界面

     */

    //*******退出登录逻辑
    /*
     2.1 发送退出登录接口
     2.2 全局变量的回置，比如Bool 对象置空等
     2.3 删除存储在本地的缓存，比如存储的用户信息，业务信息等。




     */



}


@end
