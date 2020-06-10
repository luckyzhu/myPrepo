//
//  LXSentinel.h
//  summary
//
//  Created by NewBoy on 2020/6/9.
//  Copyright © 2020 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <libkern/OSAtomic.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXSentinel : NSObject
/// Returns the current value of the counter.
@property (atomic, readonly) int32_t value;
/// Increase the value atomically. @return The new value.
- (int32_t)increase;
@end

NS_ASSUME_NONNULL_END
