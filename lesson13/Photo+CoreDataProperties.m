//
//  Photo+CoreDataProperties.m
//  lesson13
//
//  Created by Wojciech Koszek (home) on 1/10/16.
//  Copyright © 2016 Wojciech Koszek (home). All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Photo+CoreDataProperties.h"

@implementation Photo (CoreDataProperties)

@dynamic imageURL;
@dynamic subtitle;
@dynamic title;
@dynamic unique;
@dynamic thumbnailURL;
@dynamic longitude;
@dynamic latitude;
@dynamic whoTook;

@end
