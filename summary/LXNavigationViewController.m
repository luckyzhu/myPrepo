//
//  LXNavigationViewController.m
//  summary
//
//  Created by NewBoy on 2018/6/3.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "LXNavigationViewController.h"
#import "BBAEPreviewPhotoViewController.h"

@interface LXNavigationViewController ()

@end

@implementation LXNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(100, 400, 50, 50);
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor redColor];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    button.exclusiveTouch = YES;
    [self.view addSubview:button];

    

}

- (void)btnClick {

    BBAEPreviewPhotoViewController *vc = [BBAEPreviewPhotoViewController new];
    [self pushViewController:vc animated:YES];
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
