//
//  BBAEFNB.h
//  summary
//
//  Created by NewBoy on 2019/9/3.
//  Copyright © 2019 LX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface BBAEFNB : NSObject

//处理位数的金钱工具类
+(BBAEFNB *(^)(NSString *str))inputStr;

//提交上面设置的结果
-(NSString*)commit;

@end

NS_ASSUME_NONNULL_END
