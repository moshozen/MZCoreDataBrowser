//
//  MZCoreDataBrowserObjectViewController.m
//
//  Created by Mat Trudel on 2014-08-11.
//  Copyright (c) 2014 Moshozen Inc. All rights reserved.
//

#import "MZCoreDataBrowserObjectViewController.h"

@import CoreData;

@interface MZCoreDataBrowserObjectViewController ()
@property NSManagedObject *object;
@end

@implementation MZCoreDataBrowserObjectViewController

- (instancetype)initWithManagedObject:(NSManagedObject *)object
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        self.object = object;
        self.title = self.object.description;
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1 + self.relationshipNames.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.attributeNames.count;
    } else {
        return [[self objectsForRelationship:self.relationshipNames[section - 1]] count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Use old-school code-only cell initialization
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"attributeCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"attributeCell"];
        }
        if (self.object.changedValues[self.attributeNames[indexPath.row]]) {
            cell.textLabel.text = [NSString stringWithFormat:@"%@*", self.attributeNames[indexPath.row]];
        } else {
            cell.textLabel.text = self.attributeNames[indexPath.row];
        }
        id object = [self.object valueForKey:self.attributeNames[indexPath.row]];
        if ([object isKindOfClass:[NSArray class]] || [object isKindOfClass:[NSSet class]] || [object isKindOfClass:[NSDictionary class]]) {
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%ld elements)", NSStringFromClass([object class]), (unsigned long)[object count]];
        } else {
            cell.detailTextLabel.text = [object description];
        }
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"relationshipCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"relationshipCell"];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = [[self objectsForRelationship:self.relationshipNames[indexPath.section - 1]][indexPath.row] description];
        return cell;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Attributes";
    } else {
        if (self.object.changedValues[self.relationshipNames[section - 1]]) {
            return [NSString stringWithFormat:@"%@*", self.relationshipNames[section - 1]];
        } else {
            return self.relationshipNames[section - 1];
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        id object = [self.object valueForKey:self.attributeNames[indexPath.row]];
        [[[UIAlertView alloc] initWithTitle:self.attributeNames[indexPath.row] message:[object debugDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    } else {
        NSManagedObject *selectedObject = [self objectsForRelationship:self.relationshipNames[indexPath.section - 1]][indexPath.row];
        MZCoreDataBrowserObjectViewController *newViewController = [[MZCoreDataBrowserObjectViewController alloc] initWithManagedObject:selectedObject];
        [self.navigationController pushViewController:newViewController animated:YES];
    }
}

#pragma mark - Core Data interrogation methods

- (NSArray *)attributeNames
{
    return [self.object.entity attributesByName].allKeys;
}

- (NSArray *)relationshipNames
{
    return [self.object.entity relationshipsByName].allKeys;
}

- (NSArray *)objectsForRelationship:(NSString *)relationship
{
    id association = [self.object valueForKey:relationship];
    if ([association isKindOfClass:[NSSet class]]) {
        return [association allObjects];
    } else if (association) {
        return @[association];
    } else {
        return nil;
    }
}

@end
