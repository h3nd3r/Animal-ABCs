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

//@synthesize arrayTest;

+ (Utils *)sharedInstance
{
    /*
    static Utils *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Utils alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
     */
    static Utils *sharedMyManager = nil;
    @synchronized(self) {
        if (sharedMyManager == nil)
            sharedMyManager = [[self alloc] init];
    }
    return sharedMyManager;
}


- init {
    
//    arrayTest = @[];
    
    _width = [UIScreen mainScreen].bounds.size.width;
    _height = [UIScreen mainScreen].bounds.size.height;
    
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

    _arraySmallImages = [[NSMutableArray alloc] init];
    [_arraySmallImages addObject: @"as.jpg"];
    [_arraySmallImages addObject: @"bs.jpg"];
    [_arraySmallImages addObject: @"cs.jpg"];
    [_arraySmallImages addObject: @"ds.jpg"];
    [_arraySmallImages addObject: @"es.jpg"];
    [_arraySmallImages addObject: @"fs.jpg"];
    [_arraySmallImages addObject: @"gs.jpg"];
    [_arraySmallImages addObject: @"hs.jpg"];
    [_arraySmallImages addObject: @"is.jpg"];
    [_arraySmallImages addObject: @"js.jpg"];
    [_arraySmallImages addObject: @"ks.jpg"];
    [_arraySmallImages addObject: @"ls.jpg"];
    [_arraySmallImages addObject: @"ms.jpg"];
    [_arraySmallImages addObject: @"ns.jpg"];
    [_arraySmallImages addObject: @"os.jpg"];
    [_arraySmallImages addObject: @"ps.jpg"];
    [_arraySmallImages addObject: @"qs.jpg"];
    [_arraySmallImages addObject: @"rs.jpg"];
    [_arraySmallImages addObject: @"ss.jpg"];
    [_arraySmallImages addObject: @"ts.jpg"];
    [_arraySmallImages addObject: @"us.jpg"];
    [_arraySmallImages addObject: @"vs.jpg"];
    [_arraySmallImages addObject: @"ws.jpg"];
    [_arraySmallImages addObject: @"xs.jpg"];
    [_arraySmallImages addObject: @"ys.jpg"];
    [_arraySmallImages addObject: @"zs.jpg"];
    [_arraySmallImages addObject: @""];
    
    _arrayImages = [[NSMutableArray alloc] init];
    [_arrayImages addObject: @"a.jpg"];
    [_arrayImages addObject: @"b.jpg"];
    [_arrayImages addObject: @"c.jpg"];
    [_arrayImages addObject: @"d.jpg"];
    [_arrayImages addObject: @"e.jpg"];
    [_arrayImages addObject: @"f.jpg"];
    [_arrayImages addObject: @"g.jpg"];
    [_arrayImages addObject: @"h.jpg"];
    [_arrayImages addObject: @"i.jpg"];
    [_arrayImages addObject: @"j.jpg"];
    [_arrayImages addObject: @"k.jpg"];
    [_arrayImages addObject: @"l.jpg"];
    [_arrayImages addObject: @"m.jpg"];
    [_arrayImages addObject: @"n.jpg"];
    [_arrayImages addObject: @"o.jpg"];
    [_arrayImages addObject: @"p.jpg"];
    [_arrayImages addObject: @"q.jpg"];
    [_arrayImages addObject: @"r.jpg"];
    [_arrayImages addObject: @"s.jpg"];
    [_arrayImages addObject: @"t.jpg"];
    [_arrayImages addObject: @"u.jpg"];
    [_arrayImages addObject: @"v.jpg"];
    [_arrayImages addObject: @"w.jpg"];
    [_arrayImages addObject: @"x.jpg"];
    [_arrayImages addObject: @"y.jpg"];
    [_arrayImages addObject: @"z.jpg"];
    [_arrayImages addObject: @""];
/*
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
*/
    _arrayCredits = [[NSMutableArray alloc] init];
    [_arrayCredits addObject: @""];
    [_arrayCredits addObject: @"alligator - jc.winkler/Flickr"];
    [_arrayCredits addObject: @"bear - NPS/K. Jalone./Flickr"];
    [_arrayCredits addObject: @"cat - jacinta lluch valero/Flickr"];
    [_arrayCredits addObject: @"'Are you coming?' - timku/Flickr"];
    [_arrayCredits addObject: @"'Elephants' - John Schinker/Flickr"];
    [_arrayCredits addObject: @"flamingo - William Warby/Flickr"];
    [_arrayCredits addObject: @"giraffe - Daniel Ramirez/Flickr"];
    [_arrayCredits addObject: @"horse - Peter aka anemoneprojectors/Flickr"];
    [_arrayCredits addObject: @"'St Thomas' - Kevin Falcone/Flickr"];
    [_arrayCredits addObject: @"jaguar - Eric Kilby/Flickr"];
    [_arrayCredits addObject: @"'Yanchep Kangaroos' - Mark, Vicki, Ellaura and Mason/Flickr"];
    [_arrayCredits addObject: @"llama - Val D'Aquila/Flickr"];
    [_arrayCredits addObject: @"monkey - Robyn Jay/Flickr"];
    [_arrayCredits addObject: @"'Numbat' - Charles Kottler/Flickr"];
    [_arrayCredits addObject: @"'Who you looking at?' - Lyndie/Flickr"];
    [_arrayCredits addObject: @"pig - Pete Birkinshaw/Flickr"];
    [_arrayCredits addObject: @"'California Quail' - Lee Jaffe/Flickr"];
    [_arrayCredits addObject: @"rabbit - Mark Kent/Flickr"];
    [_arrayCredits addObject: @"'Snake' - Hans Watson/Flickr"];
    [_arrayCredits addObject: @"tiger - Moni Sertel/Flickr"];
    [_arrayCredits addObject: @"'Ovis vignei' - abejorro34/Flickr"];
    [_arrayCredits addObject: @"vulture - Daniel Daley/Flickr"];
    [_arrayCredits addObject: @"anim0054 - NOAA Photo Library/Flickr"];
    [_arrayCredits addObject: @"'Streaked Xenops' - Carlos Henrique/Flickr"];
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

+ (uint)findFontSize:(CGRect)box withText:(NSString *)text
{
/*    CGSize textSize = [_label.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Arial" size:[Utils findFontSize:_label.frame]]}];
  */  
    
    return 120;
}

+ (UIColor *)grey
{
    /*    CGSize textSize = [_label.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Arial" size:[Utils findFontSize:_label.frame]]}];
     */
    
    return [UIColor colorWithWhite: 1.0 alpha:0.75];
}

+ (CGSize)cellSize
{
    CGFloat _width = [UIScreen mainScreen].bounds.size.width;
    CGFloat _height = [UIScreen mainScreen].bounds.size.height;
    
    if(_width > _height) // landscape
    {
        NSLog(@"width: %f, height: %f", _width, _height);
        CGSize size = CGSizeMake( (_width - _width/10)/3 , (_height - _height/10)/3);
        NSLog(@"%s: landscape, %@", __FUNCTION__, NSStringFromCGSize(size));
        return size;
    }
    else // portrait
    {
        NSLog(@"width: %f, height: %f", _width, _height);
        CGSize size = CGSizeMake( (_width - _width/10)/3 , (_height - _height/10)/3);
        NSLog(@"%s: portrait, %@", __FUNCTION__, NSStringFromCGSize(size));
        return size;
    }
}

@end
