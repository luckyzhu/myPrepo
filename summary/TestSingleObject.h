//
//  TestSingleObject.h
//  summary
//
//  Created by NewBoy on 2020/6/9.
//  Copyright © 2020 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXSentinel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TestSingleObject : NSObject

+ (instancetype)sharedInstance;
@property (nonatomic,strong) LXSentinel *sentinel;
@end

NS_ASSUME_NONNULL_END
