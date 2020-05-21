//
//  BTDefaultMiPushImpl.m
//  BTPushSDK
//
//  Created by NewBoy on 2020/4/10.
//  Copyright © 2020 newboy. All rights reserved.
//

#import "BTDefaultMiPushImpl.h"

@implementation BTDefaultMiPushImpl
- (void)bindDeviceToken:(NSData *)deviceToken {
    [MiPushSDK bindDeviceToken:deviceToken];
}

- (void)registerPush {
    [MiPushSDK registerMiPush:self];
}

- (void)setAlias:(NSString *)alias {
    [MiPushSDK setAlias:alias];
}

- (void)unregisterPush {
    [MiPushSDK unregisterMiPush];
}

- (void)unsetAlias:(NSString *)alias {
    [MiPushSDK unsetAlias:alias];
}

+ (void)load {
    [BTPushSDK setDefaultPusher:[self class]];
}
@end
