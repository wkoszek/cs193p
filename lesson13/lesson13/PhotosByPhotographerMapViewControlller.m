//
//  PhotosByPhotographerMapViewControlller.m
//  lesson13
//
//  Created by Wojciech Koszek (home) on 1/10/16.
//  Copyright © 2016 Wojciech Koszek (home). All rights reserved.
//

#import "PhotosByPhotographerMapViewControlller.h"
#import "MapKit/MapKit.h"
#import "Photo+Annotation.h"
#import "ImageViewController.h"
#import "Photographer+Create.h"
#import "AddPhotoViewController.h"

@interface PhotosByPhotographerMapViewControlller () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) NSArray *photosByPhotographer;
@property (nonatomic, strong) ImageViewController *imageViewController;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addPhotoBarButtonItem;

@end

@implementation PhotosByPhotographerMapViewControlller

- (ImageViewController *)imageViewController
{
    id detailvc = [self.splitViewController.viewControllers lastObject];
    if ([detailvc isKindOfClass:[UINavigationController class]]) {
        detailvc = [((UINavigationController *)detailvc).viewControllers firstObject];
    }
    return [detailvc isKindOfClass:[ImageViewController class]] ? detailvc : nil;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *reuseId = @"PhotosByPhotographerMapViewControlller";
    MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:reuseId];
    if (!view) {
        view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseId];
        if (!self.imageViewController) {
            view.canShowCallout = YES;
            UIImageView *iview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 46, 46)];
            view.leftCalloutAccessoryView = iview;
            UIButton *button = [[UIButton alloc] init];
            [button setBackgroundImage:[UIImage imageNamed:@"disclosure"] forState:UIControlStateNormal];
            [button sizeToFit];
            view.rightCalloutAccessoryView = button;
        }
    }
    view.annotation = annotation;

    return view;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    if (self.imageViewController) {
        [self prepareViewController:self.imageViewController
                           forSegue:nil
                   toShowAnnotation:view.annotation];
    } else {
        [self updateLeftCalloutAccessoryViewInAnnotationView:view];
    }
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    [self performSegueWithIdentifier:@"Show Photo" sender:view];
}

- (void)prepareViewController:(id)vc
                     forSegue:(NSString *)segueIdentifier
             toShowAnnotation:(id <MKAnnotation>)annotation
{
    Photo *photo = nil;
    if ([annotation isKindOfClass:[Photo class]]) {
        photo = (Photo *)annotation;
    }
    if (photo) {
        if (![segueIdentifier length] || [segueIdentifier isEqualToString:@"Show Photo"]) {
            if ([vc isKindOfClass:[ImageViewController class]]) {
                ImageViewController *ivc = (ImageViewController *)vc;
                ivc.imageURL = [NSURL URLWithString:photo.imageURL];
                ivc.title = photo.title;
            }
        }
    }
}

- (void)updateMapViewAnnotations
{
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotations:self.photosByPhotographer];
    [self.mapView showAnnotations:self.photosByPhotographer animated:YES];
    if (self.imageViewController) {
        Photo *autoselectedPhoto = [self.photosByPhotographer firstObject];
        if (autoselectedPhoto) {
            [self.mapView selectAnnotation:autoselectedPhoto animated:YES];
            [self prepareViewController:self.imageViewController
                               forSegue:nil
                       toShowAnnotation:autoselectedPhoto];
        }
    }
}

- (void)updateLeftCalloutAccessoryViewInAnnotationView:(MKAnnotationView *)annotationView
{
    UIImageView *imageView = nil;
    if ([annotationView.leftCalloutAccessoryView isKindOfClass:[UIImageView class]]) {
        imageView = (UIImageView *)annotationView.leftCalloutAccessoryView;
    }
    if (imageView) {
        Photo *photo = nil;
        if ([annotationView.annotation isKindOfClass:[Photo class]]) {
            photo = (Photo *)annotationView.annotation;
        }
        if (photo) {
#warning Blocking main queue!
            imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:photo.thumbnailURL]]];
        }
    }
}

- (IBAction)addedPhoto:(UIStoryboardSegue *)segue
{
    if ([segue.sourceViewController isKindOfClass:[AddPhotoViewController class]]){
        AddPhotoViewController *apvc = (AddPhotoViewController *)segue.sourceViewController;
        Photo *addedPhoto = apvc.addedPhoto;
        if (addedPhoto) {
            [self.mapView addAnnotation:addedPhoto];
            [self.mapView showAnnotations:@[addedPhoto] animated:YES];
            self.photosByPhotographer = nil;
        } else {
            NSLog(@"AddPhotoViewController didn't add photo!!!!");
        }
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[AddPhotoViewController class]]) {
        AddPhotoViewController *avc = (AddPhotoViewController *)segue.destinationViewController;
        avc.photographerTakingPhoto = self.photographer;
    } else if ([sender isKindOfClass:[MKAnnotationView class]]) {
        [self prepareViewController:segue.destinationViewController
                           forSegue:segue.identifier
                   toShowAnnotation:((MKAnnotationView *)sender).annotation];
    }
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
    [self updateAddPhotoBarButtonItem];
}

- (void) updateAddPhotoBarButtonItem
{
    if (self.addPhotoBarButtonItem) {
        BOOL canAddPhoto = self.photographer.isUser;
        NSMutableArray *rightBarButtonItems = [self.navigationItem.rightBarButtonItems mutableCopy];
        if (!rightBarButtonItems) rightBarButtonItems = [[NSMutableArray alloc] init];
        NSUInteger addPhotoBarButtonItemIndex = [rightBarButtonItems indexOfObject:self.addPhotoBarButtonItem];
        if (addPhotoBarButtonItemIndex == NSNotFound) {
            if (canAddPhoto) [rightBarButtonItems addObject:self.addPhotoBarButtonItem];
        } else {
            if (!canAddPhoto) {
                [rightBarButtonItems removeObjectAtIndex:addPhotoBarButtonItemIndex];
            }
        }
        self.navigationItem.rightBarButtonItems = rightBarButtonItems;
    }
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
