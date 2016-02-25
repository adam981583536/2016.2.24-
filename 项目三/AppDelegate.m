//
//  AppDelegate.m
//  项目三
//
//  Created by 汇文教育 on 16/1/27.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "AppDelegate.h"
#import "RootTabBarController.h"
#import <ShareSDK/ShareSDK.h>
#import "WeiboSDK.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController=[[RootTabBarController alloc]init];
    [ShareSDK registerApp:SKAppkey];//字符串api20为您的ShareSDK的AppKey
    
    //添加新浪微博应用 注册网址 http://open.weibo.com
    [ShareSDK connectSinaWeiboWithAppKey:@"97284776"
                               appSecret:@"14ab535b16d2170f230ce632910bbe13"
                             redirectUri:@"http://weibo.com/5238298133/profile?topnav=1&wvr=6&is_all=1"];
//    //当使用新浪微博客户端分享的时候需要按照下面的方法来初始化新浪的平台
//    
//    [ShareSDK  connectSinaWeiboWithAppKey:@"97284776"
//                                appSecret:@"14ab535b16d2170f230ce632910bbe13"
//                              redirectUri:@"http://weibo.com/5238298133/profile?topnav=1&wvr=6&is_all=1"
//                              weiboSDKCls:[WeiboSDK class]];
//
//    //添加腾讯微博应用 注册网址 http://dev.t.qq.com
//    [ShareSDK connectTencentWeiboWithAppKey:@"801307650"
//                                  appSecret:@"ae36f4ee3946e1cbb98d6965b0b2ff5c"
//                                redirectUri:@"http://www.sharesdk.cn"];
//
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
