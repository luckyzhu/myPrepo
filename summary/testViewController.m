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
#import "Student.h"
//#import "summary-Swift.h"
#import "LXTestView.h"
#import "BBAEDebugViewController.h"
#import "Masonry.h"
#import "CaculatorMaker.h"




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
- (void)viewDidLoad{
    [super viewDidLoad];

//    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
//    self.timer = timer;

    __weak typeof(self)weakSelf = self;
 self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:weakSelf selector:@selector(timerRun) userInfo:nil repeats:YES];

    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [weakSelf timerRun];
    }];

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


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews
     ];

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}


//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//
//    [self.timer invalidate];
//    self.timer = nil;
//}

-(void)timeZoneChanged{


    //    [NSTimeZone resetSystemTimeZone];
    NSLog(@"666---%@",[NSTimeZone systemTimeZone]);
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
