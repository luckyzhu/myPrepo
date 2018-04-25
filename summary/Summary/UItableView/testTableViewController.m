//
//  testTableViewController.m
//  summary
//
//  Created by ZhuLuxi on 2018/4/19.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "testTableViewController.h"
#import "customTableViewCell.h"
//#import <objc/runtime.h>
@interface testTableViewController ()

@end

@implementation testTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    
//    self.tableView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//
//    NSLog(@"屏幕高度---%f",[UIScreen mainScreen].bounds.size.height);
//    NSLog(@"view高度---%f",self.view.frame.size.height);
//
//    NSLog(@"tableView的frame--%@",NSStringFromCGRect(self.tableView.frame));
//
    

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

  /*
   0.initWithStyle 创建cell 16个
   1.可见cell 4个
   2.可重用cell 12个
   */
   NSLog(@"111----%@",self.tableView.visibleCells);
   NSLog(@"444-数量--%zd",[[[self.tableView valueForKeyPath:@"_reusableTableCells"] objectForKey:@"cellxxx"] count]);

     NSLog(@"可重用cell--%@",[[self.tableView valueForKeyPath:@"_reusableTableCells"] objectForKey:@"cellxxx"]);

}

#pragma  mark - tableView的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    //    [NSThread sleepForTimeInterval:3.0];
        NSLog(@"numberOfRowsInSection");
    return 450;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
//    NSLog(@"cellForRowAtIndexPath");
    static NSString *cellId = @"cellxxx";
    customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    static int countNumber = 0;
    if (cell == nil) {
        cell = [[customTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        NSLog(@"3333----");
        countNumber++;
        cell.textLabel.text = [NSString stringWithFormat:@"测试数据－－－－－%zd",countNumber];
    }
    
//    NSLog(@"9999999999999999999");
//        NSLog(@"cellForRowAtIndexPath----%@",[NSThread currentThread]);
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [self.tableView reloadData];
    //    [self.tableView layoutIfNeeded];
    //    NSLog(@"222222");
    //    dispatch_async(dispatch_get_main_queue(), ^{
    //        // do sth
    //        NSLog(@"11111");
    //    });
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"高度----%f",cell.frame.size.height);
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//        NSLog(@"heightForRowAtIndexPath---%f",[super tableView:tableView heightForRowAtIndexPath:indexPath]);
//
//    return [super tableView:tableView heightForRowAtIndexPath:indexPath];
//    NSLog(@"heightForRowAtIndexPath");
    return 450;

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"scrollViewDidScroll 屏幕上展示的cell----%@",self.tableView.visibleCells);
    
//    NSLog(@"scrollViewDidScroll 屏幕上展示的cell数量----%zd",self.tableView.visibleCells.count);
//
//    NSLog(@"scrollViewDidScroll-可重用数量--%zd",[[[self.tableView valueForKeyPath:@"_reusableTableCells"] objectForKey:@"cellxxx"] count]);
    
//    NSLog(@"scrollViewDidScroll-可重用cell--%@",[[self.tableView valueForKeyPath:@"_reusableTableCells"] objectForKey:@"cellxxx"]);
    
}

@end
