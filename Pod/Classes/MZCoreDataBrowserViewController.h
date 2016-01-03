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
@end
