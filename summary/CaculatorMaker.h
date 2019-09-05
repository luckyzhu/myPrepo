//
//  CaculatorMaker.h
//  summary
//
//  Created by NewBoy on 2019/8/26.
//  Copyright © 2019 LX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CaculatorMaker : NSObject

//加法
- (CaculatorMaker *(^)(int))add;

//减法
- (CaculatorMaker *(^)(int))sub;

//乘法
- (CaculatorMaker *(^)(int))muilt;

//除法
- (CaculatorMaker *(^)(int))divide;


@end

NS_ASSUME_NONNULL_END
