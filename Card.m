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

- (int)match:(Card *)card
{
	int score = 0;

	if ([card.contents isEqualToString:self.contents]) {
		score = 1;
	}
	return score;
}

@end
