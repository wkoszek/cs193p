//
//  PhotographersCDTVC.h
//  lesson13
//
//  Created by Wojciech Koszek (home) on 1/3/16.
//  Copyright © 2016 Wojciech Koszek (home). All rights reserved.
//

#import "CoreDataTableViewController.h"

@interface PhotographersCDTVC : CoreDataTableViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end
