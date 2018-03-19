//
//  subPerson.m
//  summary
//
//  Created by NewBoy on 2018/3/19.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "subPerson.h"
#import <objc/message.h>
#import "Student.h"
#import "Person.h"


@implementation subPerson

+(void)load
{

}

/*第一步拦截: 调用时机为当被调用的方法实现部分没有找到，而消息转发机制启动之前的这个中间时刻。*/
+(BOOL)resolveInstanceMethod:(SEL)sel
{
    NSLog(@"resolveInstanceMethod");

//    if (sel == @selector(subPersonTestMethod)) {
//        class_addMethod([self class],sel , (IMP)test, "v@:");
//    }

    return [super resolveInstanceMethod:sel];
}

/*第二步：重定向。消息转发机制执行前，Runtime 系统允许我们替换消息的接收者为其他对象 */
-(id)forwardingTargetForSelector:(SEL)aSelector
{
    Student *stu = [Student new];
    if ([stu respondsToSelector:aSelector]) {
        return stu;
    }

    return [super forwardingTargetForSelector:aSelector];
}

/*第三步:转发消息。这个函数和后面的forwardInvocation:是最后一个寻找IML的机会。这个函数让重载方有机会抛出一个函数的签名，再由后面的forwardInvocation:去执行。*/
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if (aSelector == @selector(subPersonTestMethod)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return nil;

}

/*
 forwardingTargetForSelector仅支持一个对象的返回，也就是说消息只能被转发给一个对象
 forwardInvocation可以将消息同时转发给任意多个对象
 */
-(void)forwardInvocation:(NSInvocation *)anInvocation
{

    if (anInvocation.selector == @selector(subPersonTestMethod)) {
#warning todo::
    }
}

#pragma mark -私有方法
void test(){
    NSLog(@"转发消息之前调用...");
};



@end
