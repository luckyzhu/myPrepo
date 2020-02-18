//
//  Student.h
//  summary
//
//  Created by NewBoy on 2018/3/19.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Student :Person

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *classNo;


@property (nonatomic,assign) NSInteger skip;

- (void)subPersonTestMethod;

@end
