//
//  CardMatchingGame.m
//  cs193p
//
//  Created by Wojciech Koszek (home) on 7/18/15.
//  Copyright (c) 2015 Wojciech Koszek (home). All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSUInteger score;
@property (nonatomic, strong) NSMutableArray *cards;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray init] alloc];
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

- (void) chooseCardAtIndex:(NSUInteger)index
{
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    if (index > [self.cards count]) {
        return nil;
    } else {
        return [self.cards objectAtIndex:index];
    }
}

@end
