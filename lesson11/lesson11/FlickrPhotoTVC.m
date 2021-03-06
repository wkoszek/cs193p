//
//  FlickrPhotoTVC.m
//  lesson11
//
//  Created by Wojciech Koszek (home) on 12/30/15.
//  Copyright © 2015 Wojciech Koszek (home). All rights reserved.
//

#import "FlickrPhotoTVC.h"
#import "FlickrFetcher.h"
#import "ImageViewController.h"

@interface FlickrPhotoTVC ()

@end

@implementation FlickrPhotoTVC

- (void)setPhotos:(NSArray *)photos
{
    _photos = photos;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.photos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"Flickr Photo Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];

    NSDictionary *photo = self.photos[indexPath.row];
    cell.textLabel.text = [photo valueForKeyPath:FLICKR_PHOTO_TITLE];
    cell.detailTextLabel.text = [photo valueForKeyPath:FLICKR_PHOTO_DESCRIPTION];

    return cell;
}

#pragma mark - asd

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id details = self.splitViewController.viewControllers[1];


    if ([details isKindOfClass:[UINavigationController class]]) {
        details = [((UINavigationController *)details).viewControllers firstObject];
    }
    if ([details isKindOfClass:[ImageViewController class]]) {
         [self prepareImageViewController:details toDisplayPhoto:self.photos[indexPath.row]];
    }
}

#pragma mark - Navigation

- (void)prepareImageViewController:(ImageViewController *)ivc toDisplayPhoto:(NSDictionary *)photo
{
    ivc.imageURL = [FlickrFetcher URLforPhoto:photo format:FlickrPhotoFormatLarge];
    ivc.title = [photo valueForKeyPath:FLICKR_PHOTO_TITLE];
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if (![sender isKindOfClass:[UITableViewCell class]]) {
        return;
    }
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    if (!indexPath) {
        return;
    }
    if ([segue.identifier isEqualToString:@"Display Photo"]) {
        if ([segue.destinationViewController isKindOfClass:[ImageViewController class]]) {
            [self prepareImageViewController:segue.destinationViewController
                              toDisplayPhoto:self.photos[indexPath.row]];
        }
    }
}


@end
