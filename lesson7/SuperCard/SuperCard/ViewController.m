//
//  ViewController.m
//  SuperCard
//
//  Created by Wojciech Koszek (home) on 12/26/15.
//  Copyright © 2015 Wojciech Koszek (home). All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;

@end

@implementation ViewController

- (IBAction)swipe:(UISwipeGestureRecognizer *)sender
{

    NSLog(@"swipe");
    if ([sender direction] == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"swipe right detected");
        self.playingCardView.faceUp = !self.playingCardView.faceUp;
    } else if ([sender direction] == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"swipe left detected");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.playingCardView.suit = @"♥";
    self.playingCardView.rank = 13;
    [self.playingCardView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.playingCardView action:@selector(pinch:)]];
}

@end
