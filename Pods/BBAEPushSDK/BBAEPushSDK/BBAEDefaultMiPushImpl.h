#import <Foundation/Foundation.h>
#import "BBAEPushSDK.h"
#import "MiPushSDK.h"

@interface BBAEDefaultMiPushImpl : BBAEPushSDK<MiPushSDKDelegate, UNUserNotificationCenterDelegate>
@end
