YZIonIconsHelper
================

A few classes and categories to help make working with Ion Icons easier (sweetmandm/ionicons-iOS, pod name: 'ionicons'). You don't have to configure size and color on an ad hoc basis anymore; just configure the colors and sizes for each UI element in the settings dictionary on the singleton object of YZIonIconsHelper, then create new UIElements with the additional factory methods.

##How to use?

It is recommended that you use cocoapods to add YZIonIconsHelper.
If you've never used [CocoaPods](http://cocoapods.org/):

Step 1

1. Add `pod 'YZIonIconsHelper'` to you `Podfile`
2. Run `pod install` command in the directory that contains your Podfile
3. Open the freshly generated `xcworkspace` file
4. Modify your project's `Info.plist` file, add `ionicons.ttf` to `Fonts provided by application`

 https://github.com/sweetmandm/ionicons-iOS

##How to prepare the Demo Project?