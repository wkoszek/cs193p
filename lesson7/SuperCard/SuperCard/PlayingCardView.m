//
//  PlayingCardView.m
//  SuperCard
//
//  Created by Wojciech Koszek (home) on 12/26/15.
//  Copyright © 2015 Wojciech Koszek (home). All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView

#pragma mark - Public API

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

#pragma mark - Drawing

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:12];

    [roundedRect addClip];

    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);

    [[UIColor blackColor] setStroke];
    [roundedRect stroke];

    [self drawCorners];
}

- (NSString *) rankAsString
{
	return @[@"?", @"A", @"2",
		@"3", @"4", @"5",
		@"6", @"7", @"8",
		@"9", @"10", @"J",
             @"Q", @"K" ][self.rank];
}

- (void) drawCorners
{
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];

    paragraphStyle.alignment = NSTextAlignmentCenter;
    UIFont *cornerFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    cornerFont = [cornerFont fontWithSize:cornerFont.pointSize * 5];

    NSAttributedString *cornerText = [[NSAttributedString alloc]
        initWithString:[NSString stringWithFormat:@"%@\n%@", [self rankAsString], self.suit]
            attributes:@{NSFontAttributeName: cornerFont, NSParagraphStyleAttributeName: paragraphStyle}];

    CGRect textBounds;
    textBounds.origin = CGPointMake(10, 10);
    textBounds.size = [cornerText size];
    [cornerText drawInRect:textBounds];

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(context, M_PI);
    [cornerText drawInRect:textBounds];
}

#pragma mark - Initialization
- (void) setup {
    self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
}

- (void) awakeFromNib {
    NSLog(@"awakeFromNib");
    [self setup];
}

@end
