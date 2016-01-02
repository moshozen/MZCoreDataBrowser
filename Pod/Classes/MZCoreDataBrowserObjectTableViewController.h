//
//  MZCoreDataBrowserObjectTableViewController.h
//
//  Created by Mat Trudel on 2014-08-11.
//  Copyright (c) 2014 Moshozen Inc. All rights reserved.
//

@import UIKit;

@class NSManagedObject;

@interface MZCoreDataBrowserObjectTableViewController : UITableViewController

- (instancetype)initWithManagedObject:(NSManagedObject *)object;

@end
