//
//  People.m
//  summary
//
//  Created by NewBoy on 2020/3/26.
//  Copyright © 2020 LX. All rights reserved.
//
#import "People.h"

@interface People()
@property (nonatomic,assign) NSUInteger myHash;
@end
@implementation People

//+ (void)load {
//    NSLog(@"111111");
//}

- (id)init
{
    if (self = [super init]) {
        _myHash = (NSUInteger)self;
    }
    return self;
}

- (id)copyWithZone:(nullable NSZone *)zone {
    id aCopy = [[[self class] alloc]init];
    if (aCopy) {
        [aCopy setMyHash:self.myHash];
    }
    return aCopy;
}

-(NSUInteger)hash {

    return self.myHash;
}
- (BOOL)isEqual:(id)object
{
    return self.myHash == ((People *)object).myHash;
}
@end
