//
//  ViewController.m
//  cs193p
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;

@property (nonatomic) int flipsCount;
@end

@implementation ViewController

- (void)setFlipsCount:(int) flipsCount
{
    _flipsCount = flipsCount;
    [self.flipsLabel setText:[NSString stringWithFormat:@"Flips: %d", self.flipsCount]];
    NSLog(@"Called: %d", flipsCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([[sender currentTitle] length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"A♣︎" forState:UIControlStateNormal];
    
    }
    self.flipsCount++;
}

@end
