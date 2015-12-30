//
//  ViewController.m
//  lesson10
//
//  Created by Wojciech Koszek (home) on 12/29/15.
//  Copyright © 2015 Wojciech Koszek (home). All rights reserved.
//

#import "ViewController.h"
#import "ImageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (NSString *)getURLWithIndex:(int)index
{
    NSArray *urls = @[
                     @"https://i.ytimg.com/vi/0hYjbeQAbnA/maxresdefault.jpg",
                     @"http://www.pugbase.com/wp-content/uploads/2014/04/Fat-Pug.jpg",
                     @"https://s-media-cache-ak0.pinimg.com/236x/18/65/05/186505928c838149777b36205bc25684.jpg"
    ];
    return urls[index % [urls count]];
}

- (int)indexFromName:(NSString *)name
{
    if ([name isEqualToString:@"showFlowers"]) return 0;
    if ([name isEqualToString:@"showPeppers"]) return 1;
    if ([name isEqualToString:@"showJellyfish"]) return 2;
    abort();
    return -1;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue destinationViewController] isKindOfClass:[UIViewController class]]) {
        NSLog(@"Name: %@", [segue identifier]);
        ImageViewController *ivc =  (ImageViewController *)[segue destinationViewController];
        ivc.imageURL = [NSURL URLWithString:[self getURLWithIndex:[self indexFromName:[segue identifier]]]];
    }
}
@end
