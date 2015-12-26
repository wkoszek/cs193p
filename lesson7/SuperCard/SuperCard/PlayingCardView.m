//
//  PlayingCardView.m
//  SuperCard
//
//  Created by Wojciech Koszek (home) on 12/26/15.
//  Copyright © 2015 Wojciech Koszek (home). All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView

- (void) setSuit:(NSString *)suit
{
    _suit = suit;
    [self setNeedsDisplay];
}

- (void) setRank:(NSUInteger)rank
{
    _rank = rank;
    [self setNeedsDisplay];
}

- (void) setFaceUp:(BOOL)faceUp
{

    _faceUp = faceUp;
    [self setNeedsDisplay];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
