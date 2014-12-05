//
//  UITabBarItem+YZIonIconsHelper.h
//  YZIonIconsHelperDemo
//
//  Created by Yichi on 5/12/2014.
//  Copyright (c) 2014 Yichi Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarItem (YZIonIconsHelper)

+ (UITabBarItem*)yz_tabBarItemWithTitle:(NSString *)title ionIcon:(NSString*)iconName;
+ (UITabBarItem*)yz_tabBarItemWithTitle:(NSString *)title ionIcon:(NSString*)iconName tag:(NSInteger)tag;

@end
