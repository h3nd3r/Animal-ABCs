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

+ (Utils *)sharedInstance;
+ (CGSize)cellSize;
+ (uint)findFontSize:(CGRect)box withText:(NSString *)text;
+ (UIColor *)grey;
+ (UIColor *)colorWithHexString:(NSString *)hex;

//@property NSArray *arrayTest;

//- (NSMutableArray *)audioPlayers;

@property (getter=arraySmallImages) NSMutableArray *arraySmallImages;
@property (getter=arrayNames) NSMutableArray *arrayNames;
@property (getter=arrayLetters) NSMutableArray *arrayLetters;
@property (getter=arrayLetter) NSMutableArray *arrayLetter;
@property (getter=arrayImages) NSMutableArray *arrayImages;
@property (getter=arrayCredits) NSMutableArray *arrayCredits;
@property (getter=arrayCreditsLandscape) NSMutableArray *arrayCreditsLandscape;
@property (getter=arrayCreditsPortrait) NSMutableArray *arrayCreditsPortrait;
@property (getter=arrayAudio) NSMutableArray *arrayAudio;
@property (getter=arrayColors) NSMutableArray *arrayColors;
@property (getter=audioPlayers) NSMutableArray *audioPlayers;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@end
#endif /* Utils_h */
