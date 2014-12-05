/*
 
 Copyright (c) 2014 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "YZIonIconsHelper.h"

NSString *const yz_default_icon_settings = @"yz_default_icon_settings";
NSString *const yz_icon_normal_color = @"yz_icon_normal_color";
NSString *const yz_icon_selected_color = @"yz_icon_normal_color";
NSString *const yz_icon_size = @"yz_icon_normal_color";

@interface YZIonIconsHelper ()

@end

@implementation YZIonIconsHelper

- (void)setUp{
	
	
	
}

- (UIImage*)imageOptimizedFor:(Class)aClass{
	
	return [self imageOptimizedFor:aClass colorKey:yz_icon_normal_color];
	
}

- (UIImage*)imageOptimizedFor:(Class)aClass colorKey:(NSString*)colorKey{
	
	UIImage *image;
	UIColor *color;
	NSNumber *size;
	
	if (!(color = [[self.settings objectForKey:[YZIonIconsHelper iconSettingsKeyForClass:aClass]] objectForKey:colorKey])) {
		if (!(color = [[self.settings objectForKey:yz_default_icon_settings] objectForKey:colorKey])) {
			color = [UIColor redColor];
		}
	}
	
	if (!(size = [[self.settings objectForKey:[YZIonIconsHelper iconSettingsKeyForClass:aClass]] objectForKey:yz_icon_size])) {
		if (!(size = [[self.settings objectForKey:yz_default_icon_settings] objectForKey:yz_icon_size])) {
			size = @(100);
		}
	}
	
	return image;
	
}

+ (NSString*)iconSettingsKeyForClass:(Class)aClass{
	
	return NSStringFromClass(aClass);
	
}

@end
