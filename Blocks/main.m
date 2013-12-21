//
//  main.m
//  Blocks
//
//  Created by Schell on 12/15/13.
//  Copyright (c) 2013 Zyghost. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

void (*setupGLHS)(void);
void (*inputHS)(int,int,double,double);
void (*updateGLHS)(double);
void (*tearDownGLHS)(void);

int c_main(void (*_setupGLHS)(void),
           void (*_inputHS)(int,int,double,double),
           void (*_updateGLHS)(double),
           void (*_tearDownGLHS)(void)) {
    int argc = 1;
    char* argv[2];
    argv[0] = "dummy";
    argv[1] = NULL;
    setupGLHS = _setupGLHS;
    inputHS = _inputHS;
    updateGLHS = _updateGLHS;
    tearDownGLHS = _tearDownGLHS;
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
