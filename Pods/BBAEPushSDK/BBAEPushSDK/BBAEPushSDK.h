#import <UIKit/UIKit.h>


//! Project version number for BBAEPushSDK.
FOUNDATION_EXPORT double BBAEPushSDKVersionNumber;

//! Project version string for BBAEPushSDK.
FOUNDATION_EXPORT const unsigned char BBAEPushSDKVersionString[];

@interface BBAEPushSDK : NSObject

+ (BBAEPushSDK *)defaultPusher;
+ (void)setDefaultPusher:(Class) pusher;
- (void)registerPush;
- (void)unregisterPush;
- (void)bindDeviceToken:(NSData *)deviceToken;
- (void)setAlias:(NSString *)alias;
- (void)unsetAlias:(NSString *)alias;
@end
