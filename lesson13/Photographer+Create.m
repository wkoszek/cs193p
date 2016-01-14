//
//  Photographer+Create.m
//  lesson13
//
//  Created by Wojciech Koszek (home) on 1/3/16.
//  Copyright © 2016 Wojciech Koszek (home). All rights reserved.
//

#import "Photographer+Create.h"

@implementation Photographer (Create)

+ (Photographer *)userInManagedObjectContext:(NSManagedObjectContext *)context
{
    return [self photographerWithName:@" My Photos" inManagerObjectContext:context];
}

- (BOOL)isUser
{
    return self == [[self class] userInManagedObjectContext:self.managedObjectContext];
}

+ (Photographer *)photographerWithName:(NSString *)name
        inManagerObjectContext:(NSManagedObjectContext *)context
{
    Photographer *photographer = nil;

    if ([name length]) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photographer"];
        request.predicate = [NSPredicate predicateWithFormat:@"name = %@", name];

        NSError *error;
        NSArray *matches = [context executeFetchRequest:request error:&error];

        if (!matches || error || ([matches count]) > 1) {
            // handle error
        } else if ([matches count]) {
            photographer = [matches lastObject];
        } else {
            photographer = [NSEntityDescription insertNewObjectForEntityForName:@"Photographer"
                                                         inManagedObjectContext:context];
            photographer.name = name;

        }
    }

    return photographer;
}

@end
