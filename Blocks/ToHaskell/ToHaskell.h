//
//  UITouch+ToHaskell.h
//  Blocks
//
//  Created by Schell on 1/3/14.
//  Copyright (c) 2014 Zyghost. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchHS.h"

hpoint CGPointToHPoint(CGPoint);

@interface UITouch (ToHaskell)

- (htouch)toHTouchInView:(UIView*)view;

@end
