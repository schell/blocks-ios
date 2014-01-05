//
//  UITouch+ToHaskell.m
//  Blocks
//
//  Created by Schell on 1/3/14.
//  Copyright (c) 2014 Zyghost. All rights reserved.
//

#import "ToHaskell.h"

hpoint CGPointToHPoint(CGPoint c) {
    hpoint p = {c.x, c.y};
    return p;
}

@implementation UITouch (ToHaskell)

- (htouch)toHTouchInView:(UIView*)view {
    htouch t;
    hpoint loc = CGPointToHPoint([self locationInView:view]);
    hpoint ploc = CGPointToHPoint([self previousLocationInView:view]);
    t.loc = loc;
    t.prevLoc = ploc;
    t.phase = self.phase;
    t.tapCount = self.tapCount;
    t.timestamp = self.timestamp;
    return t;
}

@end
