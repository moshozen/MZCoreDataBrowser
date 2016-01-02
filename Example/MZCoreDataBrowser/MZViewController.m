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

#import "Artist.h"
#import "Album.h"
#import "Song.h"

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

    // Set up a simple data set for sample purposes
    Artist *artist = (Artist *)[[NSManagedObject alloc] initWithEntity:[model entitiesByName][@"Artist"] insertIntoManagedObjectContext:context];
    artist.name = @"Brian Eno";

    Album *album = (Album *)[[NSManagedObject alloc] initWithEntity:[model entitiesByName][@"Album"] insertIntoManagedObjectContext:context];
    album.title = @"Ambient 1: Music for Airports";
    album.releaseDate = [[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian] dateWithEra:1 year:1978 month:1 day:1 hour:0 minute:0 second:0 nanosecond:0];
    [artist addAlbumsObject:album];

    Song *track = (Song *)[[NSManagedObject alloc] initWithEntity:[model entitiesByName][@"Song"] insertIntoManagedObjectContext:context];
    track.title = @"1/1";
    track.duration = @1041;
    [album addTracksObject:track];

    track = (Song *)[[NSManagedObject alloc] initWithEntity:[model entitiesByName][@"Song"] insertIntoManagedObjectContext:context];
    track.title = @"2/1";
    track.duration = @534;
    [album addTracksObject:track];

    track = (Song *)[[NSManagedObject alloc] initWithEntity:[model entitiesByName][@"Song"] insertIntoManagedObjectContext:context];
    track.title = @"1/2";
    track.duration = @727;
    [album addTracksObject:track];

    track = (Song *)[[NSManagedObject alloc] initWithEntity:[model entitiesByName][@"Song"] insertIntoManagedObjectContext:context];
    track.title = @"2/2";
    track.duration = @578;
    [album addTracksObject:track];

    return context;
}

@end
