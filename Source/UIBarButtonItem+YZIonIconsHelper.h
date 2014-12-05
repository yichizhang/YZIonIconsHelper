//
//  UIBarButtonItem+YZIonIconsHelper.h
//  YZIonIconsHelperDemo
//
//  Created by Yichi on 5/12/2014.
//  Copyright (c) 2014 Yichi Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YZIonIconsHelper)

+ (UIBarButtonItem *)yz_barButtonItemWithIonIcon:(NSString*)iconName target:(id)target action:(SEL)selector;
+ (UIBarButtonItem *)yz_barButtonItemWithIonIcon:(NSString*)iconName style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)selector;

@end
