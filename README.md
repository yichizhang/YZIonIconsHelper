YZIonIconsHelper
================

A few classes and categories to help make working with Ion Icons easier (sweetmandm/ionicons-iOS, pod name: 'ionicons'). You don't have to configure size and color on an ad hoc basis anymore; just configure the colors and sizes for each UI element in the settings dictionary on the singleton object of YZIonIconsHelper, then create new UIElements with the additional factory methods.

This is how I used to use 'ionicons':

```
// View Controller 1
CGFloat size = 22.0;
CGColor color = [UIColor darkGrayColor];

self.navigationItem.leftBarButtonItem =
	[[UIBarButtonItem alloc]
	 initWithImage:[IonIcons imageWithIcon:icon_navicon
									  size:size
									 color:color
					]
	 style:UIBarButtonItemStylePlain
	 target:self
	 action:someSelector
	 ];
// View Controller 2
CGFloat size = 22.0;
CGColor color = [UIColor darkGrayColor];

self.navigationItem.leftBarButtonItem =
	[[UIBarButtonItem alloc]
	 initWithImage:[IonIcons imageWithIcon:icon_navicon
									  size:size
									 color:color
					]
	 style:UIBarButtonItemStylePlain
	 target:self
	 action:someSelector
	 ];
```

I don't want to repeat the configurations any more.

With YZIonIconsHelper, configure once,

```
[YZIonIconsHelper changeSettingsFor:[UIBarButtonItem class]
								key:yz_icon_normal_color
							  value:[UIColor darkGrayColor]
 ];
[YZIonIconsHelper changeSettingsFor:[UIBarButtonItem class]
								key:yz_icon_size
							  value:@(22)
 ];

```

Then:

```
// View Controller 1
self.navigationItem.leftBarButtonItem = 
	[UIBarButtonItem yz_barButtonItemWithIonIcon:icon_navicon
										  target:nil
										  action:nil
	 ];

// View Controller 2
self.navigationItem.leftBarButtonItem = 
	[UIBarButtonItem yz_barButtonItemWithIonIcon:icon_navicon
										  target:nil
										  action:nil
	 ];
```

No more

~~`CGFloat size = 22.0;`~~
~~`CGColor color = [UIColor darkGrayColor];`~~


##How to use?

It is recommended that you use cocoapods to add YZIonIconsHelper.
If you've never used CocoaPods, [check out their page](http://cocoapods.org/):

###Step 1

1. Add `pod 'YZIonIconsHelper'` to you `Podfile`
2. Run `pod install` command in the directory that contains your Podfile
3. Open the freshly generated `xcworkspace` file
4. Modify your project's `Info.plist` file, add `ionicons.ttf` to `Fonts provided by application` 

###Step 2

You can either follow this link [Step 2 on sweetmandm/ionicons-iOS](https://github.com/sweetmandm/ionicons-iOS) or continue on to follow my instructions (which is copied from https://github.com/sweetmandm/ionicons-iOS anyway)

Modify your project's Info.plist file:

1. Open your project's Info.plist file by clicking on the project in the Navigator on the left, then choosing 'Info'.
2. Under 'Custom iOS Target Properties', click the last Key in the list, then click on the '+' icon.
3. For the new key, type 'Fonts provided by application'.
4. Twirl down the arrow icon, double-tap the right-most box to enter the string value, and type 'ionicons.ttf'.
![Info.plist modification](https://raw.github.com/TapTemplate/ionicons-iOS/master/Example-ionicons/img/install-instructions.png)

###Step 3

1. Import the code by `#import "YZIonIconsHelperImportAll.h"`

You are ready to go. 

##How to prepare the Demo Project?

You have to use `cocoapods` to prepare the Demo Project
Since `Pods` are ignored, `pod install` in 