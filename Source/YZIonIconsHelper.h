/*
 
 Copyright (c) 2014 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

@import Foundation;
@import UIKit;

FOUNDATION_EXPORT NSString *const yz_default_icon_settings;
FOUNDATION_EXPORT NSString *const yz_icon_normal_color;
FOUNDATION_EXPORT NSString *const yz_icon_selected_color;
FOUNDATION_EXPORT NSString *const yz_icon_size;

@interface YZIonIconsHelper : NSObject

@property (nonatomic, strong) NSMutableDictionary *settings;

+ (UIImage*)ionIconImage:(NSString*)iconName optimizedForSettingsKey:(NSString*)settingsKey;
+ (UIImage*)ionIconImage:(NSString*)iconName optimizedForSettingsKey:(NSString*)settingsKey colorKey:(NSString*)colorKey;

+ (UIImage*)ionIconImage:(NSString*)iconName optimizedForClass:(Class)aClass;
+ (UIImage*)ionIconImage:(NSString*)iconName optimizedForClass:(Class)aClass colorKey:(NSString*)colorKey;

+ (void)changeSettingsForSettingsKey:(NSString*)settingsKey key:(NSString*)key value:(id)value;
+ (void)changeSettingsForClass:(Class)aClass key:(NSString*)key value:(id)value;

@end
