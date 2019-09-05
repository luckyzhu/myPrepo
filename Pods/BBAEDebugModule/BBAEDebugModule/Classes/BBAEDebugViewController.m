//
//  BBAEDebugViewController.m
//  BBAEDebugModule
//
//  Created by NewBoy on 2019/6/18.
//  Copyright © 2019 newboy. All rights reserved.
//

#import "BBAEDebugViewController.h"
#import "BBAEDebugCellView.h"
#import <FLEX/FLEX.h>
#import "BBAEDebugSwitchConfigurationView.h"


@interface BBAEDebugViewController () <BBAEDebugSwitchConfigurationViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,strong) BBAEDebugSwitchConfigurationView *passportConfigView;
@property (nonatomic,strong) BBAEDebugSwitchConfigurationView *apihostConfigView;
@property (nonatomic, strong) UIPickerView *passportPickerView;
@property (nonatomic, strong) UIPickerView *apihostPickerView;
@property (nonatomic, strong) UIView  *inputAccessoryView;

@property(nonatomic, strong) NSMutableArray *passportList;
@property(nonatomic, strong) NSMutableArray *apihostList;
@property(nonatomic, strong) UIToolbar *toolbar;

@property (nonatomic,assign) NSInteger component;
@property (nonatomic,assign) NSInteger row;


@end

@implementation BBAEDebugViewController
-(UIPickerView *)passportPickerView
{
    if (_passportPickerView == nil) {
        _passportPickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 216, self.view.frame.size.width, 216)];
        _passportPickerView.backgroundColor = [UIColor whiteColor];
        _passportPickerView.dataSource = self;
        _passportPickerView.delegate = self;
        [self.view addSubview:_passportPickerView];
    }

    return _passportPickerView;
}

-(UIPickerView *)apihostPickerView
{
    if (_apihostPickerView == nil) {
        _apihostPickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 216,self.view.frame.size.width , 216)];
        _apihostPickerView.backgroundColor = [UIColor whiteColor];
        _apihostPickerView.dataSource = self;
        _apihostPickerView.delegate = self;
        [self.view addSubview:_apihostPickerView];
    }

    return _apihostPickerView;
}

-(UIToolbar *)toolbar
{

    if (_toolbar == nil) {
        _toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, CGRectGetMinY(self.passportPickerView.frame) - 40, self.view.frame.size.width, 40)];
        UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *selecteBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(handleOK)];

        UIBarButtonItem *cancelBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(handleCancel)];
        _toolbar.items =  @[cancelBtnItem, space, selecteBtnItem];
        [self.view addSubview:_toolbar];
    }

    return _toolbar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"调试工具";

    self.view.backgroundColor = [UIColor whiteColor];

    if (self.presentingViewController != nil && [self.navigationController.viewControllers count] == 1) {
        UIButton *closeButton = [[UIButton alloc]init];
        [closeButton setTitle:@"X" forState:UIControlStateNormal];
        [closeButton  setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        closeButton.titleLabel.font = [UIFont systemFontOfSize:20];
        [closeButton addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
         self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:closeButton];
    }


    CGFloat itemHeight = 70;
    BBAEDebugCellView *cell = [[BBAEDebugCellView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, itemHeight) title:@"FLEX"];
    [cell addTarget:self action:@selector(cellClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cell];


    BBAEDebugSwitchConfigurationView *passportConfigView = [[BBAEDebugSwitchConfigurationView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(cell.frame), self.view.frame.size.width, itemHeight) leftText:@"" rightText:@"passport"];
    passportConfigView.delegate = self;
    [self.view addSubview:passportConfigView];
    self.passportConfigView = passportConfigView;

    BBAEDebugSwitchConfigurationView *apihostConfigView = [[BBAEDebugSwitchConfigurationView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(passportConfigView.frame), self.view.frame.size.width, itemHeight) leftText:@"" rightText:@"bbae接口"];
    apihostConfigView.delegate = self;
    [self.view addSubview:apihostConfigView];
    self.apihostConfigView = apihostConfigView;


    self.passportPickerView.hidden = YES;
    self.apihostPickerView.hidden = YES;


    //读取plist文件
    _passportList = [NSMutableArray array];
    _apihostList = [NSMutableArray array];

    NSString *path = nil;
#ifdef DEBUG
    path = [[NSBundle mainBundle] pathForResource:@"bbaeconfig-Debug" ofType:@"plist"];
#else
    path = [[NSBundle mainBundle] pathForResource:@"bbaeconfig" ofType:@"plist"];
#endif
    NSDictionary *datas = [[NSDictionary alloc] initWithContentsOfFile:path];
    for (id obj in [datas allValues]) {
        if ([obj isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dict = (NSDictionary *)obj;
            if (![_passportList containsObject:dict[@"passport_host"]]) {
                [_passportList addObject:dict[@"passport_host"]];
            }
            if (![_apihostList containsObject:dict[@"api_host"]]) {
                [_apihostList addObject:dict[@"api_host"]];
            }
        }
    }


    //取值
    if ([[NSUserDefaults standardUserDefaults] stringForKey:@"jms_custom_passporthost"] != nil) {
        self.passportConfigView.textField.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"jms_custom_passporthost"];
    }

    if ([[NSUserDefaults standardUserDefaults] stringForKey:@"jms_custom_host"] != nil) {
        self.apihostConfigView.textField.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"jms_custom_host"];
    }


}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    [self.passportConfigView.textField resignFirstResponder];
    [self.apihostConfigView.textField resignFirstResponder];
}

#pragma mark - buttonClick方法
-(void)handleOK{

    self.toolbar.hidden = YES;
    if (self.passportPickerView.isHidden == NO) {
//        [self.passportConfigView.textField becomeFirstResponder];
//        [self.apihostConfigView.textField resignFirstResponder];
        self.passportConfigView.textField.text = [self pickerView:self.passportPickerView titleForRow:self.row forComponent:self.component];
        [[NSUserDefaults standardUserDefaults] setObject:self.passportConfigView.textField.text forKey:@"jms_custom_passporthost"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }else if (self.apihostPickerView.isHidden == NO){
//        [self.passportConfigView.textField resignFirstResponder];
//        [self.apihostConfigView.textField becomeFirstResponder];
        self.apihostConfigView.textField.text = [self pickerView:self.apihostPickerView titleForRow:self.row forComponent:self.component];
        [[NSUserDefaults standardUserDefaults] setObject:self.apihostConfigView.textField.text forKey:@"jms_custom_host"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }

    self.passportPickerView.hidden = YES;
    self.apihostPickerView.hidden = YES;

}

-(void)handleCancel{

    self.toolbar.hidden = YES;
    self.passportPickerView.hidden = YES;
    self.apihostPickerView.hidden = YES;

}

-(void)leftBtnClick{

    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)cellClick{
    [[FLEXManager sharedManager] showExplorer];

}

-(void)rightBtnClick:(BBAEDebugSwitchConfigurationView* )configView{

    self.toolbar.hidden = NO;
    self.row = 0;
    self.component = 0;

    if (self.passportConfigView == configView) {
        self.passportPickerView.hidden = NO;
        self.apihostPickerView.hidden = YES;
        [self.passportPickerView reloadAllComponents];
    }else{
        self.passportPickerView.hidden = YES;
        self.apihostPickerView.hidden = NO;
        [self.apihostPickerView reloadAllComponents];
    }

}

#pragma mark - dataSource delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    if (self.passportPickerView == pickerView || self.apihostPickerView == pickerView){
        return 1;
    }
    return 0;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    if (self.passportPickerView == pickerView) {
        return _passportList.count;
    }else if(self.apihostPickerView == pickerView){
        return _apihostList.count;
    }

    return 0;
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    if (self.passportPickerView == pickerView) {
        return _passportList[row];
    }else if(self.apihostPickerView == pickerView){
        return _apihostList[row];
    }

    return @"";
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view{

    UILabel *pickerLabel = (UILabel *)view;

    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.numberOfLines = 0;
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
    }

    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;

}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    self.row = row;
    self.component = component;

}





@end
