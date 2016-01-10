//
//  Photo+Annotation.m
//  lesson13
//
//  Created by Wojciech Koszek (home) on 1/10/16.
//  Copyright © 2016 Wojciech Koszek (home). All rights reserved.
//

#import "Photo+Annotation.h"

@implementation Photo (Annotation)

- (CLLocationCoordinate2D) coordinate
{
    CLLocationCoordinate2D coordinate;

    coordinate.longitude = [[self longitude] doubleValue];
    coordinate.latitude = [[self latitude] doubleValue];

    return coordinate;
}

@end
