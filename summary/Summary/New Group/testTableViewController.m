//
//  testTableViewController.m
//  summary
//
//  Created by ZhuLuxi on 2018/4/23.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "Masonry.h"
#import "testTableViewController.h"

@interface testTableViewController ()

@end

@implementation testTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *superView = [[UIView alloc]init];
    superView.backgroundColor = [UIColor redColor];
    self.tableView.tableHeaderView = superView;
    [superView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.mas_equalTo(self.tableView);
    }];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"我是label我是label我是label我是label我是label我是label我是label我是label我是label我是label我是label我是label";
    label.numberOfLines = 0;
    label.textColor = [UIColor blueColor];
    label.font = [UIFont systemFontOfSize:13];
    label.textAlignment = NSTextAlignmentCenter;
    [superView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(superView);
    }];
    
    UIView *bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = [UIColor lightGrayColor];
    [superView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(label.mas_bottom).offset(100);
        make.left.right.mas_equalTo(superView);
        make.height.mas_equalTo(@40);
        make.bottom.mas_equalTo(superView.mas_bottom);
    }];
    
    [self.tableView layoutIfNeeded];
}


#pragma  mark - tableView的代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据－－－－－%zd",indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
    
}


@end
