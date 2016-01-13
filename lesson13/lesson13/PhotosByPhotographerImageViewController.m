//
//  PhotosByPhotographerImageViewController.m
//  lesson13
//
//  Created by Wojciech Koszek (home) on 1/12/16.
//  Copyright © 2016 Wojciech Koszek (home). All rights reserved.
//

#import "PhotosByPhotographerImageViewController.h"
#import "PhotosByPhotographerMapViewControlller.h"

@interface PhotosByPhotographerImageViewController ()
// the embedded PhotosByPhotographerMapViewController
@property (nonatomic, strong) PhotosByPhotographerMapViewControlller *mapvc;
@end

@implementation PhotosByPhotographerImageViewController

- (void)setPhotographer:(Photographer *)photographer
{
    _photographer = photographer;
    self.title = photographer.name;
    self.mapvc.photographer = self.photographer;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[PhotosByPhotographerMapViewControlller class]]) {
        PhotosByPhotographerMapViewControlller *pbpmapvc =
        (PhotosByPhotographerMapViewControlller *)segue.destinationViewController;
        // set the embedded PhotosByPhotographerMapViewController's Model
        pbpmapvc.photographer = self.photographer;
        // hold onto the embedded PhotosByPhotographerMapViewController
        // in case our Model is nil right now
        // and then set it later when our Model gets set by the photographer property's setter
        self.mapvc = pbpmapvc;
    } else {
        // not embedding, let our superclass do any segues it can do
        [super prepareForSegue:segue sender:sender];
    }
}

@end
