//
//  main.m
//  Animal ABCs
//
//  Created by Sara Hender on 9/28/14.
//  Copyright (c) 2014 Sara Hender. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Utils.h"

/*
NSMutableArray *arrayNames;
NSMutableArray *arrayLetters;
NSMutableArray *arrayLetter;
NSMutableArray *arrayImages;
NSMutableArray *arrayCredits;
NSMutableArray *arrayAudio;
NSMutableArray *arrayColors;
NSMutableArray *audioPlayers;*/
Utils *_utils;

int main(int argc, char * argv[]) {
    _utils = [[Utils alloc] init];    
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
