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

NSMutableArray *arrayNames;
NSMutableArray *arrayLetters;
NSMutableArray *arrayLetter;
NSMutableArray *arrayImages;
NSMutableArray *arrayCredits;
NSMutableArray *arrayAudio;
NSMutableArray *arrayColors;

NSMutableArray *_audioPlayers;


int main(int argc, char * argv[]) {
    
    arrayNames = [[NSMutableArray alloc] init];
    
    [arrayNames addObject: @"alligator"];
    [arrayNames addObject: @"bear"];
    [arrayNames addObject: @"cat"];
    [arrayNames addObject: @"dog"];
    [arrayNames addObject: @"elephant"];
    [arrayNames addObject: @"flamingo"];
    [arrayNames addObject: @"giraffe"];
    [arrayNames addObject: @"horse"];
    [arrayNames addObject: @"iguana"];
    [arrayNames addObject: @"jaguar"];
    [arrayNames addObject: @"kangaroo"];
    [arrayNames addObject: @"llama"];
    [arrayNames addObject: @"monkey"];
    [arrayNames addObject: @"numbat"];
    [arrayNames addObject: @"owl"];
    [arrayNames addObject: @"pig"];
    [arrayNames addObject: @"quail"];
    [arrayNames addObject: @"rabbit"];
    [arrayNames addObject: @"snake"];
    [arrayNames addObject: @"tiger"];
    [arrayNames addObject: @"urial"];
    [arrayNames addObject: @"vulture"];
    [arrayNames addObject: @"walrus"];
    [arrayNames addObject: @"xenops"];
    [arrayNames addObject: @"yak"];
    [arrayNames addObject: @"zebra"];
    [arrayNames addObject: @""];
    
    arrayLetters = [[NSMutableArray alloc] init];
    
    [arrayLetters addObject: @"Aa"];
    [arrayLetters addObject: @"Bb"];
    [arrayLetters addObject: @"Cc"];
    [arrayLetters addObject: @"Dd"];
    [arrayLetters addObject: @"Ee"];
    [arrayLetters addObject: @"Ff"];
    [arrayLetters addObject: @"Gg"];
    [arrayLetters addObject: @"Hh"];
    [arrayLetters addObject: @"Ii"];
    [arrayLetters addObject: @"Jj"];
    [arrayLetters addObject: @"Kk"];
    [arrayLetters addObject: @"Ll"];
    [arrayLetters addObject: @"Mm"];
    [arrayLetters addObject: @"Nn"];
    [arrayLetters addObject: @"Oo"];
    [arrayLetters addObject: @"Pp"];
    [arrayLetters addObject: @"Qq"];
    [arrayLetters addObject: @"Rr"];
    [arrayLetters addObject: @"Ss"];
    [arrayLetters addObject: @"Tt"];
    [arrayLetters addObject: @"Uu"];
    [arrayLetters addObject: @"Vv"];
    [arrayLetters addObject: @"Ww"];
    [arrayLetters addObject: @"Xx"];
    [arrayLetters addObject: @"Yy"];
    [arrayLetters addObject: @"Zz"];
    [arrayLetters addObject: @"Photo Credits"];

    arrayLetter = [[NSMutableArray alloc] init];
    
    [arrayLetter addObject: @"A"];
    [arrayLetter addObject: @"B"];
    [arrayLetter addObject: @"C"];
    [arrayLetter addObject: @"D"];
    [arrayLetter addObject: @"E"];
    [arrayLetter addObject: @"F"];
    [arrayLetter addObject: @"G"];
    [arrayLetter addObject: @"H"];
    [arrayLetter addObject: @"I"];
    [arrayLetter addObject: @"J"];
    [arrayLetter addObject: @"K"];
    [arrayLetter addObject: @"L"];
    [arrayLetter addObject: @"M"];
    [arrayLetter addObject: @"N"];
    [arrayLetter addObject: @"O"];
    [arrayLetter addObject: @"P"];
    [arrayLetter addObject: @"Q"];
    [arrayLetter addObject: @"R"];
    [arrayLetter addObject: @"S"];
    [arrayLetter addObject: @"T"];
    [arrayLetter addObject: @"U"];
    [arrayLetter addObject: @"V"];
    [arrayLetter addObject: @"W"];
    [arrayLetter addObject: @"X"];
    [arrayLetter addObject: @"Y"];
    [arrayLetter addObject: @"Z"];
    [arrayLetter addObject: @"Photo Credits"];
    
    arrayImages = [[NSMutableArray alloc] init];
    
    [arrayImages addObject: @"alligator.jpg"];
    [arrayImages addObject: @"bear.jpg"];
    [arrayImages addObject: @"cat.jpg"];
    [arrayImages addObject: @"dog3.jpg"];
    [arrayImages addObject: @"elephant2.jpg"];
    [arrayImages addObject: @"flamingo.jpg"];
    [arrayImages addObject: @"giraffe.jpg"];
    [arrayImages addObject: @"horse.jpg"];
    [arrayImages addObject: @"iguana.jpg"];
    [arrayImages addObject: @"jaguar3.jpg"];
    [arrayImages addObject: @"kangaroo.jpg"];
    [arrayImages addObject: @"llama.jpg"];
    [arrayImages addObject: @"monkey.jpg"];
    [arrayImages addObject: @"numbat.png"];
    [arrayImages addObject: @"owl.jpg"];
    [arrayImages addObject: @"pig.jpg"];
    [arrayImages addObject: @"quail.jpg"];
    [arrayImages addObject: @"rabbit.jpg"];
    [arrayImages addObject: @"snake.jpg"];
    [arrayImages addObject: @"tiger.jpg"];
    [arrayImages addObject: @"urial2.jpg"];
    [arrayImages addObject: @"vulture.jpg"];
    [arrayImages addObject: @"walrus2.jpg"];
    [arrayImages addObject: @"xenops.jpg"];
    [arrayImages addObject: @"yak.jpg"];
    [arrayImages addObject: @"zebra.jpg"];
    [arrayImages addObject: @""];
    
    arrayCredits = [[NSMutableArray alloc] init];

    [arrayCredits addObject: @""];
    [arrayCredits addObject: @"alligator - jc.winkler/Flickr"];
    [arrayCredits addObject: @"bear - NPS/K. Jalone./Flickr"];
    [arrayCredits addObject: @"cat - jacinta lluch valero/Flickr"];
    [arrayCredits addObject: @"dog - Aleksey Gnilenkov/Flickr"];
    [arrayCredits addObject: @"elephant - Matt Biddulph/Flickr"];
    [arrayCredits addObject: @"flamingo - William Warby/Flickr"];
    [arrayCredits addObject: @"giraffe - Daniel Ramirez/Flickr"];
    [arrayCredits addObject: @"horse - Peter aka anemoneprojectors/Flickr"];
    [arrayCredits addObject: @"iguana - O Palsson/Flickr"];
    [arrayCredits addObject: @"jaguar - Eric Kilby/Flickr"];
    [arrayCredits addObject: @"kangaroo - Tambako The Jaguar/Flickr"];
    [arrayCredits addObject: @"llama - Jonathan Sewell/Flickr"];
    [arrayCredits addObject: @"monkey - Robyn Jay/Flickr"];
    [arrayCredits addObject: @"numbat - S J Bennett/Flickr"];
    [arrayCredits addObject: @"owl - Tambako The Jaguar/Flickr"];
    [arrayCredits addObject: @"pig - Pete Birkinshaw/Flickr"];
    [arrayCredits addObject: @"quail - Sid Mosdell/Flickr"];
    [arrayCredits addObject: @"rabbit - Mark Kent/Flickr"];
    [arrayCredits addObject: @"snake - Geoff Gallice/Flickr"];
    [arrayCredits addObject: @"tiger - Moni Sertel/Flickr"];
    [arrayCredits addObject: @"urial - Jörg Hempel/Flickr"];
    [arrayCredits addObject: @"vulture - Daniel Daley/Flickr"];
    [arrayCredits addObject: @"walrus - Smudge 9000/Flickr"];
    [arrayCredits addObject: @"xenops - Dario Sanches/Flickr"];
    [arrayCredits addObject: @"yak - Ludovic Hirlimann/Flickr"];
    [arrayCredits addObject: @"zebra - Tambako The Jaguar/Flickr"];


    arrayAudio = [[NSMutableArray alloc] init];
    
    [arrayAudio addObject: @"%@/Aa.m4a"];
    [arrayAudio addObject: @"%@/Bb.m4a"];
    [arrayAudio addObject: @"%@/Cc.m4a"];
    [arrayAudio addObject: @"%@/Dd.m4a"];
    [arrayAudio addObject: @"%@/Ee.m4a"];
    [arrayAudio addObject: @"%@/Ff.m4a"];
    [arrayAudio addObject: @"%@/Gg.m4a"];
    [arrayAudio addObject: @"%@/Hh.m4a"];
    [arrayAudio addObject: @"%@/Ii.m4a"];
    [arrayAudio addObject: @"%@/Jj.m4a"];
    [arrayAudio addObject: @"%@/Kk.m4a"];
    [arrayAudio addObject: @"%@/Ll.m4a"];
    [arrayAudio addObject: @"%@/Mm.m4a"];
    [arrayAudio addObject: @"%@/Nn.m4a"];
    [arrayAudio addObject: @"%@/Oo.m4a"];
    [arrayAudio addObject: @"%@/Pp.m4a"];
    [arrayAudio addObject: @"%@/Qq.m4a"];
    [arrayAudio addObject: @"%@/Rr.m4a"];
    [arrayAudio addObject: @"%@/Ss.m4a"];
    [arrayAudio addObject: @"%@/Tt.m4a"];
    [arrayAudio addObject: @"%@/Uu.m4a"];
    [arrayAudio addObject: @"%@/Vv.m4a"];
    [arrayAudio addObject: @"%@/Ww.m4a"];
    [arrayAudio addObject: @"%@/Xx.m4a"];
    [arrayAudio addObject: @"%@/Yy.m4a"];
    [arrayAudio addObject: @"%@/Zz.m4a"];
    [arrayAudio addObject: @""];
    
    arrayColors = [[NSMutableArray alloc] init];
    
    [arrayColors addObject: @"006633"];
    [arrayColors addObject: @"FF0000"];
    [arrayColors addObject: @"FF9900"];
    [arrayColors addObject: @"FF33FF"];
    [arrayColors addObject: @"669900"];
    [arrayColors addObject: @"3333CC"];
    [arrayColors addObject: @"FFFF33"];
    [arrayColors addObject: @"9933FF"];
    [arrayColors addObject: @"FF3300"];
    [arrayColors addObject: @"33FFCC"];
    [arrayColors addObject: @"33CC00"];
    [arrayColors addObject: @"FFCC00"];
    [arrayColors addObject: @"FF3399"];
    [arrayColors addObject: @"33CCFF"];
    [arrayColors addObject: @"FFFF00"];
    [arrayColors addObject: @"FFCCFF"];
    [arrayColors addObject: @"33FF00"];
    [arrayColors addObject: @"6633FF"];
    [arrayColors addObject: @"FF99CC"];
    [arrayColors addObject: @"CCFF99"];
    [arrayColors addObject: @"FF9900"];
    [arrayColors addObject: @"6699FF"];
    [arrayColors addObject: @"FF0000"];
    [arrayColors addObject: @"FFFF99"];
    [arrayColors addObject: @"CC33FF"];
    [arrayColors addObject: @"FFFF00"];
    [arrayColors addObject: @"FF3300"];
    
    _audioPlayers = [[NSMutableArray alloc] init];

    for(int i=0; i<26; i++)
    {
        // Construct URL to sound file
        NSString *path = [NSString stringWithFormat:arrayAudio[i], [[NSBundle mainBundle] resourcePath]];
        NSURL *soundUrl = [NSURL fileURLWithPath:path];
        
        // Create audio player object and initialize with URL to sound
        AVAudioPlayer *_audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
        
        [_audioPlayers addObject: _audioPlayer];
    }
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
