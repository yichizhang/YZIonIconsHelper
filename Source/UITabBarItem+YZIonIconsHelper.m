//
//  UITabBarItem+YZIonIconsHelper.m
//  YZIonIconsHelperDemo
//
//  Created by Yichi on 5/12/2014.
//  Copyright (c) 2014 Yichi Zhang. All rights reserved.
//

#import "UITabBarItem+YZIonIconsHelper.h"
#import "YZIonIconsHelper.h"

@implementation UITabBarItem (YZIonIconsHelper)

+ (UITabBarItem*)yz_tabBarItemWithTitle:(NSString *)title ionIcon:(NSString*)iconName{
	
	UITabBarItem *item =
	[[UITabBarItem alloc]
	 initWithTitle:title
	 image:[YZIonIconsHelper ionIcon:iconName optimizedForClass:[self class] colorKey:yz_icon_normal_color]
	 selectedImage:[YZIonIconsHelper ionIcon:iconName optimizedForClass:[self class] colorKey:yz_icon_selected_color]
	 ];
	
	return item;
	
}

+ (UITabBarItem*)yz_tabBarItemWithTitle:(NSString *)title ionIcon:(NSString*)iconName tag:(NSInteger)tag{
	
	UITabBarItem *item =
	[self yz_tabBarItemWithTitle:title ionIcon:iconName];
	
	item.tag = tag;
	
	return item;
	
}

@end
