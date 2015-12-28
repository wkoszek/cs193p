//
//  ViewController.m
//  Dropit
//
//  Created by Wojciech Koszek (home) on 12/27/15.
//  Copyright © 2015 Wojciech Koszek (home). All rights reserved.
//

#import "ViewController.h"
#import "DropitBehavior.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *gameView;
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) DropitBehavior *dropitBehavior;
@end

@implementation ViewController

static const CGSize DROP_SIZE = { 40, 40 };

- (IBAction)tap:(UITapGestureRecognizer *)sender {
    [self drop];
}

- (UIDynamicAnimator *)animator
{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.gameView];
    }
    return _animator;
}

- (DropitBehavior *)dropitBehavior
{
    if (!_dropitBehavior) {
        _dropitBehavior = [DropitBehavior new];
        [self.animator addBehavior:_dropitBehavior];
    }
    return _dropitBehavior;
}

- (void) drop {
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = DROP_SIZE;
    int x = (arc4random() % (int)self.gameView.bounds.size.width) / DROP_SIZE.width;
    frame.origin.x = x * DROP_SIZE.width;

    UIView *dropView = [[UIView alloc] initWithFrame:frame];
    dropView.backgroundColor = [self randomColor];
    [self.gameView addSubview:dropView];
    [self.dropitBehavior addItem:dropView];
}

- (UIColor *) randomColor
{

    switch (arc4random() % 5) {
        case 0: return [UIColor redColor];
        case 1: return [UIColor magentaColor];
        case 2: return [UIColor yellowColor];
        case 4: return [UIColor orangeColor];
        case 5: return [UIColor purpleColor];
    }
    return [UIColor blackColor];
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

@end
