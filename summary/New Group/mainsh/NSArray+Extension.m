//
//  NSArray+Extension.m
//  summary
//
//  Created by NewBoy on 2018/4/4.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "NSArray+Extension.h"

@implementation NSArray (Extension)

+ (NSArray *)removeTheSameElementInArray:(NSArray *)originArray{
    
    return [[[self alloc]init] removeTheSameElementInArrayWithContainObject:originArray];
}

//1.使用containObject去重
- (NSArray *)removeTheSameElementInArrayWithContainObject:(NSArray *)array{

    NSMutableArray *newArray = [NSMutableArray array];
    for (int i = 0; i < array.count; i ++ ) {
        if (![newArray containsObject:array[i]]) {
            [newArray addObject:array[i]];
        }
    }
    return newArray;
}

//2.使用KVO去重
 
@end
