//
//  Photographer+Create.h
//  lesson13
//
//  Created by Wojciech Koszek (home) on 1/3/16.
//  Copyright © 2016 Wojciech Koszek (home). All rights reserved.
//

#import "Photographer.h"

@interface Photographer (Create)

+ (Photographer *)userInManagedObjectContext:(NSManagedObjectContext *)context;

- (BOOL) isUser;

+ (Photographer *)photographerWithName:(NSString *)name
                inManagerObjectContext:(NSManagedObjectContext *)context;

@end
