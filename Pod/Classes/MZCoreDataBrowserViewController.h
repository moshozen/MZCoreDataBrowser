//
//  MZCoreDataBrowserViewController.h
//
//  Created by Mat Trudel on 2014-08-12.
//  Copyright (c) 2014 Moshozen Inc. All rights reserved.
//

@import UIKit;

@class NSManagedObjectContext;

@interface MZCoreDataBrowserViewController : UITableViewController
@property NSManagedObjectContext *context;
@property BOOL groupByRootEntity;
- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)context NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithStyle:(UITableViewStyle)style NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER;

@end
