//
//  LXSentinel.m
//  summary
//
//  Created by NewBoy on 2020/6/9.
//  Copyright © 2020 LX. All rights reserved.
//

#import "LXSentinel.h"

@implementation LXSentinel {
    int32_t _value;
}
- (int32_t)value {
    return _value;
}
- (int32_t)increase {
    return OSAtomicIncrement32(&_value);
}
@end
