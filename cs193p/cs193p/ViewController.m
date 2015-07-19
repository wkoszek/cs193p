//
//  ViewController.m
//  cs193p
//

#import "ViewController.h"
#import "PlayingCardDeck.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (strong, nonatomic) Deck *deck;
@property (nonatomic) int flipsCount;
@end

@implementation ViewController

- (Deck *)deck
{
    if (!_deck) _deck = [self createDeck];
    return _deck;
}

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

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
        self.flipsCount++;
    } else {
        Card *card = [self.deck drawRandomCard];
        if (card) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
            [sender setTitle:[card contents] forState:UIControlStateNormal];
            self.flipsCount++;
        }
    }
}

@end
