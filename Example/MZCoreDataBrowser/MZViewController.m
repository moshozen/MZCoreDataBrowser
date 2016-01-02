//
//  MZViewController.m
//  MZCoreDataBrowser
//
//  Created by Mat Trudel on 01/02/2016.
//  Copyright (c) 2016 Mat Trudel. All rights reserved.
//

#import "MZViewController.h"

@import CoreData;

#import <MZCoreDataBrowser/MZCoreDataBrowserContextTableViewController.h>

@implementation MZViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showBrowser"]) {
        MZCoreDataBrowserContextTableViewController *browser = segue.destinationViewController;
        browser.context = [self managedObjectContext];
    }
}

#pragma mark - Example Nonsense

- (NSManagedObjectContext *)managedObjectContext {
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];

    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];

    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [context setPersistentStoreCoordinator:coordinator];

    return context;
}

@end
