//
//  PersonTest.m
//  summary
//
//  Created by NewBoy on 2019/3/5.
//  Copyright © 2019年 LX. All rights reserved.
//

#import "PersonTest.h"

@implementation PersonTest

- (void)run
{
    NSLog(@"let's run.");

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"The Second Alert" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"done", nil];
    [alert show];
}

@end
