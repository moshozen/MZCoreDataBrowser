//
//  MZCoreDataBrowserViewController.m
//
//  Created by Mat Trudel on 2014-08-12.
//  Copyright (c) 2014 Moshozen Inc. All rights reserved.
//

#import "MZCoreDataBrowserViewController.h"

@import CoreData;

#import "MZCoreDataBrowserObjectViewController.h"

@implementation MZCoreDataBrowserViewController

#pragma mark - Initializers

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:style];
}

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil
{
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    return [super initWithCoder:aDecoder];
}

- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)context
{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        self.context = context;
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (![self.parentViewController isKindOfClass:[UINavigationController class]]) {
        [NSException raise:NSGenericException format:@"MZCoreDataBrowserViewController must be presented inside a UINavigationController"];
    } else {
        if ([self.navigationController.viewControllers isEqualToArray:@[self]]) {
            self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donePressed:)];
        }
    }
}

#pragma mark - Actions

- (IBAction)donePressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self entities].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self objectsForEntity:[self entities][section]].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"itemCell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    NSManagedObject *object = [self objectForIndexPath:indexPath];
    cell.textLabel.text = object.description;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"%@ Instance(s)", [self entities][section].name];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObject *object = [self objectForIndexPath:indexPath];
    MZCoreDataBrowserObjectViewController *newViewController = [[MZCoreDataBrowserObjectViewController alloc] initWithManagedObject:object];
    [self.navigationController pushViewController:newViewController animated:YES];
}

- (NSManagedObject *)objectForIndexPath:(NSIndexPath *)indexPath
{
    return [self objectsForEntity:[self entities][indexPath.section]][indexPath.row];
}

#pragma mark - Data methods

- (NSArray<NSEntityDescription *> *)entities
{
    NSArray<NSEntityDescription *> *entities = self.context.persistentStoreCoordinator.managedObjectModel.entities;
    if (self.groupByRootEntity) {
        return [entities filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"superentity == nil"]];
    } else {
        return entities;
    }
}

- (NSArray<NSManagedObject *> *)objectsForEntity:(NSEntityDescription *)entity
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:entity.name];
    NSError *error;
    NSArray *result = [self.context executeFetchRequest:fetchRequest error:&error];
    if (!result) {
        NSLog(@"Unresolved error at %s line %d: %@, %@", __FILE__, __LINE__, error, [error userInfo]);
        abort();
    }
    return result;
}

@end
