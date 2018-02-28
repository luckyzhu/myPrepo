//
//  FirstViewController.m
//  summary
//
//  Created by NewBoy on 2018/1/18.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "NSInvocationViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
/*
 1.NSInvocation是一个消息调用类，它包含了所有OC消息的成分：target、selector、参数以及返回值。NSInvocation可以将消息转换成一个对象，消息的每一个参数能够直接设定，而且当一个NSInvocation对象调度时返回值是可以自己设定的。
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


}

- (void)methodTest{
    NSLog(@"methodTest");
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
