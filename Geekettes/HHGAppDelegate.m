//
//  HHGAppDelegate.m
//  Geekettes
//
//  Created by Work account on 10/12/13.
//  Copyright (c) 2013 HHGeekettes. All rights reserved.
//

#import "HHGAppDelegate.h"
#import "XNGAPIClient.h"
#import "HHGProfileViewController.h"

#define XING_CLIENT_CONSUMER_SECRET @"e8d8427a9340643c34dfed9a0ae34fb3c5a52328"
#define XING_CLIENT_CONSUMER_KEY @"6a72b7a5fa3bbdf9864c"
@implementation HHGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UILabel appearance] setFont:[UIFont fontWithName:@"Lato-Light" size:14.0]];

    [self initXingClient];
    [self skipLoginIfNeeded];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([[XNGAPIClient sharedClient] handleOpenURL:url]) {
        return YES;
    } else {
        //insert your own handling
    }
    
    return NO;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)initXingClient
{
    XNGAPIClient *client = [XNGAPIClient sharedClient];
    client.consumerKey = XING_CLIENT_CONSUMER_KEY;
    client.consumerSecret = XING_CLIENT_CONSUMER_SECRET;
}
- (void)skipLoginIfNeeded
{
    XNGAPIClient *client = [XNGAPIClient sharedClient];
//    if(client.isLoggedin){
//        self.window.rootViewController = [[HHGProfileViewController alloc] init];
//    }

}
@end
