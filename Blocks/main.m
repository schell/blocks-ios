//
//  main.m
//  Blocks
//
//  Created by Schell on 12/15/13.
//  Copyright (c) 2013 Zyghost. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "TouchHS.h"

void (*setupGLHS)(void);
void (*tapped)(htouch*);
void (*tbegan)(int, htouch*);
void (*tmoved)(int, htouch*);
void (*tended)(int, htouch*);
void (*updateGLHS)(double);
void (*tearDownGLHS)(void);

int c_main(void (*_setupGLHS)(void),
           void (*_tapped)(htouch*),
           void (*_tbegan)(int, htouch*),
           void (*_tmoved)(int, htouch*),
           void (*_tended)(int, htouch*),
           void (*_updateGLHS)(double),
           void (*_tearDownGLHS)(void)) {
    int argc = 1;
    char* argv[2];
    argv[0] = "dummy";
    argv[1] = NULL;
    setupGLHS = _setupGLHS;
    tapped = _tapped;
    tbegan = _tbegan;
    tmoved = _tmoved;
    tended = _tended;
    updateGLHS = _updateGLHS;
    tearDownGLHS = _tearDownGLHS;
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
