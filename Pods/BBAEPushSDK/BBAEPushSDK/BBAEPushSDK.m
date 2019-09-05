#import "BBAEPushSDK.h"

@implementation BBAEPushSDK : NSObject

static BBAEPushSDK * _sDefaultPusher = nil;

+ (BBAEPushSDK *)defaultPusher {
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        if(_sDefaultPusher == nil)
            _sDefaultPusher = [[BBAEPushSDK alloc]init];
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
