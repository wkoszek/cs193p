#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

-(instancetype) init {
	self = [super init];
	if (!self) {
		return self;
	}
	for (NSString *suit in [PlayingCard validSuits]) {
		for (NSUInteger rank = 1;
					rank < [PlayingCard maxRank]; rank++) {
			PlayingCard *card = [[PlayingCard alloc] init];
			card.rank = rank;
			card.suit = suit;
			[self addCard:card];
		}
	}
	return self;
}

@end
