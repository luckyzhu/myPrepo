//
//  mainshViewController.m
//  summary
//
//  Created by NewBoy on 2018/3/22.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "mainshViewController.h"

@interface mainshViewController ()

@end

@implementation mainshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    /*
     1.待解决的问题
    for (int i =0; i < someLargeNumber; i++)
     {
     NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
     NSString *string =@"Abc";
     string = [string lowercaseString];
     string = [string stringByAppendingString:@"xyz"];
     NSLog(@"%@", string);
     [pool release];
     }

     */
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
