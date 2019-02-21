 分析bug的命令行
 1>   符号表: 把dsym文件到文件里。打开当前文件夹，执行如下命令
atos -arch arm64 -o BBAE.app.dSYM/Contents/Resources/DWARF/BBAE -l 
0x00000001000e0000

2>多个请求都返回结果后，再统一做事情

dispatch_group_async(self.group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
dispatch_group_enter(self.group);
      //请求一
      [self reqeustOne];
});

dispatch_group_async(self.group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
dispatch_group_enter(self.group);
    //请求二
   [ self reqeustTwo];
});

//两个请求都返回
dispatch_group_notify(self.group, dispatch_get_main_queue(), ^{

     //界面刷新
     DLog(@"任务均完成，刷新界面");

}


3> UDID UUID
UDID 设备唯一标示  iPhone连接xcode 得到的值就是UDID
UUID 设备和应用唯一标示 

4>NSURLSession全面学习笔记
http://www.cocoachina.com/ios/20181023/25261.html

5>静态库和动态库
https://pewpewthespells.com/blog/convert_static_to_dynamic.html


6.gitbook安装地址
https://blog.csdn.net/lu_embedded/article/details/81100704

7.app icon的图标
共8张
1024*1024
29*29
58*58 2x
87*87  3x
80*80  2x
120*120 3x
120*120 2x
180*180 3x

启动图 5张
640*960
640*1136
1242* 2208
750  *1334
1125 × 2436



ios 点击按钮页面支持旋转
https://segmentfault.com/q/1010000004969925
https://blog.csdn.net/st646889325/article/details/83178974


























