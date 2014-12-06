//
//  AppDelegate.m
//  YZIonIconsHelperDemo
//
//  Created by Yichi on 5/12/2014.
//  Copyright (c) 2014 Yichi Zhang. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

#import "YZIonIconsHelperImportAll.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after application launch.
	
	[YZIonIconsHelper changeSettingsFor:[UITabBarItem class] key:yz_icon_selected_color value:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0]];
	
	ViewController *vc1 = [ViewController new];
	ViewController *vc2 = [ViewController new];
	ViewController *vc3 = [ViewController new];
	
	vc1.title = @"VC 1";
	vc1.tabBarItem = [UITabBarItem yz_tabBarItemWithTitle:vc1.title ionIcon:icon_clock];
	vc1.navigationItem.leftBarButtonItem = [UIBarButtonItem yz_barButtonItemWithIonIcon:icon_navicon target:nil action:nil];
	
	vc2.title = @"VC 2";
	vc2.tabBarItem = [UITabBarItem yz_tabBarItemWithTitle:vc2.title ionIcon:icon_music_note];
	vc2.navigationItem.leftBarButtonItem = [UIBarButtonItem yz_barButtonItemWithIonIcon:icon_more target:nil action:nil];
	
	vc3.title = @"VC 3";
	vc3.tabBarItem = [UITabBarItem yz_tabBarItemWithTitle:vc3.title ionIcon:icon_wrench];
	vc3.navigationItem.leftBarButtonItem = [UIBarButtonItem yz_barButtonItemWithIonIcon:icon_grid target:nil action:nil];
	
	UINavigationController *navCon1 = [[UINavigationController alloc] initWithRootViewController:vc1];
	UINavigationController *navCon2 = [[UINavigationController alloc] initWithRootViewController:vc2];
	UINavigationController *navCon3 = [[UINavigationController alloc] initWithRootViewController:vc3];
	
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.backgroundColor = [UIColor blackColor];
	
	UITabBarController *tabBarController = [UITabBarController new];
	tabBarController.viewControllers = @[navCon1,navCon2,navCon3];
	
	self.window.rootViewController = tabBarController;
	
	[self.window makeKeyAndVisible];
	
	
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
