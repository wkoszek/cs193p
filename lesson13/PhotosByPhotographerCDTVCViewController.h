//
//  PhotosByPhotographerCDTVCViewController.h
//  lesson13
//
//  Created by Wojciech Koszek (home) on 1/6/16.
//  Copyright © 2016 Wojciech Koszek (home). All rights reserved.
//

#import "CoreDataTableViewController.h"
#import "Photographer.h"

@interface PhotosByPhotographerCDTVCViewController : CoreDataTableViewController

@property (nonatomic, strong) Photographer *photographer;

@end
