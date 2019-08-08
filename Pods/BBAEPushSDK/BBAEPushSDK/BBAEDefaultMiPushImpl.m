#import "BBAEPushSDK.h"
#import "BBAEDefaultMiPushImpl.h"

@implementation BBAEDefaultMiPushImpl

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
    [BBAEPushSDK setDefaultPusher:[self class]];
}


@end
