#import "Card.h"

@interface Card()

@end

@implementation Card

@synthesize contents = _contents;
@synthesize chosen = _chosen;
@synthesize matched = _matched;

- (NSString *)contents
{
	return _contents;
}

- (void) setContents:(NSString *)contents
{
	_contents = contents;
}

- (void) setChosen:(BOOL)chosen
{
	_chosen = chosen;
}

- (BOOL) isChosen
{
	return _chosen;
}

- (void)setMatched:(BOOL)matched
{
	_matched = matched;
}

- (BOOL) isMatched
{
	return _matched;
}

- (int)match:(NSArray *)cards
{
	int score = 0;

    for (Card *card in cards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
	return score;
}

@end
