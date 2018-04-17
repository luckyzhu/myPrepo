//
//  makeFrameViewController.m
//  summary
//
//  Created by NewBoy on 2018/4/16.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "makeFrameViewController.h"

@interface makeFrameViewController ()

@end

@implementation makeFrameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

/*
 相关链接：
 https://www.jianshu.com/p/ef5a888e57f2?from=timeline&isappinstalled=0
 https://www.jianshu.com/p/87dbf57cfe4a

 1.基本概念：
     库: 共享程序代码的方式.库是源代码经过编译，形成的二进制代码.(比如：OC代码--->0101010)
  静态库: 在程序编译的时候会被直接拷贝一份，复制到目标程序里，这段代码在目标程序里就不会再改变了
         一般以.a 和 .framework为文件后缀名
  动态库: 动态库在编译时并不会被拷贝到目标程序中，目标程序中只会存储指向动态库的引用.等到程序运行时，动态库才      会被真正加载进来。
  动态库优点：不需要拷贝到目标程序中，不会影响目标程序的体积，而且同一份库可以被多个程序使用（因为这个原因，动态库也被称作共享库）。
  动态库带来的问题：动态载入会带来一部分性能损失，使用动态库也会使得程序依赖于外部环境。如果环境缺少动态库或者库的版本不正确，就会导致程序无法运行
        以 .tbd(之前叫.dylib) 和 .framework 为文件后缀名

 2.framework
 Framework只是一种打包方式，其本身和静态、动态无关

 3.系统的.framework是动态库，我们自己建立的.framework是静态库。

 4.a与.framework有什么区别？
 .a是一个纯二进制文件，.framework中除了有二进制文件之外还有资源文件。
 .a文件不能直接使用，至少要有.h文件配合，.framework文件可以直接使用。

 5.category是我们实际开发项目中经常用到的，把category打成静态库是没有问题的，但是在用这个静态库的工程中，调用category中的方法时会有找不到该方法的运行时错误（selector not recognized），解决办法是：在使用静态库的工程中配置other linker flags的值为-ObjC。





 */

}



@end
