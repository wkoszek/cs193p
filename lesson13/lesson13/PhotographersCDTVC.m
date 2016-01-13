//
//  PhotographersCDTVC.m
//  lesson13
//
//  Created by Wojciech Koszek (home) on 1/3/16.
//  Copyright © 2016 Wojciech Koszek (home). All rights reserved.
//

#import "Photographer.h"
#import "PhotographersCDTVC.h"
#import "PhotoDatabaseAvailability.h"
#import "PhotosByPhotographerCDTVC.h"
#import "PhotosByPhotographerMapViewControlller.h"
#import "PhotosByPhotographerImageViewController.h"

@implementation PhotographersCDTVC

- (void)awakeFromNib
{
    [[NSNotificationCenter defaultCenter] addObserverForName:PhotoDatabaseAvailabilityNotification
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification * _Nonnull note) {
                                                      self.managedObjectContext = note.userInfo[PhotoDatabaseAvailabilityContext];
                                                  }];
}

-(void)setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    _managedObjectContext = managedObjectContext;

    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photographer"];
    request.predicate = nil;
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name"
                                                              ascending:YES
                                                               selector:@selector(localizedStandardCompare:)]];

    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Photographer Cell"];

    Photographer *photographer = [self.fetchedResultsController objectAtIndexPath:indexPath];

    cell.textLabel.text = photographer.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld photos", [photographer.photos count]];

    return cell;
}


#pragma mark - Navigation

- (void)prepareViewController:(id)vc forSegue:(NSString *)segueIdentifer fromIndexPath:(NSIndexPath *)indexPath
{
    Photographer *photographer = [self.fetchedResultsController objectAtIndexPath:indexPath];

    if ([vc isKindOfClass:[PhotosByPhotographerCDTVC class]]) {
        PhotosByPhotographerCDTVC *pbpcdtvc = (PhotosByPhotographerCDTVC *)vc;
        pbpcdtvc.photographer = photographer;
    } else if ([vc isKindOfClass:[PhotosByPhotographerMapViewControlller class]]) {
        PhotosByPhotographerMapViewControlller *pbpmvc = (PhotosByPhotographerMapViewControlller *)vc;
        pbpmvc.photographer = photographer;
    } else if ([vc isKindOfClass:[PhotosByPhotographerImageViewController class]]) {
        PhotosByPhotographerImageViewController *pbpivc = (PhotosByPhotographerImageViewController *)vc;
        pbpivc.photographer = photographer;
    }
}

// boilerplate
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = nil;
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        indexPath = [self.tableView indexPathForCell:sender];
    }
    [self prepareViewController:segue.destinationViewController
                       forSegue:segue.identifier
                  fromIndexPath:indexPath];
}

// boilerplate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id detailvc = [self.splitViewController.viewControllers lastObject];
    if ([detailvc isKindOfClass:[UINavigationController class]]) {
        detailvc = [((UINavigationController *)detailvc).viewControllers firstObject];
        [self prepareViewController:detailvc
                           forSegue:nil
                      fromIndexPath:indexPath];
    }
}

@end
