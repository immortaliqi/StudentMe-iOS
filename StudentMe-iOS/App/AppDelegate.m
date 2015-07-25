//
//  AppDelegate.m
//  StudentMe-iOS
//
//  Created by SeanChense on 15/7/25.
//  Copyright (c) 2015年 UESTC-BBS. All rights reserved.
//

#import "AppDelegate.h"
#import "SMHostViewController.h"
#import "SMSideDrawerViewController.h"
#import "SMNavigationViewController.h"
#import "SMDrawerVisualStateManager.h"

#import <MMDrawerController/MMDrawerController.h>

@interface AppDelegate ()
@property (strong, nonatomic) MMDrawerController * drawerController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    SMHostViewController *centerController = [[SMHostViewController alloc] init];
    SMSideDrawerViewController *leftSideDrawerViewController = [[SMSideDrawerViewController alloc] init];
    SMNavigationViewController *navigationViewController = [[SMNavigationViewController alloc] initWithRootViewController:centerController];
    
    if(OSVersionIsAtLeastiOS7()){
        SMNavigationViewController * leftSideNavController = [[SMNavigationViewController alloc] initWithRootViewController:leftSideDrawerViewController];
        [leftSideNavController setRestorationIdentifier:@"LeftNavigationControllerRestorationKey"];
        self.drawerController = [[MMDrawerController alloc]
                                 initWithCenterViewController:navigationViewController
                                 leftDrawerViewController:leftSideNavController];
        [self.drawerController setShowsShadow:NO];
    } else {
        self.drawerController = [[MMDrawerController alloc]
                                 initWithCenterViewController:navigationViewController
                                 leftDrawerViewController:leftSideDrawerViewController];
    }
    [self.drawerController setRestorationIdentifier:@"BTDrawer"];
    [self.drawerController setMaximumRightDrawerWidth:200.0];
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    [self.drawerController
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         MMDrawerControllerDrawerVisualStateBlock block;
         block = [[SMDrawerVisualStateManager sharedManager]
                  drawerVisualStateBlockForDrawerSide:drawerSide];
         if(block){
             block(drawerController, drawerSide, percentVisible);
         }
     }];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    if(OSVersionIsAtLeastiOS7()){
        UIColor * tintColor = [UIColor colorWithRed:29.0/255.0
                                              green:173.0/255.0
                                               blue:234.0/255.0
                                              alpha:1.0];
        [self.window setTintColor:tintColor];
    }
    [self.window setRootViewController:self.drawerController];
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
