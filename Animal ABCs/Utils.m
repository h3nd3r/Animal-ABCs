//
//  Utils.m
//  Animal ABCs
//
//  Created by Sara Hender on 18/05/2016.
//
//
#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Utils.h"

@implementation Utils : NSObject
/*
NSMutableArray *arrayNames;
NSMutableArray *arrayLetters;
NSMutableArray *arrayLetter;
NSMutableArray *arrayImages;
NSMutableArray *arrayCredits;
NSMutableArray *arrayAudio;
NSMutableArray *arrayColors;
NSMutableArray *audioPlayers;
*/
- init {

    _arrayAudio = [[NSMutableArray alloc] init];

    [_arrayAudio addObject: @"%@/Aa.m4a"];
    [_arrayAudio addObject: @"%@/Bb.m4a"];
    [_arrayAudio addObject: @"%@/Cc.m4a"];
    [_arrayAudio addObject: @"%@/Dd.m4a"];
    [_arrayAudio addObject: @"%@/Ee.m4a"];
    [_arrayAudio addObject: @"%@/Ff.m4a"];
    [_arrayAudio addObject: @"%@/Gg.m4a"];
    [_arrayAudio addObject: @"%@/Hh.m4a"];
    [_arrayAudio addObject: @"%@/Ii.m4a"];
    [_arrayAudio addObject: @"%@/Jj.m4a"];
    [_arrayAudio addObject: @"%@/Kk.m4a"];
    [_arrayAudio addObject: @"%@/Ll.m4a"];
    [_arrayAudio addObject: @"%@/Mm.m4a"];
    [_arrayAudio addObject: @"%@/Nn.m4a"];
    [_arrayAudio addObject: @"%@/Oo.m4a"];
    [_arrayAudio addObject: @"%@/Pp.m4a"];
    [_arrayAudio addObject: @"%@/Qq.m4a"];
    [_arrayAudio addObject: @"%@/Rr.m4a"];
    [_arrayAudio addObject: @"%@/Ss.m4a"];
    [_arrayAudio addObject: @"%@/Tt.m4a"];
    [_arrayAudio addObject: @"%@/Uu.m4a"];
    [_arrayAudio addObject: @"%@/Vv.m4a"];
    [_arrayAudio addObject: @"%@/Ww.m4a"];
    [_arrayAudio addObject: @"%@/Xx.m4a"];
    [_arrayAudio addObject: @"%@/Yy.m4a"];
    [_arrayAudio addObject: @"%@/Zz.m4a"];
    [_arrayAudio addObject: @""];
    
    _arrayNames = [[NSMutableArray alloc] init];
    [_arrayNames addObject: @"alligator"];
    [_arrayNames addObject: @"bear"];
    [_arrayNames addObject: @"cat"];
    [_arrayNames addObject: @"dog"];
    [_arrayNames addObject: @"elephant"];
    [_arrayNames addObject: @"flamingo"];
    [_arrayNames addObject: @"giraffe"];
    [_arrayNames addObject: @"horse"];
    [_arrayNames addObject: @"iguana"];
    [_arrayNames addObject: @"jaguar"];
    [_arrayNames addObject: @"kangaroo"];
    [_arrayNames addObject: @"llama"];
    [_arrayNames addObject: @"monkey"];
    [_arrayNames addObject: @"numbat"];
    [_arrayNames addObject: @"owl"];
    [_arrayNames addObject: @"pig"];
    [_arrayNames addObject: @"quail"];
    [_arrayNames addObject: @"rabbit"];
    [_arrayNames addObject: @"snake"];
    [_arrayNames addObject: @"tiger"];
    [_arrayNames addObject: @"urial"];
    [_arrayNames addObject: @"vulture"];
    [_arrayNames addObject: @"walrus"];
    [_arrayNames addObject: @"xenops"];
    [_arrayNames addObject: @"yak"];
    [_arrayNames addObject: @"zebra"];
    [_arrayNames addObject: @""];
    
    _arrayLetters = [[NSMutableArray alloc] init];
    [_arrayLetters addObject: @"Aa"];
    [_arrayLetters addObject: @"Bb"];
    [_arrayLetters addObject: @"Cc"];
    [_arrayLetters addObject: @"Dd"];
    [_arrayLetters addObject: @"Ee"];
    [_arrayLetters addObject: @"Ff"];
    [_arrayLetters addObject: @"Gg"];
    [_arrayLetters addObject: @"Hh"];
    [_arrayLetters addObject: @"Ii"];
    [_arrayLetters addObject: @"Jj"];
    [_arrayLetters addObject: @"Kk"];
    [_arrayLetters addObject: @"Ll"];
    [_arrayLetters addObject: @"Mm"];
    [_arrayLetters addObject: @"Nn"];
    [_arrayLetters addObject: @"Oo"];
    [_arrayLetters addObject: @"Pp"];
    [_arrayLetters addObject: @"Qq"];
    [_arrayLetters addObject: @"Rr"];
    [_arrayLetters addObject: @"Ss"];
    [_arrayLetters addObject: @"Tt"];
    [_arrayLetters addObject: @"Uu"];
    [_arrayLetters addObject: @"Vv"];
    [_arrayLetters addObject: @"Ww"];
    [_arrayLetters addObject: @"Xx"];
    [_arrayLetters addObject: @"Yy"];
    [_arrayLetters addObject: @"Zz"];
    [_arrayLetters addObject: @"Photo Credits"];
    
    _arrayLetter = [[NSMutableArray alloc] init];
    [_arrayLetter addObject: @"A"];
    [_arrayLetter addObject: @"B"];
    [_arrayLetter addObject: @"C"];
    [_arrayLetter addObject: @"D"];
    [_arrayLetter addObject: @"E"];
    [_arrayLetter addObject: @"F"];
    [_arrayLetter addObject: @"G"];
    [_arrayLetter addObject: @"H"];
    [_arrayLetter addObject: @"I"];
    [_arrayLetter addObject: @"J"];
    [_arrayLetter addObject: @"K"];
    [_arrayLetter addObject: @"L"];
    [_arrayLetter addObject: @"M"];
    [_arrayLetter addObject: @"N"];
    [_arrayLetter addObject: @"O"];
    [_arrayLetter addObject: @"P"];
    [_arrayLetter addObject: @"Q"];
    [_arrayLetter addObject: @"R"];
    [_arrayLetter addObject: @"S"];
    [_arrayLetter addObject: @"T"];
    [_arrayLetter addObject: @"U"];
    [_arrayLetter addObject: @"V"];
    [_arrayLetter addObject: @"W"];
    [_arrayLetter addObject: @"X"];
    [_arrayLetter addObject: @"Y"];
    [_arrayLetter addObject: @"Z"];
    [_arrayLetter addObject: @"Photo Credits"];
    
    _arrayImages = [[NSMutableArray alloc] init];
    [_arrayImages addObject: @"alligator.jpg"];
    [_arrayImages addObject: @"bear.jpg"];
    [_arrayImages addObject: @"cat.jpg"];
    [_arrayImages addObject: @"dog.jpg"];
    [_arrayImages addObject: @"elephant.jpg"];
    [_arrayImages addObject: @"flamingo.jpg"];
    [_arrayImages addObject: @"giraffe.jpg"];
    [_arrayImages addObject: @"horse.jpg"];
    [_arrayImages addObject: @"iguana.jpg"];
    [_arrayImages addObject: @"jaguar.jpg"];
    [_arrayImages addObject: @"kangaroo.jpg"];
    [_arrayImages addObject: @"llama.jpg"];
    [_arrayImages addObject: @"monkey.jpg"];
    [_arrayImages addObject: @"numbat.jpg"];
    [_arrayImages addObject: @"owl.jpg"];
    [_arrayImages addObject: @"pig.jpg"];
    [_arrayImages addObject: @"quail.jpg"];
    [_arrayImages addObject: @"rabbit.jpg"];
    [_arrayImages addObject: @"snake.jpg"];
    [_arrayImages addObject: @"tiger.jpg"];
    [_arrayImages addObject: @"urial.jpg"];
    [_arrayImages addObject: @"vulture.jpg"];
    [_arrayImages addObject: @"walrus.jpg"];
    [_arrayImages addObject: @"xenops.jpg"];
    [_arrayImages addObject: @"yak.jpg"];
    [_arrayImages addObject: @"zebra.jpg"];
    [_arrayImages addObject: @""];
    
    _arrayCredits = [[NSMutableArray alloc] init];
    [_arrayCredits addObject: @""];
    [_arrayCredits addObject: @"alligator - jc.winkler/Flickr"];
    [_arrayCredits addObject: @"bear - NPS/K. Jalone./Flickr"];
    [_arrayCredits addObject: @"cat - jacinta lluch valero/Flickr"];
    [_arrayCredits addObject: @"dog - Aleksey Gnilenkov/Flickr"];
    [_arrayCredits addObject: @"elephant - Matt Biddulph/Flickr"];
    [_arrayCredits addObject: @"flamingo - William Warby/Flickr"];
    [_arrayCredits addObject: @"giraffe - Daniel Ramirez/Flickr"];
    [_arrayCredits addObject: @"horse - Peter aka anemoneprojectors/Flickr"];
    [_arrayCredits addObject: @"iguana - O Palsson/Flickr"];
    [_arrayCredits addObject: @"jaguar - Eric Kilby/Flickr"];
    [_arrayCredits addObject: @"kangaroo - Tambako The Jaguar/Flickr"];
    [_arrayCredits addObject: @"llama - Jonathan Sewell/Flickr"];
    [_arrayCredits addObject: @"monkey - Robyn Jay/Flickr"];
    [_arrayCredits addObject: @"numbat - S J Bennett/Flickr"];
    [_arrayCredits addObject: @"owl - Tambako The Jaguar/Flickr"];
    [_arrayCredits addObject: @"pig - Pete Birkinshaw/Flickr"];
    [_arrayCredits addObject: @"quail - Sid Mosdell/Flickr"];
    [_arrayCredits addObject: @"rabbit - Mark Kent/Flickr"];
    [_arrayCredits addObject: @"snake - Geoff Gallice/Flickr"];
    [_arrayCredits addObject: @"tiger - Moni Sertel/Flickr"];
    [_arrayCredits addObject: @"urial - Jörg Hempel/Flickr"];
    [_arrayCredits addObject: @"vulture - Daniel Daley/Flickr"];
    [_arrayCredits addObject: @"walrus - Smudge 9000/Flickr"];
    [_arrayCredits addObject: @"xenops - Dario Sanches/Flickr"];
    [_arrayCredits addObject: @"yak - Ludovic Hirlimann/Flickr"];
    [_arrayCredits addObject: @"zebra - Tambako The Jaguar/Flickr"];

    _arrayCreditsLandscape = [[NSMutableArray alloc] init];
    [_arrayCreditsLandscape addObject: @""];
    [_arrayCreditsLandscape addObject: @"alligator - jc.winkler/Flickr"];
    [_arrayCreditsLandscape addObject: @"bear - NPS/K. Jalone./Flickr"];
    [_arrayCreditsLandscape addObject: @"cat - jacinta lluch valero/Flickr"];
    [_arrayCreditsLandscape addObject: @"Are you coming? - timku/Flickr"];
    [_arrayCreditsLandscape addObject: @"Elephants - John Schinker/Flickr"];
    [_arrayCreditsLandscape addObject: @"flamingo - William Warby/Flickr"];
    [_arrayCreditsLandscape addObject: @"giraffe - Daniel Ramirez/Flickr"];
    [_arrayCreditsLandscape addObject: @"horse - Peter aka anemoneprojectors/Flickr"];
    [_arrayCreditsLandscape addObject: @"St Thomas - Kevin Falcone/Flickr"];
    [_arrayCreditsLandscape addObject: @"jaguar - Eric Kilby/Flickr"];
    [_arrayCreditsLandscape addObject: @"'Yanchep Kangaroos' - Mark, Vicki, Ellaura and Mason/Flickr"];
    [_arrayCreditsLandscape addObject: @"llama - Val D'Aquila/Flickr"];
    [_arrayCreditsLandscape addObject: @"monkey - Robyn Jay/Flickr"];
    [_arrayCreditsLandscape addObject: @"Numbat - Charles Kottler/Flickr"];
    [_arrayCreditsLandscape addObject: @"Who you looking at? - Lyndie/Flickr"];
    [_arrayCreditsLandscape addObject: @"pig - Pete Birkinshaw/Flickr"];
    [_arrayCreditsLandscape addObject: @"California Quail - Lee Jaffe/Flickr"];
    [_arrayCreditsLandscape addObject: @"rabbit - Mark Kent/Flickr"];
    [_arrayCreditsLandscape addObject: @"Snake - Hans Watson/Flickr"];
    [_arrayCreditsLandscape addObject: @"tiger - Moni Sertel/Flickr"];
    [_arrayCreditsLandscape addObject: @"Ovis vignei - abejorro34/Flickr"];
    [_arrayCreditsLandscape addObject: @"vulture - Daniel Daley/Flickr"];
    [_arrayCreditsLandscape addObject: @"anim0054 - NOAA Photo Library/Flickr"];
    [_arrayCreditsLandscape addObject: @"Streaked Xenops - Carlos Henrique/Flickr"];
    [_arrayCreditsLandscape addObject: @"yak - Ludovic Hirlimann/Flickr"];
    [_arrayCreditsLandscape addObject: @"zebra - Tambako The Jaguar/Flickr"];
    
    _arrayCreditsPortrait = [[NSMutableArray alloc] init];
    [_arrayCreditsPortrait addObject: @""];
    [_arrayCreditsPortrait addObject: @"alligator - jc.winkler/Flickr"];
    [_arrayCreditsPortrait addObject: @"bear - NPS/K. Jalone./Flickr"];
    [_arrayCreditsPortrait addObject: @"cat - jacinta lluch valero/Flickr"];
    [_arrayCreditsPortrait addObject: @"dog - Aleksey Gnilenkov/Flickr"];
    [_arrayCreditsPortrait addObject: @"elephant - Matt Biddulph/Flickr"];
    [_arrayCreditsPortrait addObject: @"flamingo - William Warby/Flickr"];
    [_arrayCreditsPortrait addObject: @"giraffe - Daniel Ramirez/Flickr"];
    [_arrayCreditsPortrait addObject: @"horse - Peter aka anemoneprojectors/Flickr"];
    [_arrayCreditsPortrait addObject: @"iguana - O Palsson/Flickr"];
    [_arrayCreditsPortrait addObject: @"jaguar - Eric Kilby/Flickr"];
    [_arrayCreditsPortrait addObject: @"kangaroo - Tambako The Jaguar/Flickr"];
    [_arrayCreditsPortrait addObject: @"llama - Jonathan Sewell/Flickr"];
    [_arrayCreditsPortrait addObject: @"monkey - Robyn Jay/Flickr"];
    [_arrayCreditsPortrait addObject: @"numbat - S J Bennett/Flickr"];
    [_arrayCreditsPortrait addObject: @"owl - Tambako The Jaguar/Flickr"];
    [_arrayCreditsPortrait addObject: @"pig - Pete Birkinshaw/Flickr"];
    [_arrayCreditsPortrait addObject: @"quail - Sid Mosdell/Flickr"];
    [_arrayCreditsPortrait addObject: @"rabbit - Mark Kent/Flickr"];
    [_arrayCreditsPortrait addObject: @"snake - Geoff Gallice/Flickr"];
    [_arrayCreditsPortrait addObject: @"tiger - Moni Sertel/Flickr"];
    [_arrayCreditsPortrait addObject: @"urial - Jörg Hempel/Flickr"];
    [_arrayCreditsPortrait addObject: @"vulture - Daniel Daley/Flickr"];
    [_arrayCreditsPortrait addObject: @"walrus - Smudge 9000/Flickr"];
    [_arrayCreditsPortrait addObject: @"xenops - Dario Sanches/Flickr"];
    [_arrayCreditsPortrait addObject: @"yak - Ludovic Hirlimann/Flickr"];
    [_arrayCreditsPortrait addObject: @"zebra - Tambako The Jaguar/Flickr"];
    
    _arrayAudio = [[NSMutableArray alloc] init];
    [_arrayAudio addObject: @"%@/Aa.m4a"];
    [_arrayAudio addObject: @"%@/Bb.m4a"];
    [_arrayAudio addObject: @"%@/Cc.m4a"];
    [_arrayAudio addObject: @"%@/Dd.m4a"];
    [_arrayAudio addObject: @"%@/Ee.m4a"];
    [_arrayAudio addObject: @"%@/Ff.m4a"];
    [_arrayAudio addObject: @"%@/Gg.m4a"];
    [_arrayAudio addObject: @"%@/Hh.m4a"];
    [_arrayAudio addObject: @"%@/Ii.m4a"];
    [_arrayAudio addObject: @"%@/Jj.m4a"];
    [_arrayAudio addObject: @"%@/Kk.m4a"];
    [_arrayAudio addObject: @"%@/Ll.m4a"];
    [_arrayAudio addObject: @"%@/Mm.m4a"];
    [_arrayAudio addObject: @"%@/Nn.m4a"];
    [_arrayAudio addObject: @"%@/Oo.m4a"];
    [_arrayAudio addObject: @"%@/Pp.m4a"];
    [_arrayAudio addObject: @"%@/Qq.m4a"];
    [_arrayAudio addObject: @"%@/Rr.m4a"];
    [_arrayAudio addObject: @"%@/Ss.m4a"];
    [_arrayAudio addObject: @"%@/Tt.m4a"];
    [_arrayAudio addObject: @"%@/Uu.m4a"];
    [_arrayAudio addObject: @"%@/Vv.m4a"];
    [_arrayAudio addObject: @"%@/Ww.m4a"];
    [_arrayAudio addObject: @"%@/Xx.m4a"];
    [_arrayAudio addObject: @"%@/Yy.m4a"];
    [_arrayAudio addObject: @"%@/Zz.m4a"];
    [_arrayAudio addObject: @""];
    
    _arrayColors = [[NSMutableArray alloc] init];
    [_arrayColors addObject: @"006633"];
    [_arrayColors addObject: @"FF0000"];
    [_arrayColors addObject: @"FF9900"];
    [_arrayColors addObject: @"FF33FF"];
    [_arrayColors addObject: @"669900"];
    [_arrayColors addObject: @"3333CC"];
    [_arrayColors addObject: @"FFFF33"];
    [_arrayColors addObject: @"9933FF"];
    [_arrayColors addObject: @"FF3300"];
    [_arrayColors addObject: @"33FFCC"];
    [_arrayColors addObject: @"33CC00"];
    [_arrayColors addObject: @"FFCC00"];
    [_arrayColors addObject: @"FF3399"];
    [_arrayColors addObject: @"33CCFF"];
    [_arrayColors addObject: @"FFFF00"];
    [_arrayColors addObject: @"FFCCFF"];
    [_arrayColors addObject: @"33FF00"];
    [_arrayColors addObject: @"6633FF"];
    [_arrayColors addObject: @"FF99CC"];
    [_arrayColors addObject: @"CCFF99"];
    [_arrayColors addObject: @"FF9900"];
    [_arrayColors addObject: @"6699FF"];
    [_arrayColors addObject: @"FF0000"];
    [_arrayColors addObject: @"FFFF99"];
    [_arrayColors addObject: @"CC33FF"];
    [_arrayColors addObject: @"FFFF00"];
    [_arrayColors addObject: @"FF3300"];
    
    _audioPlayers = [[NSMutableArray alloc] init];
    
    for(int i=0; i<26; i++)
    {
        // Construct URL to sound file
        NSString *path = [NSString stringWithFormat:_arrayAudio[i], [[NSBundle mainBundle] resourcePath]];
        NSURL *soundUrl = [NSURL fileURLWithPath:path];
        
        // Create audio player object and initialize with URL to sound
        AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
        
        [_audioPlayers addObject: audioPlayer];
    }
    return self;
}
/*
- (NSMutableArray *)audioPlayers {
    if (!audioPlayers) {
        audioPlayers = [[NSMutableArray alloc] init];
        
        for(int i=0; i<26; i++)
        {
            // Construct URL to sound file
            NSString *path = [NSString stringWithFormat:arrayAudio[i], [[NSBundle mainBundle] resourcePath]];
            NSURL *soundUrl = [NSURL fileURLWithPath:path];
            
            // Create audio player object and initialize with URL to sound
            AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
            
            [audioPlayers addObject: audioPlayer];
        }
    }
    
    return audioPlayers;
}
*/
+ (UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
        
        if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range = NSMakeRange(0, [cString length]);
    
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

@end