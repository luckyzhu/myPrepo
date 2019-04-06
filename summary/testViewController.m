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
#import "summary-Swift.h"


@interface testViewController ()
@property (nonatomic,strong) NSDecimalNumber *number1;
@property (nonatomic,strong) NSDecimalNumber *number2;

@property (nonatomic,strong)  UIView *subView;
@property (nonatomic,strong)  UITextField *textField;

@property (nonatomic,strong)  UIControl *control;


@end

@implementation testViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    SUMTestView *testView = [SUMTestView new];
    testView.frame = CGRectMake(0, 64, 375, 500);
    testView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:testView];

//    swiftTestView *testView = [[swiftTestView alloc]init];
//    testView.tempStr = @"123";
//    [self.view addSubview:testView];

//    Student *stu = [Student new];
//    stu.name = @"小明";
//    stu.classNo = @"2";
//
//    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:stu];
//
//    [[NSUserDefaults standardUserDefaults] setValue:data forKey:@"student"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//
//
//    Student *obj = [[NSUserDefaults standardUserDefaults] objectForKey:@"student"];
//    NSLog(@"111---%@",obj.name);
//    NSLog(@"222---%@",obj.classNo);

//    SUMTestView *testView = [[SUMTestView alloc]init];
//    testView.backgroundColor = [UIColor lightGrayColor];
//    testView.frame = CGRectMake(0, 100, 375, 100);
//    [self.view addSubview:testView];

    return;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow) name:UIKeyboardWillShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];

//    SUMTestView *testView = [[SUMTestView alloc]initWithFrame:self.view.bounds];
//    testView.backgroundColor = [UIColor lightGrayColor];
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(testViewClick:)];
//    [testView addGestureRecognizer:tap];
//    [self.view addSubview:testView];
//
//
//    UIButton *button2 = [[UIButton alloc]init];
//    button2.frame = CGRectMake(100, 30, 50, 50);
//    [button2 setTitle:@"按钮2" forState:UIControlStateNormal];
//    button2.titleLabel.textColor = [UIColor blueColor];
//    button2.backgroundColor = [UIColor blueColor];
//    button2.userInteractionEnabled = YES;
////    [button2 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchUpInside];
//    [testView addSubview:button2];
//
//
//    UIButton *button = [[UIButton alloc]init];
//    button.frame = CGRectMake(100, 400, 50, 50);
//    [button setTitle:@"按钮1" forState:UIControlStateNormal];
//    button.titleLabel.textColor = [UIColor redColor];
//    button.backgroundColor = [UIColor blueColor];
//    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
////    button.userInteractionEnabled = NO;
//    button.exclusiveTouch = YES;
//    [self.view addSubview:button];



//    UIButton *button2 = [[UIButton alloc]init];
//    button2.frame = CGRectMake(30, 90, 400, 300);
////    [button2 setTitle:@"按钮2" forState:UIControlStateNormal];
//    button2.titleLabel.textColor = [UIColor blueColor];
//    button2.backgroundColor = [UIColor blueColor];
////    button2.userInteractionEnabled = NO;
////    [button2 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button2];

//    UIView *subView = [[SUMTestView alloc]initWithFrame:CGRectMake(30, 90, 400, 300)];
//    subView.backgroundColor = [UIColor blueColor];
////    testView.userInteractionEnabled = NO;
//    [testView addSubview:subView];
//    self.subView = subView;
//
////
//    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(30, 400, 400, 30)];
//    button.backgroundColor = [UIColor redColor];
////    button.userInteractionEnabled = YES;
//    [testView addSubview:button];
//
//
//    UIControl *control = [[UIControl alloc]initWithFrame:CGRectMake(30, 450, 400, 30)];
//    control.backgroundColor = [UIColor yellowColor];
////    control.userInteractionEnabled = NO;
//    [control addTarget:self action:@selector(controlClick) forControlEvents:UIControlEventTouchUpInside];
//    [testView addSubview:control];
//    self.control = control;

}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//
//    NSLog(@"touchesBegan");
//
//}

- (void)controlClick{
    NSLog(@"controlClick");
}


- (void)testViewClick:(UITapGestureRecognizer *)tap{

    if (CGRectContainsPoint(self.control.frame, [tap locationInView:self.control.superview])) {
        return;
    }

    NSLog(@"testViewClick");

}

- (void)button2Click{
    NSLog(@"button2Click");
}


- (void)keyboardWillChange:(NSNotification *)notify{


    NSLog(@"keyboardWillChange----%@",[notify userInfo]);

}

- (void)keyboardWillShow{

    NSLog(@"keyboardWillShow");

}

- (void)keyboardWillHide{

    NSLog(@"keyboardWillHide");

}


- (void)btnClick{
//    subViewController *subVc = [[subViewController alloc]init];
//    [self.navigationController pushViewController:subVc animated:YES];

    NSLog(@"btnClick");
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
