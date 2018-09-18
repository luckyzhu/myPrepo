//
//  weiyiEnumViewController.m
//  summary
//
//  Created by NewBoy on 2018/9/17.
//  Copyright © 2018年 LX. All rights reserved.
//

#define  showHeaderOrFooter NBHeaderAndFooterUp
#import "weiyiEnumViewController.h"
#import "edgeView.h"

@interface weiyiEnumViewController ()

@end

@implementation weiyiEnumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *testView = [[UIView alloc]init];
    testView.frame = CGRectMake(0, 300, 200, 200);
    [self.view addSubview:[[edgeView alloc]initWithOriginView:testView type:showHeaderOrFooter]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
