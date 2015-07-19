#import <Foundation/Foundation.h>
#import "PlayingCardDeck.h"

#include <assert.h>

int
main()
{
	@autoreleasepool {
		PlayingCardDeck *deck = [PlayingCardDeck new];
		Card	*card;
		int	card_cnt = 0;

		do {
			card = [deck drawRandomCard];
			if (card) {
				card_cnt++;
			}
		} while (card != nil);
		assert(card_cnt == 52 && "something is wrong with card count");
	}
	return 0;
}
