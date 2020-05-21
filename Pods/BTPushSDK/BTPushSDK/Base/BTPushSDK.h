//
//  BTPushSDK.h
//  BTPushSDK
//
//  Created by NewBoy on 2020/4/10.
//  Copyright © 2020 newboy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//! Project version number for BBAEPushSDK.
FOUNDATION_EXPORT double BBAEPushSDKVersionNumber;

//! Project version string for BBAEPushSDK.
FOUNDATION_EXPORT const unsigned char BBAEPushSDKVersionString[];
@interface BTPushSDK : NSObject
+ (BTPushSDK *)defaultPusher;
+ (void)setDefaultPusher:(Class) pusher;
- (void)registerPush;
- (void)unregisterPush;
- (void)bindDeviceToken:(NSData *)deviceToken;
- (void)setAlias:(NSString *)alias;
- (void)unsetAlias:(NSString *)alias;
@end

NS_ASSUME_NONNULL_END
