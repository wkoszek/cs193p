//
//  Photo+CoreDataProperties.h
//  lesson13
//
//  Created by Wojciech Koszek (home) on 1/10/16.
//  Copyright © 2016 Wojciech Koszek (home). All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Photo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Photo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *imageURL;
@property (nullable, nonatomic, retain) NSString *subtitle;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *unique;
@property (nullable, nonatomic, retain) NSString *thumbnailURL;
@property (nullable, nonatomic, retain) NSNumber *longitude;
@property (nullable, nonatomic, retain) NSNumber *latitude;
@property (nullable, nonatomic, retain) Photographer *whoTook;

@end

NS_ASSUME_NONNULL_END
