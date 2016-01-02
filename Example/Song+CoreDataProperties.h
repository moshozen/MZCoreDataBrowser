//
//  Song+CoreDataProperties.h
//  
//
//  Created by Mat Trudel on 2016-01-02.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Song.h"

NS_ASSUME_NONNULL_BEGIN

@interface Song (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSNumber *duration;
@property (nullable, nonatomic, retain) Album *album;

@end

NS_ASSUME_NONNULL_END
