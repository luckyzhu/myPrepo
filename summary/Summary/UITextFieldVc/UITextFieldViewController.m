//
//  UITextFieldViewController.m
//  summary
//
//  Created by NewBoy on 2018/5/2.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "UITextFieldViewController.h"
#import <objc/runtime.h>

@interface UITextFieldViewController ()<UITextFieldDelegate>

@end

@implementation UITextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UITextField *textField = [[UITextField alloc]init];
    textField.delegate = self;
    textField.backgroundColor = [UIColor redColor];
    textField.frame = CGRectMake(50, 100, 200, 40);
    textField.placeholder = @"我是占位文字...";
    [textField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [textField setValue:[UIFont systemFontOfSize:39] forKeyPath:@"_placeholderLabel.Font"];
    [self.view addSubview:textField];


    
}

#pragma mark -代理方法
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

//    NSLog(@"当前输入的文字是----%@",textField.text);
//    NSLog(@"string-----%@",string);

    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldDidBeginEditing");
}
//-(BOOL)endEditing:(BOOL)force{
//
//    NSLog(@"endEditing");
//
//    return YES;
//}

//当在键盘上按return键的时候，会调用该方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    NSLog(@"textFieldShouldReturn-");
    [textField resignFirstResponder];
    return YES;
}

/*
 1.用KVC修改文本框的占位文字和字体
 [textField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
 [textField setValue:[UIFont systemFontOfSize:39] forKeyPath:@"_placeholderLabel.Font"];
 
 */


@end
