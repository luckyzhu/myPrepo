//
//  AppDelegate.m
//  summary
//
//  Created by ZhuLuxi on 2017/11/20.
//  Copyright © 2017年 LX. All rights reserved.
//

#import "drawViewController.h"
#import "openCCViewController.h"
#import "NSArrayViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import "NSInvocationViewController.h"
#import "mianshiViewController.h"
#import "drawViewController.h"
#import "responderChainViewController.h"
#import "CoreAnimationViewController.h"
#import "labelViewController.h"
#import "catogoryViewController.h"
#import "testControlViewController.h"
#import "testTableViewController.h"
#import "BlockViewController.h"
#import "AFNViewController.h"
#import "UITextFieldViewController.h"
#import "CameraViewController.h"
#import "subViewController.h"
#import "testViewController.h"
#import "weiyiEnumViewController.h"
#import "UICameraViewController.h"
#import "OCUseSwiftViewController.h"
#import "summary-Swift.h"
#import "LXTestView.h"
#import "shortCutViewController.h"
#import "AnimationViewController.h"
#import "NSString+Extention.h"
#import "People.h"
#import "Teacher.h"
#import <UserNotifications/UserNotifications.h>
#import "WKViewController.h"
#import "SDWebImageViewController.h"
#import "People.h"

@interface AppDelegate ()
@property(nonatomic, strong) NSString *strongStr;
@property(nonatomic, copy) NSString *copyyStr;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    People *person = [People new];
    person.peopleStr1 = @"快手";

    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:@"1111" forKey:@"1"];
    [dict setObject:@"2222" forKey:@"2"];
    [dict setObject:@"3333" forKey:person];

    NSLog(@"last----%@",dict);
    NSLog(@"get----%@",[dict objectForKey:person]);


    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:[[AFNViewController alloc]init]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.


}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (UIBackgroundTaskIdentifier)beginBackgroundTaskWithName:(nullable NSString *)taskName expirationHandler:(void(^ __nullable)(void))handler{

    NSLog(@"beginBackgroundTaskWithName---%@",taskName);
    return 0;
}


@end
