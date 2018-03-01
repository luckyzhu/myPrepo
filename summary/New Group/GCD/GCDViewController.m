//
//  GCDViewController.m
//  summary
//
//  Created by NewBoy on 2018/3/1.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    
}

/**************************相关概念**************************/
/*
 1.串行队列:




 同步：就是在发出一个调用时，在没有得到结果之前，该调用就不返回。但是一旦调用返回，就得到返回值了。换句话说，就是由调用者主动等待这个调用的结果。
 异步：调用在发出之后，这个调用就直接返回了，所以没有返回结果。换句话说，当一个异步过程调用发出后，调用者不会立刻得到结果。而是在调用发出后，被调用者通过状态、通知来通知调用者，或通过回调函数处理这个调用.
 dispatch_async 是将block发送到指定线程去执行，当前线程不会等待，会继续向下执行。异步执行：可以在新的线程中执行任务，但不一定会开辟新的线程。dispatch函数会立即返回, 然后Block在后台异步执行。

 dispatch_sync 也是将block发送到指定的线程去执行，但是当前的线程会阻塞，等待block在指定线程执行完成后才会继续向下执行。同步执行：在当前线程执行任务，不会开辟新的线程。必须等到Block函数执行完毕后，dispatch函数才会返回。


 主队列:
 专门用来在主线程上调度任务的队列
 随着程序启动 系统创建的
 主队列只需要获取不用创建






 */


@end
