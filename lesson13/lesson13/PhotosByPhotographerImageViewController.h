//
//  PhotosByPhotographerImageViewController.h
//  lesson13
//
//  Created by Wojciech Koszek (home) on 1/12/16.
//  Copyright © 2016 Wojciech Koszek (home). All rights reserved.
//

#import "ImageViewController.h"
#import "Photographer.h"

@interface PhotosByPhotographerImageViewController : ImageViewController

@property (nonatomic, strong) Photographer *photographer;

@end
