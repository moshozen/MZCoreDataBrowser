//
//  Album+CoreDataProperties.h
//  
//
//  Created by Mat Trudel on 2016-01-02.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Album.h"

NS_ASSUME_NONNULL_BEGIN

@interface Album (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSDate *releaseDate;
@property (nullable, nonatomic, retain) NSManagedObject *artist;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *tracks;

@end

@interface Album (CoreDataGeneratedAccessors)

- (void)addTracksObject:(NSManagedObject *)value;
- (void)removeTracksObject:(NSManagedObject *)value;
- (void)addTracks:(NSSet<NSManagedObject *> *)values;
- (void)removeTracks:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
