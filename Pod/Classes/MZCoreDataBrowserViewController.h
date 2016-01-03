//
//  MZCoreDataBrowserViewController.h
//
//  Created by Mat Trudel on 2014-08-12.
//  Copyright (c) 2014 Moshozen Inc. All rights reserved.
//

@import UIKit;

@class NSManagedObjectContext;

/**
 This class defines a view controller which presents the objects within a Core
 Data Managed Object Context and allows for inspection of the objects contained
 therein, as well as navigation between relations. It is designed to be used
 as part of a debug / developer menu within an application and isn't intended to 
 form the basis of any user-facing UI.
 
 `MZCoreDataBrowserViewController` automatically iterates over all entity types
 within your MOC, and displays a list of each entity's objects at a top level. 
 As you navigate into an object, you are able to quickly walk relations between
 objects as well as do detailed inspections of an object's attributes.

 For best results, your model objects should override `-description` to present
 a useful short summary of this object; this method is used to populate the
 description of an object in the top-level browser and within the list of
 relation objects.

 This View Controller must be presented within a UINavigationController.
 */
@interface MZCoreDataBrowserViewController : UITableViewController

/**
 The MOC whose contents this browser is to display.
 */
@property NSManagedObjectContext *context;

/**
 Specifies that the objects within this browser's context should be grouped by
 their root entity type. This is useful when browsing models which make 
 extensive use of subclassing and class cluster style patterns.

 This property only applies to the top level object list in the browser; object 
 lists describing the relations of are implicitly grouped by whatever the 
 destination type of the relation is.
 
 The default for this property is NO.
 */
@property BOOL groupByRootEntity;

/**
 Initialize a new browser instance, setting the browser's context to be the passed
 value
 */
- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)context NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithStyle:(UITableViewStyle)style NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER;

@end
