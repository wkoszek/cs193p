//
//  PhotosByPhotographerMapViewControlller.m
//  lesson13
//
//  Created by Wojciech Koszek (home) on 1/10/16.
//  Copyright © 2016 Wojciech Koszek (home). All rights reserved.
//

#import "PhotosByPhotographerMapViewControlller.h"
#import "MapKit/MapKit.h"
#import "Photo.h"

@interface PhotosByPhotographerMapViewControlller () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) NSArray *photosByPhotographer;

@end

@implementation PhotosByPhotographerMapViewControlller

- (void)updateMapViewAnnotations
{

}

- (void)setMapView:(MKMapView *)mapView
{
    _mapView = mapView;
    self.mapView.delegate = self;
    [self updateMapViewAnnotations];
}

- (void)setPhotographer:(Photographer *)photographer
{
    _photographer = photographer;
    self.title = photographer.name;
    self.photosByPhotographer = nil;
    [self updateMapViewAnnotations];
}



- (NSArray *) photosByPhotographer
{

    if (!_photosByPhotographer) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photo"];
        request.predicate = [NSPredicate predicateWithFormat:@"whoTook = %@", self.photographer];
        _photosByPhotographer = [self.photographer.managedObjectContext executeFetchRequest:request
                                                                                      error:NULL];

    }
    return _photosByPhotographer;
}

@end
