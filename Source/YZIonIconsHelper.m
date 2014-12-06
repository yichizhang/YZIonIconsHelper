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
	
	[self changeSettingFor:[UITabBarItem class] key:yz_icon_size value:@(30)];
	[self changeSettingFor:[UIBarButtonItem class] key:yz_icon_size value:@(20)];
	
}

#pragma mark - Private Methods (Other)

+ (NSString*)iconSettingsKeyForClass:(Class)aClass{
	
	return NSStringFromClass(aClass);
	
}

#pragma mark - Public Methods (Class Methods)

+ (instancetype)sharedInstance
{
	static YZIonIconsHelper *sharedInstance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
	
		sharedInstance = [[YZIonIconsHelper alloc] init];
	
	});
	return sharedInstance;
}

+ (UIImage*)ionIcon:(NSString*)iconName optimizedFor:(Class)aClass{
	
	return
	[[YZIonIconsHelper sharedInstance]
	 ionIcon:iconName
	 optimizedFor:aClass
	 ];
	
}

+ (UIImage*)ionIcon:(NSString*)iconName optimizedFor:(Class)aClass colorKey:(NSString*)colorKey{
	
	return
	[[YZIonIconsHelper sharedInstance]
	 ionIcon:iconName
	 optimizedFor:aClass
	 colorKey:colorKey
	 ];
	
}

+ (UIImage*)ionIcon:(NSString*)iconName optimizedFor:(Class)aClass color:(UIColor*)color size:(NSNumber*)size{
	
	return
	[[YZIonIconsHelper sharedInstance]
	 ionIcon:iconName
	 optimizedFor:aClass
	 color:color
	 size:size
	 ];
	
}

+ (void)changeSettingFor:(Class)aClass key:(NSString*)key value:(id)value{
	
	[[YZIonIconsHelper sharedInstance]
	 changeSettingFor:aClass
	 key:key
	 value:value
	 ];
	
}

#pragma mark - Public Methods (Instance Methods)

- (UIImage*)ionIcon:(NSString*)iconName optimizedFor:(Class)aClass{
	
	return [self ionIcon:iconName optimizedFor:aClass colorKey:yz_icon_normal_color];
	
}

- (UIImage*)ionIcon:(NSString*)iconName optimizedFor:(Class)aClass colorKey:(NSString*)colorKey{
	
	UIColor *color;
	NSNumber *size;
	
	color = [[self.settings objectForKey:[YZIonIconsHelper iconSettingsKeyForClass:aClass]]
			 objectForKey:colorKey];
	
	if (!color) {
		
		color = [[self.settings objectForKey:yz_default_icon_settings]
				 objectForKey:colorKey];
		
		if (!color) {
			
			color = [[self.settings objectForKey:yz_default_icon_settings]
					 objectForKey:yz_icon_normal_color];
			
			if (!color) {
				color = [UIColor redColor];
			}
			
		}
		
	}
	
	size = [[self.settings objectForKey:[YZIonIconsHelper iconSettingsKeyForClass:aClass]] objectForKey:yz_icon_size];
	
	if (!size) {
		
		size = [[self.settings objectForKey:yz_default_icon_settings] objectForKey:yz_icon_size];
		
		if (!size) {
			size = @(100);
		}
		
	}
	
	return [self ionIcon:iconName optimizedFor:aClass color:color size:size];
	
}

- (UIImage*)ionIcon:(NSString*)iconName optimizedFor:(Class)aClass color:(UIColor*)color size:(NSNumber*)size{
	
	UIImage *image;
	
	image = [IonIcons imageWithIcon:iconName size:[size floatValue] color:color];

	return image;
	
}

- (void)changeSettingFor:(Class)aClass key:(NSString*)key value:(id)value{
	
	if ( !( (aClass && key) && value) ) {
		return;
	}
	
	NSString *settingsKey = [YZIonIconsHelper iconSettingsKeyForClass:aClass];
	
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

@end
