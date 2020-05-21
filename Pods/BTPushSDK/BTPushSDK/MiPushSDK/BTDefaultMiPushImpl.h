//
//  BTDefaultMiPushImpl.h
//  BTPushSDK
//
//  Created by NewBoy on 2020/4/10.
//  Copyright © 2020 newboy. All rights reserved.
//

#import "BTPushSDK.h"
#import "MiPushSDK.h"

NS_ASSUME_NONNULL_BEGIN

@interface BTDefaultMiPushImpl : BTPushSDK<MiPushSDKDelegate, UNUserNotificationCenterDelegate>

@end

NS_ASSUME_NONNULL_END
