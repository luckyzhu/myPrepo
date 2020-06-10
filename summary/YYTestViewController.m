//
//  YYTestViewController.m
//  summary
//
//  Created by NewBoy on 2020/6/1.
//  Copyright © 2020 LX. All rights reserved.
//

#import "YYTestViewController.h"
#import "YYText.h"
#import <CommonCrypto/CommonCrypto.h>
#import "YYModel.h"
#import "Person.h"
#import "LXRedView.h"
#import "subLayer.h"
#import "Student.h"

@interface YYTestViewController ()
@property (nonatomic,copy) NSString *testName;
@property (nonatomic,strong) Student *stu;

@end

@implementation YYTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    Student *stu = [[Student alloc]init];
    stu.name = @"111";
    self.stu = stu;
    

////    LXRedView *redView = [[LXRedView alloc]initWithFrame:CGRectMake(0, 100, 200, 50)];
////    [self.view addSubview:redView];


    //监听
    [self.stu addObserver:self forKeyPath:@"123" options:NSKeyValueObservingOptionNew context:nil];
    stu.name = @"222";

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testNotification) name:@"test通知" object:nil];


}

- (void)testNotification {

    NSLog(@"testNotification");
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {

    NSLog(@"kvo监听----");
}

-(void)dealloc {
    NSLog(@"dealloc------");

    @try {
            [self.stu removeObserver:self forKeyPath:@"name"];
            [self.stu removeObserver:self forKeyPath:@"name"];
    } @catch (NSException *exception) {

    } @finally {

    }
//        [self.stu removeObserver:self forKeyPath:@"age"]; //会崩溃
//    [self.stu removeObserver:self forKeyPath:@"name"];
//    [self.stu removeObserver:self forKeyPath:@"name"];
    
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"test通知" object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"test通知" object:nil];
}




/// String's md5 hash.
static NSString *_YYNSStringMD5(NSString *string) {
    if (!string) return nil;
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(data.bytes, (CC_LONG)data.length, result);
    return [NSString stringWithFormat:
                @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                result[0],  result[1],  result[2],  result[3],
                result[4],  result[5],  result[6],  result[7],
                result[8],  result[9],  result[10], result[11],
                result[12], result[13], result[14], result[15]
            ];
}
@end
