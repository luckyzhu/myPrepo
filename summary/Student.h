//
//  summary
//
//  Created by NewBoy on 2020/4/8.
//  Copyright © 2020 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) int age;
@property (nonatomic,strong) NSString *buySymbol;
@property (nonatomic,assign) double moneyCount;
@end

NS_ASSUME_NONNULL_END
