//
//  CardMatchingGame.h
//  cs193p
//
//  Created by Wojciech Koszek (home) on 7/18/15.
//  Copyright (c) 2015 Wojciech Koszek (home). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;


@end
