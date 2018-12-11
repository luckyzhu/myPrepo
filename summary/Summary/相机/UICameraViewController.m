//
//  UICameraViewController.m
//  summary
//
//  Created by NewBoy on 2018/11/27.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "UICameraViewController.h"

@interface UICameraViewController ()

@end

@implementation UICameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.



//    UIButton *button = [[UIButton alloc]init];
//    button.frame = CGRectMake(100, 400, 50, 50);
//    [button setTitle:@"相机" forState:UIControlStateNormal];
//    button.titleLabel.textColor = [UIColor redColor];
//    button.backgroundColor = [UIColor blueColor];
//    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
//    button.exclusiveTouch = YES;
//    [self.view addSubview:button];

//    UIButton *button2 = [[UIButton alloc]init];
//    button2.frame = CGRectMake(100, 400, 50, 50);
//    [button2 setTitle:@"按钮2" forState:UIControlStateNormal];
//    button2.titleLabel.textColor = [UIColor redColor];
//    button2.backgroundColor = [UIColor blueColor];
//    [button2 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button2];


    NSString *a = nil;
    CGFloat abc = [a doubleValue];

    NSLog(@"111----%f",abc);

}


-(void)buttonClick{


    UIImagePickerController *imagePickerVC = [[UIImagePickerController alloc]init];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
   [imagePickerVC setShowsCameraControls:NO];
    [self.navigationController presentViewController:imagePickerVC animated:YES completion:nil];


}


-(void)button2Click{


}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return interfaceOrientation == UIInterfaceOrientationPortrait;
}

- (BOOL)shouldAutorotate {
    return YES;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}



@end
