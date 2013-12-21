//
//  TouchHS.h
//  Blocks
//
//  Created by Schell on 12/16/13.
//  Copyright (c) 2013 Zyghost. All rights reserved.
//

#ifndef Blocks_TouchHS_h
#define Blocks_TouchHS_h

typedef struct {
    int phase;
    int tapCount;
    double timestamp;
    float locX;
    float locY;
} IOSTouch;

#endif
