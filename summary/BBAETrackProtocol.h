

typedef void(^BBAETrackParamsBlock)(NSDictionary *dict);

@protocol BBAETrackProtocol
- (void)addTrack:(BBAETrackParamsBlock)block;
@end



FOUNDATION_EXPORT NSString * const BBAESDKTrackActionNotification;
FOUNDATION_EXPORT NSString * const BBAESDKTrackStateNotification;

FOUNDATION_EXPORT NSString * const BBAESDKTrackKey_SiteSection;
FOUNDATION_EXPORT NSString * const BBAESDKTrackKey_ActionOrStateName;
FOUNDATION_EXPORT NSString * const BBAESDKTrackKey_PageName;
FOUNDATION_EXPORT NSString * const BBAESDKTrackKey_Event;
FOUNDATION_EXPORT NSString * const BBAESDKTrackKey_ApiError;
FOUNDATION_EXPORT NSString * const BBAESDKTrackKey_AuthType;
FOUNDATION_EXPORT NSString * const BBAESDKTrackKey_SubSiteSection;
