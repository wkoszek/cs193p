//
//  DropitBehavior.h
//  Dropit
//
//  Created by Wojciech Koszek (home) on 12/27/15.
//  Copyright © 2015 Wojciech Koszek (home). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropitBehavior : UIDynamicBehavior

- (void)addItem:(id<UIDynamicItem>)item;
- (void)removeItem:(id<UIDynamicItem>)item;

@end
