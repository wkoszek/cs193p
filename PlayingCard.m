#import "PlayingCard.h"

@interface PlayingCard()

@end

@implementation PlayingCard

@synthesize suit = _suit;

- (NSString *)contents
{
	NSArray *rankStrings = [PlayingCard rankStrings];
	return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *) validSuits
{
	return @[@"H", @"D", @"V", @"T"];
}

+ (NSArray *) rankStrings
{
	return @[@"?", @"A", @"2",
		@"3", @"4", @"5",
		@"6", @"7", @"8",
		@"9", @"10", @"J",
		@"Q", @"K" ];
}

- (void)setSuit:(NSString *)suit
{
	if ([[PlayingCard validSuits] containsObject:suit]) {
		_suit = suit;
	}
}

- (NSString *)suit
{
	return _suit ? _suit : @"?";
}

+ (NSUInteger) maxRank
{
	return [[PlayingCard rankStrings] count] - 1;
}

- (void) setRank:(NSUInteger)rank
{
	if (rank <= [PlayingCard maxRank]) {
		_rank = rank;
	}
}

@end
