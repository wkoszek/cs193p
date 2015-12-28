//
//  BezierPathView.m
//  Dropit
//
//  Created by Wojciech Koszek (home) on 12/28/15.
//  Copyright © 2015 Wojciech Koszek (home). All rights reserved.
//

#import "BezierPathView.h"

@implementation BezierPathView


- (void)setPath:(UIBezierPath *)path
{
    _path = path;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [self.path stroke];
}

@end
