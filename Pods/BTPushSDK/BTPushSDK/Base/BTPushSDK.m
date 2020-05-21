//
//  BTPushSDK.m
//  BTPushSDK
//
//  Created by NewBoy on 2020/4/10.
//  Copyright © 2020 newboy. All rights reserved.
//

#import "BTPushSDK.h"

@implementation BTPushSDK
static BTPushSDK * _sDefaultPusher = nil;

+ (BTPushSDK *)defaultPusher {

    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        if(_sDefaultPusher == nil)
            _sDefaultPusher = [[BTPushSDK alloc]init];
    });
    return _sDefaultPusher;
}

+(void)setDefaultPusher:(Class) pusher{
    _sDefaultPusher = [[pusher alloc]init];
}

- (void)registerPush{
}
- (void)unregisterPush{
}
- (void)bindDeviceToken:(NSData *)deviceToken{
}
- (void)setAlias:(NSString *)alias{
}
- (void)unsetAlias:(NSString *)alias{
}
@end
