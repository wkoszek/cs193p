//
//  CardMatchingGame.m
//  cs193p
//
//  Created by Wojciech Koszek (home) on 7/18/15.
//  Copyright (c) 2015 Wojciech Koszek (home). All rights reserved.
//

#import "CardMatchingGame.h"
#import "Deck.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSUInteger score;
@property (nonatomic, strong) NSMutableArray *cards;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;
{
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
                break;
            }
            [self.cards addObject:card];
        }
    }
    return self;
}


static const int MATCH_BONUS = 2;
static const int MISMATCH_PENALTY = 4;
static const int COST_TO_CHANGE = 1;

- (void) chooseCardAtIndex:(NSUInteger)index
{
	Card *card = [self cardAtIndex:index];

	if (!card.isMatched) {
		if (card.isChosen) {
			card.chosen = NO;
		} else {
			for (Card *otherCard in self.cards) {
				if (otherCard.isChosen && !otherCard.isMatched) {
					int matchScore = [card match:@[otherCard]];
					if (matchScore) {
						self.score += (matchScore * MATCH_BONUS);
						card.matched = YES;
						otherCard.matched = YES;
					} else {
						self.score -= MISMATCH_PENALTY;
						otherCard.chosen = NO;
					}
					break;
				}
			}
			self.score -= COST_TO_CHANGE;
			card.chosen = YES;
		}
	}
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    if (index >= [self.cards count]) {
        return nil;
    } else {
        return [self.cards objectAtIndex:index];
    }
}

@end
