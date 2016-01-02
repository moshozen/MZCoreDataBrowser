//
//  Artist+CoreDataProperties.h
//  
//
//  Created by Mat Trudel on 2016-01-02.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Artist.h"

NS_ASSUME_NONNULL_BEGIN

@interface Artist (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<Album *> *albums;

@end

@interface Artist (CoreDataGeneratedAccessors)

- (void)addAlbumsObject:(Album *)value;
- (void)removeAlbumsObject:(Album *)value;
- (void)addAlbums:(NSSet<Album *> *)values;
- (void)removeAlbums:(NSSet<Album *> *)values;

@end

NS_ASSUME_NONNULL_END
