//
//  AppDelegate.m
//  summary
//
//  Created by ZhuLuxi on 2017/11/20.
//  Copyright © 2017年 LX. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "LXGuideViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    //第一次打开该app或者版本更新之后，出现引导页
    NSString *currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    NSLog(@"currentVersion----%@",currentVersion);

    //本地保存的版本号
//    NSUserDefaults *userDe = [NSUserDefaults standardUserDefaults];
//    NSString *localVersion = [userDe objectForKey:@"kAPP_Version"];
//    if ([currentVersion isEqualToString:localVersion]) {
//        //已经运行过该版本
//        [[[[UIApplication sharedApplication] delegate] window] setRootViewController:[[ViewController alloc] init]];
//    } else {
//        //更新本地存储的版本
//        [userDe setObject:currentVersion forKey:@"kAPP_Version"];
//        [userDe synchronize];

        //已经运行过该版本
        [[[[UIApplication sharedApplication] delegate] window] setRootViewController:[[LXGuideViewController alloc] init]];
//    }

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


@end
