# MZCoreDataBrowser

[![CI Status](http://img.shields.io/travis/Mat Trudel/MZCoreDataBrowser.svg?style=flat)](https://travis-ci.org/Mat Trudel/MZCoreDataBrowser)
[![Version](https://img.shields.io/cocoapods/v/MZCoreDataBrowser.svg?style=flat)](http://cocoapods.org/pods/MZCoreDataBrowser)
[![License](https://img.shields.io/cocoapods/l/MZCoreDataBrowser.svg?style=flat)](http://cocoapods.org/pods/MZCoreDataBrowser)
[![Platform](https://img.shields.io/cocoapods/p/MZCoreDataBrowser.svg?style=flat)](http://cocoapods.org/pods/MZCoreDataBrowser)

`MZCoreDataBrowser` provides a super quick way to visualize and navigate your
Core Data models. It is designed to be used within a debug / developer menu
in an application to give you easy and deep visibility into the state of your
model data. It's dead-simple to integrate, and automatically discovers all
entities and objects within your Core Data stack.

## Usage

`MZCoreDataBrowser` is designed to be trivial to integrate with your
application. In virtually all cases, all you need to do is instantiate an
instance of `MZCoreDataBrowserViewController` and set its `context` property to
be the MOC you wish to browse. It's equally happy being instantiated via
storyboards or code. Something like the following is all you typically need:

        MZCoreDataBrowserViewController *browser = [[MZCoreDataBrowserViewController alloc] initWithManagedObjectContext:self.context];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:browser];
        [self presentViewController:navController animated:YES completion:nil];

To see an example of storyboard integration, check out the Example project.

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

At least iOS 7 and ARC is required.

## Installation

MZCoreDataBrowser is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MZCoreDataBrowser"
```

## Author

Mat Trudel, mat@geeky.net

## License

MZCoreDataBrowser is available under the MIT license. See the LICENSE file for more info.
