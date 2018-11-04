//
//  subViewController.m
//  summary
//
//  Created by NewBoy on 2018/1/25.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "subViewController.h"

@interface subViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation subViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    NSLog(@"000000");
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear应该程序-----%zd",[UIApplication sharedApplication].applicationState);
    
}

-(void)loadView
{
    [super loadView];

    UITableView *tableView = [[UITableView alloc]init];
    tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-88-78);
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = 44;
    [self.view addSubview:tableView];

//    CALayer *layer = [CALayer layer];
//    layer.position = CGPointMake(0, 0);
//    layer.frame = CGRectMake(0, -30, self.view.frame.size.width, 30);
//    [layer setBackgroundColor:[UIColor greenColor].CGColor];
//    [self.middleContainerView.layer addSublayer:layer];

    UIView *layer = [UIView new];
    layer.frame = CGRectMake(0, -30, self.view.frame.size.width, 30);
    layer.backgroundColor = [UIColor redColor];
    [self.view addSubview:layer];


//    [self.view addSubview:tableView];

//    UILabel *topLabel = [[UILabel alloc]init];
//    topLabel.text = @"subVc 的label 1111";
//    topLabel.frame = CGRectMake(0, 98, 375,30);
//    topLabel.textAlignment = NSTextAlignmentCenter;
//    topLabel.backgroundColor = [UIColor redColor];
//    [self.view addSubview:topLabel];
//
//    UIView *topView = [[UILabel alloc]init];
//    topView.textColor = JCOLOR(@"C3");
//    topView.frame =CGRectMake(100, 100, 100, <#CGFloat height#>)
//    topView.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:topView];

}

- (void)dismissBtn{

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)btnClick{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"第一个vc dismiss" object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(100, 400, 50, 50);
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor redColor];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    button.exclusiveTouch = YES;
    [self.view addSubview:button];


        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"dismiss" style:UIBarButtonItemStyleDone target:self action:@selector(dismissBtn)];

    return;
    
    
    ////    //调用有参无返回值的方法
    //    NSMethodSignature *signature = [[self class] methodSignatureForSelector:@selector(test1:str2:)];
    //    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    //
    //    invocation.target = self;
    //    invocation.selector = @selector(test1:str2:);
    //    NSString *name = @"SJM";
    //    int age = 18;
    //
    //    [invocation setArgument:&name atIndex:2];
    //    [invocation setArgument:&age atIndex:3];
    ////    [invocation retainArguments];
    //    [invocation invoke];
    
    //    // 1. 根据方法创建签名对象sig
    //    NSMethodSignature *sig = [[self class] instanceMethodSignatureForSelector:@selector(method)];
    //
    //    // 2. 根据签名对象创建调用对象invocation
    //    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
    //
    //    // 3. 设置调用对象的相关信息
    //    // 注意：target不要设置成局部变量
    //    invocation.target = self;
    //    invocation.selector = @selector(method);
    //
    //    //4. 调用方法
    //    [invocation invoke];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * identifer = @"UITableViewCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }

    cell.textLabel.text = [NSString stringWithFormat:@"测试数据第%zd行",indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *headerView = [[UIView alloc]init];
//    headerView.frame = CGRectMake(0, 0, 375, 44);
//    headerView.backgroundColor = [UIColor redColor];
//    return headerView;
//}



@end
