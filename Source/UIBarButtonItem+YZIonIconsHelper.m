//
//  UIBarButtonItem+YZIonIconsHelper.m
//  YZIonIconsHelperDemo
//
//  Created by Yichi on 5/12/2014.
//  Copyright (c) 2014 Yichi Zhang. All rights reserved.
//

#import "UIBarButtonItem+YZIonIconsHelper.h"
#import "YZIonIconsHelper.h"

@implementation UIBarButtonItem (YZIonIconsHelper)

+ (UIBarButtonItem *)yz_barButtonItemWithIonIcon:(NSString*)iconName target:(id)target action:(SEL)selector{
	
	return [UIBarButtonItem yz_barButtonItemWithIonIcon:iconName style:UIBarButtonItemStylePlain target:target action:selector];
	
}

+ (UIBarButtonItem *)yz_barButtonItemWithIonIcon:(NSString*)iconName style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)selector{
	
	UIBarButtonItem *item =
	[[UIBarButtonItem alloc]
	 initWithImage:[YZIonIconsHelper ionIconImage:iconName optimizedForClass:[UIBarButtonItem class]]
	 style:style
	 target:target
	 action:selector
	 ];
	
	return item;
	
}

@end
