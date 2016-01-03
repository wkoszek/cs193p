//
//  Photographer+CoreDataProperties.h
//  lesson13
//
//  Created by Wojciech Koszek (home) on 1/3/16.
//  Copyright © 2016 Wojciech Koszek (home). All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Photographer.h"

NS_ASSUME_NONNULL_BEGIN

@interface Photographer (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<Photo *> *photos;

@end

@interface Photographer (CoreDataGeneratedAccessors)

- (void)addPhotosObject:(Photo *)value;
- (void)removePhotosObject:(Photo *)value;
- (void)addPhotos:(NSSet<Photo *> *)values;
- (void)removePhotos:(NSSet<Photo *> *)values;

@end

NS_ASSUME_NONNULL_END
