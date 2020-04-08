//
//  testViewController.m
//  summary
//
//  Created by NewBoy on 2018/8/29.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "testViewController.h"
#import "subViewController.h"
#import "firstViewController.h"
#import "SUMTestView.h"
//#import "summary-Swift.h"
#import "LXTestView.h"
#import "BBAEDebugViewController.h"
#import "Masonry.h"
#import "CaculatorMaker.h"
#import "summary-Swift.h"
#import "LXTestView.h"
#import "BBAEDebugViewController.h"
#import "Masonry.h"




@interface testViewController ()<LXTestViewDelegate>
@property (nonatomic,strong) NSArray *testArray;
@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,strong) NSMutableArray *mutableArray;
@property (nonatomic,strong) LXTestView *testView;

@property (nonatomic,strong) UILabel *topLabel;
@property (nonatomic,weak) UILabel *bottomLabel;
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation testViewController

-(NSMutableArray *)mutableArray
{
    if (_mutableArray == nil) {
        _mutableArray = [NSMutableArray array];
    }
    return _mutableArray;
}

-(void)btnClick:(UIButton *)button{

    button.selected =  ! button.selected;

    if (button.selected) {
        [UIView animateWithDuration:0.25 animations:^{
            self.topLabel.frame = CGRectMake(0, 300, self.view.frame.size.width, 30);
        }];
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            self.topLabel.frame = CGRectMake(0, 100, self.view.frame.size.width, 30);
        }];
    }

}
-(void)leftButtonClick:(BBAEDealTipAlterViewType)dealType{

    NSLog(@"1111-----leftButtonClick");
}

-(void)rightButtonClick:(BBAEDealTipAlterViewType)dealType{

    NSLog(@"2222-----rightButtonClick");

}

-(void)dealloc{

    NSLog(@"testVc 被释放...");

//    NSLog(@"111---%@",self.testView);
//    NSLog(@"222---%@",self.testView.delegate);
//    NSLog(@"3333---%@",self.name);


}

-(void)timerRun{
    int count = 0;
    for (int i = 0; i < 1000000000; i++) {
        count += i;
    }
    NSLog(@"timerRun");

}



//    NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler
//                                       decimalNumberHandlerWithRoundingMode:NSRoundBankers
//                                       scale:2
//                                       raiseOnExactness:NO
//                                       raiseOnOverflow:NO
//                                       raiseOnUnderflow:NO
//                                       raiseOnDivideByZero:NO];
//
//    NSString *priceStr = @"";
//    NSDecimalNumber *number = [NSDecimalNumber decimalNumberWithString:priceStr];
//    if ([number isEqualToNumber:NSDecimalNumber.notANumber]) {
//        NSLog(@"1111--");
//    }else{
//        NSLog(@"2222--");
//    }
//    NSDecimalNumber *countNum = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%ld",NSIntegerMax]];
//    number = [number decimalNumberByMultiplyingBy:countNum withBehavior:roundUp];
//    NSLog(@"444----%@",number);

- (void)viewDidLoad{

    NSDecimalNumber *number1 = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%f",3.155]];
    NSDecimalNumber *number2 = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%f",6.1]];
    NSDecimalNumber *num = [number1 decimalNumberBySubtracting:number2]; //2.945


    NSLog(@"num===%@",[NSString stringWithFormat:@"%@",num]);


//    LXTestView *testView = [[LXTestView alloc]initWithDealTipViewType:BBAEDealTipAlterViewType_Default showStr:@"您的累计日内交易金额可能会超过今天日内交易的总金额限制，若选择继续，订单成交后，您的账户将从下一个交易日开始被限制。您可以选择:  \n +   Red    *   Green    *   Blue. 了解更多 [日内交易](https://www.bbae.com/faq/article/1063)  \n" useMd:YES];
//    testView.frame = CGRectMake(0,88, 375, 400);
//    [self.view addSubview:testView];


//    //生产者消费者
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
//    self.array = [[NSMutableArray alloc] init];
//    dispatch_queue_t queue = dispatch_queue_create("cn.chutong.www", DISPATCH_QUEUE_CONCURRENT);
//    //生产
//    dispatch_async(queue, ^{
//        while (YES) {
//            int count = random()%10;
//            sleep(1);
//            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//            [self.array addObject:[NSString stringWithFormat:@"%d",count]];
//            dispatch_semaphore_signal(semaphore);
//            NSLog(@"生产了%d",count);
//        }
//    });
//    //消费
//    dispatch_async(queue, ^{
//        while (YES) {
//            if (self.array.count>0) {
//                NSLog(@"消费了%@",self.array.lastObject);
//                dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//                [self.array removeLastObject];
//                dispatch_semaphore_signal(semaphore);
//            }
//
//        }
//    });

//    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//
//        NSLog(@"任务1:%@",[NSThread currentThread]);
//        dispatch_semaphore_signal(sem);
//    });
//
//    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"任务2:%@",[NSThread currentThread]);
//        dispatch_semaphore_signal(sem);
//    });
//
//    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"任务3:%@",[NSThread currentThread]);
//    });







//
//
//
//    NSArray *array = @[@"1",@"2",@"3",@"4",@"5",@"6",];
//    [self.mutableArray addObjectsFromArray:array];
//
//
//    NSLog(@"1111---%ld",[@"44B06E70F5BA49BC838893A06971C5D4" length]);
//    NSLog(@"2222---%ld",[@"12E8958D379546889205F1205558A921" length]);


//    __block NSInteger total = 0;
//    //多个线程同时操作数组
//
//    dispatch_queue_t t = dispatch_queue_create(NULL, DISPATCH_QUEUE_SERIAL);
////    dispatch_queue_t t = dispatch_queue_create(NULL, DISPATCH_QUEUE_CONCURRENT);
////    dispatch_queue_t t = dispatch_get_main_queue();
////    dispatch_queue_t t = dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0);
//
//    NSMutableArray *array  = [NSMutableArray array];
//
//    for (NSInteger index = 0; index < 10; index++) {
//        dispatch_sync(t, ^{
//            total += 1;
////            NSLog(@"total: %ld", total);
////            total -= 1;
////            NSLog(@"total: %ld", total);
//
//            [array addObject:@(total)];
//
//            NSLog(@"当前线程---%@",[NSThread currentThread]);
//            NSLog(@"当前数组---%@",array);
//
//        });
//    }


    /**
     异步线程:dispatch_async
     自定义串行队列:每次循环用的是同一个线程。dispatch_async 具备开线程的能力，但此时是串行队列，没必要开线程，所以用的是同一个线程。线程安全
     自定义并发队列：循环三次，开了三条线程。多条线程同时操作了total ，导致total值每次运行不一样。线程不安全
     获取主队列:  在主线程。线程安全
     获取全局并发队列: 循环三次，开了三条线程。多条线程同时操作了total ，导致total值每次运行不一样。线程不安全

     同步线程:dispatch_sync
     自定义串行队列:在主线程，线程安全.
     自定义并发队列:在主线程，线程安全.
     获取主队列:会造成死锁
     全局并发队列:在主线程，线程安全.

     线程不安全会导致什么?
     多个线程操作同一个数组，会造成数组得到的结果和我们期望的不一致。


     */


//    NSLog(@"11---%@",[NSTimeZone systemTimeZone]);
//    NSLog(@"22---%@",[NSTimeZone localTimeZone]);
//    NSLog(@"33---%@",[NSTimeZone defaultTimeZone]);
//
//
//    UIButton *button = [[UIButton alloc]init];
//    button.frame = CGRectMake(100, 400, 50, 50);
//    [button setTitle:@"按钮" forState:UIControlStateNormal];
//    button.titleLabel.textColor = [UIColor redColor];
//    button.backgroundColor = [UIColor blueColor];
//    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//    button.exclusiveTouch = YES;
//    [self.view addSubview:button];
//
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(timeZoneChanged) name:NSSystemTimeZoneDidChangeNotification object:nil];

    //
//    [NSTimeZone resetSystemTimeZone];
//    [NSTimeZone localTimeZone];

//    NSString *str = nil;
//    NSDictionary *dict2 = @{
//                           @"1":str,
//                           };

//    NSLog(@"dict2----%@",dict);

////    NSLog(@"[self getTimezone]-----%@",[self getTimezone]);
//    [NSTimeZone resetSystemTimeZone]; // 重置手机系统的时区
//    NSInteger offset = [NSTimeZone localTimeZone].secondsFromGMT;
//    offset = offset/60;
//
//    NSLog(@"offset---%ld",(long)offset);
//    offset = -0;
    //拼接两个00
//    NSString *tzStr = nil;
//    if (labs(offset) >= 0 && labs(offset) < 10) {
//        if (offset >= 0) {
//            tzStr = [NSString stringWithFormat:@"+0%ld00", labs(offset)];
//        }else{
//            tzStr = [NSString stringWithFormat:@"-0%ld00", labs(offset)];
//        }
//    }else{
//        tzStr = [NSString stringWithFormat:@"%ld00", (long)offset];
//    }
//    NSLog(@"tzStr*******--*%@",tzStr);

}


//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//
//    [self.timer invalidate];
//    self.timer = nil;
//}

-(void)timeZoneChanged{

    NSLog(@"viewDidAppear");
}


-(NSString *)getTimezone
{
    NSTimeZone *localZone = [NSTimeZone localTimeZone];
    NSString *strZoneAbbreviation = [localZone abbreviation];
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:@"[a-zA-Z]" options:0 error:nil];
    strZoneAbbreviation = [regularExpression stringByReplacingMatchesInString:strZoneAbbreviation options:0 range:NSMakeRange(0, strZoneAbbreviation.length) withTemplate:@""];
    return strZoneAbbreviation;
}

-(void)btnClick{
    //    [NSTimeZone resetSystemTimeZone];
    NSLog(@"btnClick11---%@",[NSTimeZone systemTimeZone]);
    NSLog(@"btnClick22---%@",[NSTimeZone localTimeZone]);
    NSLog(@"btnClick33---%@",[NSTimeZone defaultTimeZone]);

//    if (self.mutableArray.count > 0 ) {
//        [self.mutableArray removeObjectAtIndex:0];
//    }
//
//    [self.mutableArray addObject:@"19"];
//    NSLog(@"self.mutableArray----%@",self.mutableArray);

//    BBAEDebugViewController *vc = [BBAEDebugViewController new];
//    UINavigationController *navVc = [[UINavigationController alloc]initWithRootViewController:vc];
//    [self presentViewController:navVc animated:YES completion:nil];



}



@end
