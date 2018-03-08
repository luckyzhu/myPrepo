//
//  ViewController.m
//  summary
//
//  Created by ZhuLuxi on 2017/11/20.
//  Copyright © 2017年 LX. All rights reserved.
//
#import <objc/runtime.h>
#import "Masonry.h"
#import "ViewController.h"


@interface managerTool:NSObject

@end

@implementation managerTool

@end

@interface ViewController()
@property(nonatomic, strong)UIPageControl *pageControl;

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    __weak typeof(self) weakself = self;

    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.enabled = NO;
    self.pageControl.numberOfPages = 3;
    self.pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl.pageIndicatorTintColor = [UIColor redColor];
    [self.view addSubview:self.pageControl];
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(weakself.view);
        make.bottom.mas_equalTo(weakself.view).offset(-60);
        make.height.mas_equalTo(@20);
    }];

    NSLog(@"%@",self.pageControl.subviews);

}


- (void)testWithParams:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3{



}


@end
