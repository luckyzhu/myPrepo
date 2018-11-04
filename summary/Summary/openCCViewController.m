//
//  openCCViewController.m
//  summary
//
//  Created by NewBoy on 2018/11/2.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "openCCViewController.h"
#import "OpenCCService.h"

@interface openCCViewController ()

@end

@implementation openCCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSString *str = [[NSBundle mainBundle] pathForResource:@"string" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:str];

    NSMutableDictionary *finalDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    for (int i = 0; i < dict.allValues.count; i ++) {
        if ([dict.allValues[i] isKindOfClass:[NSString class]]) {
            NSString *result = [[[OpenCCService alloc] initWithConverterType:OpenCCServiceConverterTypeS2TWP] convert:dict.allValues[i]];
            [finalDict setValue:result forKey:dict.allKeys[i]];
        }else if ([dict.allValues[i] isKindOfClass:[NSArray class]]){

            //value对应的值是数组
            NSArray *tempArray = (NSArray * )dict.allValues[i];
            NSMutableArray *valueArray = [NSMutableArray array];
            NSMutableArray *valueArray2 = [NSMutableArray array];

            for (int j = 0; j < tempArray.count; j ++) {
                if ([tempArray[j] isKindOfClass:[NSString class]]) {
                    [valueArray addObject:[[[OpenCCService alloc] initWithConverterType:OpenCCServiceConverterTypeS2TWP] convert:tempArray[j]]];
                    [finalDict setValue:valueArray forKey:dict.allKeys[i]];
                }else if ([tempArray[j] isKindOfClass:[NSDictionary class]]){//字典数组

                    NSMutableDictionary *tempDict = [NSMutableDictionary dictionaryWithDictionary:tempArray[j]];
                    for (int k = 0; k < tempDict.allValues.count; k ++) {
                        [tempDict setValue:[[[OpenCCService alloc] initWithConverterType:OpenCCServiceConverterTypeS2TWP] convert:tempDict.allValues[k]] forKey:tempDict.allKeys[k]];
                    }

                    [valueArray2 addObject:tempDict];
                    [finalDict setValue:valueArray2 forKey:dict.allKeys[i]];
                }
            }

        }else{
            NSLog(@"其他类型---%@",[dict.allValues[i] class]);
        }

        NSLog(@"第%d个 ------%@",i , dict.allValues[i]);
    }

    //要创建的plist文件名 -> 路径
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [path stringByAppendingPathComponent:@"new.plist"];
    //将数组写入文件
    [finalDict writeToFile:filePath atomically:YES];

    NSLog(@"dict--路径--%@",filePath);

}

-(void)creatPlistFileWithArr:(NSArray *)array{
    //将字典保存到document文件->获取appdocument路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    //要创建的plist文件名 -> 路径
    NSString *filePath = [docPath stringByAppendingPathComponent:@"new.plist"];
    //将数组写入文件
    [array writeToFile:filePath atomically:YES];
    //读取文件
//    NSArray *plistArr = [NSArray arrayWithContentsOfFile:filePath];

}

@end
