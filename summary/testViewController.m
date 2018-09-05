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

@interface testViewController ()
@property (nonatomic,strong) NSDecimalNumber *number1;
@property (nonatomic,strong) NSDecimalNumber *number2;
@end

@implementation testViewController


-(void)loadView
{
    [super loadView];
    NSLog(@"testVc ---loadView方法...");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(100, 200, 200, 50);
    [button setTitle:@"跳入到subVc" forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor redColor];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    button.exclusiveTouch = YES;
    [self.view addSubview:button];

    UIButton *button1 = [[UIButton alloc]init];
    button1.frame = CGRectMake(100, 300, 200, 50);
    [button1 setTitle:@"跳入到firstVc" forState:UIControlStateNormal];
    button1.titleLabel.textColor = [UIColor redColor];
    button1.backgroundColor = [UIColor blueColor];
    [button1 addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];


    UIView *testView = [[UIView alloc]init];
    testView.frame = CGRectMake(100, 400, 100, 100);
    testView.backgroundColor = [UIColor greenColor];
//    testView.clipsToBounds = YES;
    [self.view addSubview:testView];



    UIView *testView1 = [[UIView alloc]init];
    testView1.frame = CGRectMake(0, 50, 100, 100);
    testView1.backgroundColor = [UIColor redColor];
    [testView addSubview:testView1];

    UILabel *topLabel = [[UILabel alloc]init];
    topLabel.frame = CGRectMake(0, 50, 100, 50);
    topLabel.text = @"今日XXXXXXXXXDDD";
    topLabel.textColor = [UIColor whiteColor];
    [testView1 addSubview:topLabel];




}

- (void)btnClick{
    subViewController *subVc = [[subViewController alloc]init];
    [self.navigationController pushViewController:subVc animated:YES];
}


- (void)btn1Click{
    firstViewController *subVc = [[firstViewController alloc]init];
    [self.navigationController pushViewController:subVc animated:YES];
}

- (double)StringChangeToDoubleForJingdu:(NSString *)textString

{

    if (textString == nil || [textString isEqualToString:@""]) {

        return 0.0;

    }

    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];



    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];



    return  [[formatter numberFromString:textString]doubleValue];



}





@end
