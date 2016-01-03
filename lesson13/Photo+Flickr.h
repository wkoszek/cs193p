//
//  Photo+Flickr.h
//  lesson13
//
//  Created by Wojciech Koszek (home) on 1/3/16.
//  Copyright © 2016 Wojciech Koszek (home). All rights reserved.
//

#import "Photo.h"

@interface Photo (Flickr)

+ (Photo *)photoWithFlickrInfo:(NSDictionary *)photoDictionary
        inManagerObjectContext:(NSManagedObjectContext *)context;

+ (void)loadPhotosFromFlickrArray:(NSArray *)photos
         intoManagedObjectContext:(NSManagedObjectContext *)context;

@end
