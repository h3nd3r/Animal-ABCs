//
//  Utils.h
//  Animal ABCs
//
//  Created by Sara Hender on 18/05/2016.
//
//

#ifndef Utils_h
#define Utils_h

#import <UIKit/UIKit.h>

@interface Utils : NSObject

+ (UIColor *)colorWithHexString:(NSString *)hex;
//- (NSMutableArray *)audioPlayers;

@property (getter=arrayNames) NSMutableArray *arrayNames;
@property (getter=arrayLetters) NSMutableArray *arrayLetters;
@property (getter=arrayLetter) NSMutableArray *arrayLetter;
@property (getter=arrayImages) NSMutableArray *arrayImages;
@property (getter=arrayCredits) NSMutableArray *arrayCredits;
@property (getter=arrayAudio) NSMutableArray *arrayAudio;
@property (getter=arrayColors) NSMutableArray *arrayColors;
@property (getter=audioPlayers) NSMutableArray *audioPlayers;

@end
#endif /* Utils_h */
