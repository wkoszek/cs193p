//
//  PhotosCDTVC.m
//  lesson13
//
//  Created by Wojciech Koszek (home) on 1/7/16.
//  Copyright © 2016 Wojciech Koszek (home). All rights reserved.
//

#import "PhotosCDTVC.h"
#import "Photo.h"

@implementation PhotosCDTVC

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Photo Cell"];
    Photo *photo = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = photo.title;
    cell.detailTextLabel.text = photo.subtitle;

    return cell;
}

@end
