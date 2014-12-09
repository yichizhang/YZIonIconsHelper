/*
 
 Copyright (c) 2014 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "YZIonIconsHelper.h"
#import <ionicons/IonIcons.h>

NSString *const yz_default_icon_settings = @"yz_default_icon_settings";
NSString *const yz_icon_normal_color = @"yz_icon_normal_color";
NSString *const yz_icon_selected_color = @"yz_icon_selected_color";
NSString *const yz_icon_size = @"yz_icon_size";

@interface YZIonIconsHelper ()

@end

@implementation YZIonIconsHelper

#pragma mark - Private Methods (Set Up)

- (instancetype)init
{
    self = [super init];
    if (self) {
		[self setUp];
    }
    return self;
}

- (void)setUp{
	
	self.settings = [NSMutableDictionary dictionary];
	
	[self.settings setObject:[@{
								yz_icon_size: @(100),
								yz_icon_normal_color: [UIColor darkGrayColor],
								yz_icon_selected_color: [UIColor whiteColor]
								} mutableCopy]
					  forKey:yz_default_icon_settings
	 ];
	
	[self changeSettingsForClass:[UITabBarItem class] key:yz_icon_size value:@(30)];
	[self changeSettingsForClass:[UIBarButtonItem class] key:yz_icon_size value:@(20)];
	
}

#pragma mark - Private Methods (Other)

+ (NSString*)iconSettingsKeyForClass:(Class)aClass{
	
	return NSStringFromClass(aClass);
	
}

+ (instancetype)sharedInstance
{
	static YZIonIconsHelper *sharedInstance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		
		sharedInstance = [[YZIonIconsHelper alloc] init];
		
	});
	return sharedInstance;
}

- (UIImage*)ionIcon:(NSString*)iconName optimizedForSettingsKey:(NSString*)settingsKey firstPreferenceColor:(UIColor*)color firstPreferenceSize:(NSNumber*)size{
	
	if (!color) {
		
		color = [[self.settings objectForKey:yz_default_icon_settings]
				 objectForKey:yz_icon_normal_color];
		
		if (!color) {
			color = [UIColor redColor];
		}
		
	}
	
	if (!size) {
		
		size = [[self.settings objectForKey:yz_default_icon_settings] objectForKey:yz_icon_size];
		
		if (!size) {
			size = @(100);
		}
		
	}
	
	return [IonIcons imageWithIcon:iconName size:[size floatValue] color:color];
	
}

- (void)changeSettingsForClass:(Class)aClass key:(NSString*)key value:(id)value{
	
	[self
	 changeSettingsForSettingsKey:[YZIonIconsHelper iconSettingsKeyForClass:aClass]
	 key:key
	 value:value
	 ];
	
}

- (void)changeSettingsForSettingsKey:(NSString*)settingsKey key:(NSString*)key value:(id)value{
	
	/*
	 NSCAssert(key, @"The key can not be empty");
	 NSCAssert(value, @"The key can not be empty");
	 */
	
	if (!(settingsKey.length && key.length && value)) {
		NSLog(@"You are trying to change the settings for some nil settingsKey/itemKey/itemValue");
		return;
	}
	
	if (![self.settings objectForKey:settingsKey]) {
		
		[self.settings setObject:[@{
									key: value,
									} mutableCopy]
						  forKey:settingsKey
		 ];
		
	}else{
		
		NSMutableDictionary *settingsItemDict = [self.settings objectForKey:settingsKey];
		[settingsItemDict addEntriesFromDictionary:@{key: value}];
		
	}
	
}


#pragma mark - Public Methods (Class Methods)

+ (UIImage*)ionIconImage:(NSString*)iconName optimizedForSettingsKey:(NSString*)settingsKey{

	return
	[YZIonIconsHelper
	 ionIconImage:iconName
	 optimizedForSettingsKey:settingsKey
	 colorKey:yz_icon_normal_color
	 ];
	
}

+ (UIImage*)ionIconImage:(NSString*)iconName optimizedForSettingsKey:(NSString*)settingsKey colorKey:(NSString*)colorKey{
	
	return
	[[YZIonIconsHelper sharedInstance]
	 ionIcon:iconName
	 optimizedForSettingsKey:settingsKey
	 firstPreferenceColor:[[[YZIonIconsHelper sharedInstance].settings objectForKey:settingsKey] objectForKey:colorKey]
	 firstPreferenceSize:[[[YZIonIconsHelper sharedInstance].settings objectForKey:settingsKey] objectForKey:yz_icon_size]
	 ];
	
}

+ (UIImage*)ionIconImage:(NSString*)iconName optimizedForClass:(Class)aClass{
	
	return
	[YZIonIconsHelper
	 ionIconImage:iconName
	 optimizedForSettingsKey:[YZIonIconsHelper iconSettingsKeyForClass:aClass]
	 ];
	
}

+ (UIImage*)ionIconImage:(NSString*)iconName optimizedForClass:(Class)aClass colorKey:(NSString*)colorKey{
	
	return 
	[YZIonIconsHelper
	 ionIconImage:iconName
	 optimizedForSettingsKey:[YZIonIconsHelper iconSettingsKeyForClass:aClass]
	 colorKey:colorKey
	 ];
	
}

+ (void)changeSettingsForSettingsKey:(NSString*)settingsKey key:(NSString*)key value:(id)value{
	
	[[YZIonIconsHelper sharedInstance]
	 changeSettingsForSettingsKey:settingsKey
	 key:key
	 value:value
	 ];
	
}

+ (void)changeSettingsForClass:(Class)aClass key:(NSString*)key value:(id)value{
	
	[[YZIonIconsHelper sharedInstance]
	 changeSettingsForClass:aClass
	 key:key
	 value:value
	 ];
	
}

@end
