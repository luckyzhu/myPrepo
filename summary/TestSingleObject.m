//
//  TestSingleObject.m
//  summary
//
//  Created by NewBoy on 2020/6/9.
//  Copyright © 2020 LX. All rights reserved.
//

#import "TestSingleObject.h"
#import <libkern/OSAtomic.h>


@implementation TestSingleObject

static LXSentinel *_sentinel;
static TestSingleObject *_sharedInstance = nil;
static int num = 1;

+ (instancetype)sharedInstance {
    if (_sharedInstance == nil) {
        _sharedInstance = [[TestSingleObject alloc] init];
        _sharedInstance.sentinel = [[LXSentinel alloc]init];
    }
    return _sharedInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [super allocWithZone:zone];
    });
    return _sharedInstance;
}

//+ (instancetype)allocWithZone:(struct _NSZone *)zone
//{
//    _sharedInstance = [super allocWithZone:zone];
//    _sentinel = _sharedInstance.sentinel;
//    return _sharedInstance;
//}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return self;
}

@end
