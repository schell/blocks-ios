//
//  TouchHS.h
//  Blocks
//
//  Created by Schell on 12/16/13.
//  Copyright (c) 2013 Zyghost. All rights reserved.
//

#ifndef Blocks_TouchHS_h
#define Blocks_TouchHS_h

#include <CoreGraphics/CoreGraphics.h>

typedef struct {
    double timestamp;
    int phase;
    int tapCount;
    CGPoint loc;
    CGPoint prevLoc;
} iostouch;

#endif
