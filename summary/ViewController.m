//
//  ViewController.m
//  summary
//
//  Created by ZhuLuxi on 2017/11/20.
//  Copyright © 2017年 LX. All rights reserved.
//
#import "Masonry.h"
#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [UIViewController performSelector:NSSelectorFromString(@"methodTest") withObject:nil];

}

- (void)testTwo{
    //    NSArray *array = @[@"所有的证券投资都有风险，证券和任何金融产品的过往业绩不保证未来的回报。",@"请投资者了解，分散投资可能帮助分散风险， 但并不一定确保收益或防止发生损失。进行证券或其他金融产品投资时，会有潜在的损失本金的风险。",@"在进行投资前，须考虑投资目标和可以承担的风险。"];

    //    //第一种写法 •
    //    CGFloat margin = 10;
    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:headerView];

    //    UILabel *label = [UILabel new];
    //    label.font = [UIFont systemFontOfSize:15];
    //    label.text = @"所有的证券投资都有风险，证券和任何金融产品的过往业绩不保证未来的回报。";
    //    CGSize size = [label.text boundingRectWithSize:CGSizeMake(self.view.frame.size.width, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    //    label.frame = CGRectMake(30, 50,self.view.frame.size.width-2*30, size.height);
    //    label.numberOfLines = 0;
    //    NSLog(@"label.frame----%@",NSStringFromCGRect(label.frame));
    //    NSLog(@"屏幕frame---%@",NSStringFromCGRect([UIScreen mainScreen].bounds));
    //    [self.view addSubview:label];





    UILabel *label = [[UILabel alloc]init];
    label.text = @"所有的证券投资都有风险，证券和任何金。哈哈哈和结束";

    label.numberOfLines = 0;
    //    NSMutableParagraphStyle *para = [[NSMutableParagraphStyle alloc]init];
    //    para.lineSpacing = 0;
    //
    //    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:label.text attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSParagraphStyleAttributeName:para}];

    label.font = [UIFont systemFontOfSize:15];
    //    CGSize size = [label.text boundingRectWithSize:CGSizeMake(self.view.frame.size.width, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSParagraphStyleAttributeName:para} context:nil].size;
    CGSize size = [label.text boundingRectWithSize:CGSizeMake(self.view.frame.size.width-2*30, 0) options:NSStringDrawingUsesLineFragmentOrigin  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;

    label.lineBreakMode=NSLineBreakByWordWrapping;
    label.frame = CGRectMake(77/2,100,self.view.frame.size.width-2*30 , size.height);
    //    label.attributedText = str;

    [self.view addSubview:label];

    //自适应高度
    //    CGFloat viewHeight = 0;
    //    for (int i = 0; i < array.count; i++) {
    //
    //        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,viewHeight, self.view.frame.size.width, 0)];
    //        label.numberOfLines = 0;
    //        label.textColor = [UIColor whiteColor];
    //        NSString *tempStr = [NSString stringWithFormat:@"• %@",array[i]];
    //        NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:tempStr];
    //        [string addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];
    //        label.attributedText = string;
    ////        [label sizeToFit];
    //        CGSize sizeThat = [label sizeThatFits:CGSizeMake(self.view.frame.size.width-2*10, MAXFLOAT)];
    //        label.frame = CGRectMake(0,viewHeight, sizeThat.width, sizeThat.height);
    //        [headerView addSubview:label];
    //        NSLog(@"当前label的frame----%@",NSStringFromCGRect(label.frame));
    //        viewHeight += label.frame.size.height;
    //    }
    //    headerView.frame = CGRectMake(margin, 30, self.vie-w.frame.size.width-2*10, viewHeight);

}
- (void)test{
    UIView *grayView1 = [[UIView alloc]init];
    grayView1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:grayView1];

    UIView *redView1 = [[UIView alloc]init];
    redView1.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView1];

    UIView *grayView2 = [[UIView alloc]init];
    grayView2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:grayView2];

    UIView *redView2 = [[UIView alloc]init];
    redView2.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView2];

    UIView *grayView3 = [[UIView alloc]init];
    grayView3.backgroundColor = [UIColor grayColor];
    [self.view addSubview:grayView3];


    [grayView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.bottom.equalTo(redView1.mas_bottom);
        make.height.mas_equalTo(20);
    }];

    [redView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(grayView1.mas_right);
        make.bottom.equalTo(self.view.mas_bottom).offset(-50);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];

    [grayView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(redView1.mas_right);
        make.bottom.equalTo(redView1.mas_bottom);
        make.width.and.height.equalTo(grayView1);
    }];
    [redView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(grayView2.mas_right);
        make.bottom.equalTo(redView1.mas_bottom);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    [grayView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(redView2.mas_right);
        make.bottom.equalTo(redView2.mas_bottom);
        make.right.equalTo(self.view.mas_right);
        make.width.and.height.equalTo(grayView1);
    }];

}

@end
