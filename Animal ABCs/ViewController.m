//
//  ViewController.m
//  Animal ABCs
//
//  Created by Sara Hender on 9/28/14.
//  Copyright (c) 2014 42 Dragons Software LLC. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@end

// default
UILabel *_label;
UILabel *_label2;

// credit
UILabel *_label1;
UILabel *_label3;
UILabel *_label4;

UIImageView *_image;

NSMutableArray *arrayNames;
NSMutableArray *arrayLetters;
NSMutableArray *arrayImages;
NSMutableArray *arrayCredits;
NSMutableArray *arrayAudio;
NSMutableArray *arrayColors;
NSMutableArray *_audioPlayers;

CGSize _label1_textSize;
CGFloat _width;
CGFloat _height;

int arrayIndex = 0;
int arrayCount;

int _label_big_text_reducer = 5;
int _label_medium_text_reducer = 10;
int _label_small_text_reducer = 15;

int portrait_text_size_3;
int px1_3, py1_3, px2_3, py2_3;

int landscape_text_size_3;
int lx1_3, ly1_3, lx2_3, ly2_3;

int portrait_text_size_4;
int px1_4, py1_4, px2_4, py2_4;

int landscape_text_size_4;
int lx1_4, ly1_4, lx2_4, ly2_4;


@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    // screen dimensions
    _width = [UIScreen mainScreen].bounds.size.width;
    _height = [UIScreen mainScreen].bounds.size.height;
    NSLog(@"%f", _width);
    NSLog(@"%f", _height);
    
    [self createSubviews];
    
    UIGestureRecognizer *gestureRecognizer;
    UISwipeGestureRecognizer *recognizer;

    gestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchGesture:)];
    [[self view] addGestureRecognizer:gestureRecognizer];
    //[recognizer release];
    
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFromRight:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [[self view] addGestureRecognizer:recognizer];
    //[recognizer release];
    
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFromLeft:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [[self view] addGestureRecognizer:recognizer];
    //[recognizer release];
    
    // play sound
    [(AVAudioPlayer *)_audioPlayers[arrayIndex] play];
    
    NSLog(@"%s", __FUNCTION__);
}

- (void)handlePinchGesture:(UIPinchGestureRecognizer *)sender {
    
    NSLog(@"Pinch received.");    
}

-(void)handleSwipeFromRight:(UISwipeGestureRecognizer *)recognizer {
    if (arrayIndex !=26) {
        // stop playing any sounds & rewind
        [(AVAudioPlayer *)_audioPlayers[arrayIndex] stop];
        [(AVAudioPlayer *)_audioPlayers[arrayIndex] setCurrentTime:0];
    }
    
    arrayIndex--;
    NSLog(@"Right swipe received, arrayIndex %d", arrayIndex);

    if(arrayIndex < 0) {
        arrayIndex = arrayCount - 1;
    }

    if (arrayIndex == 25) {
        [self clearCredits];
    }
    
    if (arrayIndex !=26) {
        _label.text = arrayLetters[arrayIndex];
        _label2.text = arrayNames[arrayIndex];
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        
        CGSize textSize = [_label2.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Courier" size:_height/_label_medium_text_reducer]}];
        _label2.frame = CGRectMake(width - 20 - textSize.width, height - 20 - textSize.height, textSize.width, textSize.height);
        
        NSString *fullpath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:[NSString stringWithFormat:@"/%@", arrayImages[arrayIndex]]];
        NSLog(@"Right swipe received, path %@", fullpath);
        
        UIImage *loadImage = [UIImage imageWithContentsOfFile:fullpath];
        _image.image = loadImage;
        
        
        [self.view setBackgroundColor:[self colorWithHexString:arrayColors[arrayIndex]]];

        [(AVAudioPlayer *)_audioPlayers[arrayIndex] play];
    } else {
        [self setCredits];
    }
}

-(void)handleSwipeFromLeft:(UISwipeGestureRecognizer *)recognizer {
    
    if (arrayIndex !=26) {
        // stop playing any sounds & ...
        [(AVAudioPlayer *)_audioPlayers[arrayIndex] stop];
        [(AVAudioPlayer *)_audioPlayers[arrayIndex] setCurrentTime:0];
    }
    
    arrayIndex++;
    NSLog(@"Left swipe received, arrayIndex %d", arrayIndex);

    if(arrayIndex >= arrayCount) {
        arrayIndex = 0;
    }

    if (arrayIndex == 0) {
        [self clearCredits];
    }
    
    if (arrayIndex !=26) {
        _label.text = arrayLetters[arrayIndex];
        _label2.text = arrayNames[arrayIndex];

        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;

        CGSize textSize = [_label2.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Courier" size:_height/_label_medium_text_reducer]}];
        _label2.frame = CGRectMake(width - 20 - textSize.width, height - 20 - textSize.height, textSize.width, textSize.height);
        
        NSString *fullpath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:[NSString stringWithFormat:@"/%@", arrayImages[arrayIndex]]];
        NSLog(@"Left swipe received, path %@", fullpath);
        
        UIImage *loadImage = [UIImage imageWithContentsOfFile:fullpath];
        _image.image = loadImage;
        
        [self.view setBackgroundColor:[self colorWithHexString:arrayColors[arrayIndex]]];
    
        [(AVAudioPlayer *)_audioPlayers[arrayIndex] play];
    } else {
        [self setCredits];
    }
}

- (BOOL)shouldAutorotate {
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    _image.frame = CGRectMake(0, 0, _height, _width);
    
    CGSize textSize = [_label.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Courier" size:_height/_label_big_text_reducer]}];
    _label.frame = CGRectMake(20, 20, textSize.width, textSize.height);
    
    textSize = [_label2.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Courier" size:_height/_label_medium_text_reducer]}];
    _label2.frame = CGRectMake(width - 20 - textSize.width, height - 20 - textSize.height, textSize.width, textSize.height);
    
    _label1.frame = CGRectMake(0, 20, width, _label1_textSize.height);
    
    NSLog(@"portrait: %d",portrait_text_size_3);
    NSLog(@"portrait: %d",portrait_text_size_4);
    NSLog(@"portrait: %d,%d,%d,%d",px1_3, py1_3, px2_3, py2_3);
    NSLog(@"portrait: %d,%d,%d,%d",px1_4, py1_4, px2_4, py2_4);
    
    NSLog(@"landscape: %d",landscape_text_size_3);
    NSLog(@"landscape: %d",landscape_text_size_4);
    NSLog(@"landscape: %d,%d,%d,%d",lx1_3, ly1_3, lx2_3, ly2_3);
    NSLog(@"landscape: %d,%d,%d,%d",lx1_4, ly1_4, lx2_4, ly2_4);
    
    if ((orientation == UIInterfaceOrientationPortrait) ||
            (orientation == UIInterfaceOrientationPortraitUpsideDown)){
        NSLog(@"portrait");
        _label3.font = [UIFont fontWithName:@"Courier-Bold" size:portrait_text_size_3];
        _label3.frame = CGRectMake(px1_3, py1_3, px2_3, py2_3);
        
        _label4.font = [UIFont fontWithName:@"Courier-Bold" size:portrait_text_size_4];
        _label4.frame = CGRectMake(px1_4, py1_4, px2_4, py2_4);
        
    }
    // (orientation == UIInterfaceOrientationLandscapeRight)
    // (orientation == UIInterfaceOrientationLandscapeLeft)
    else
    {
        NSLog(@"landscape");
        _label3.font = [UIFont fontWithName:@"Courier-Bold" size:landscape_text_size_3];
        _label4.font = [UIFont fontWithName:@"Courier-Bold" size:landscape_text_size_4];
        
        _label3.frame = CGRectMake(lx1_3, ly1_3, lx2_3, ly2_3);
        _label4.frame = CGRectMake(lx1_4, ly1_4, lx2_4, ly2_4);
    }
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"%ld", (long)orientation);
    
    return YES;
}

-(void)setUpViewForOrientation:(UIInterfaceOrientation)orientation {
    NSLog(@"%s", __FUNCTION__);
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [self setUpViewForOrientation:toInterfaceOrientation];
}

-(void)clearCredits {
    _label.hidden = false;
    _label1.hidden = true;
    _label2.hidden = false;
    _label3.hidden = true;
    _label4.hidden = true;
    
    _image.hidden = false;
}

-(void)setCredits {
    _label.hidden = true;
    _label1.hidden = false;
    _label2.hidden = true;
    _label3.hidden = false;
    _label4.hidden = false;
    
    _image.hidden = true;
    
    [self.view setBackgroundColor:[self colorWithHexString:arrayColors[arrayIndex]]];
}

-(void)createSubviews {
    arrayCount = (int)[arrayNames count];
    
    _image =[[UIImageView alloc] initWithFrame:CGRectMake(0,0, _width, _height)];
    _image.image=[UIImage imageNamed:arrayImages[arrayIndex]];
    _image.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_image];
    
    UIColor* grey70 = [UIColor colorWithWhite: 1.0 alpha:0.45];
    
    _label = [UILabel new];
    _label.text = arrayLetters[arrayIndex];
    CGSize textSize = [_label.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Courier" size:_height/_label_big_text_reducer]}];
    _label.frame = CGRectMake(20, 20, textSize.width + 20, textSize.height);
    _label.backgroundColor = grey70;
    _label.textColor = [UIColor blackColor];
    _label.highlightedTextColor = [UIColor blackColor];
    _label.font = [UIFont fontWithName:@"Courier-Bold" size:_height/_label_big_text_reducer];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];
    
    _label2 = [UILabel new];
    _label2.text = arrayNames[arrayIndex];
    textSize = [_label2.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Courier" size:_height/_label_medium_text_reducer]}];
    _label2.frame = CGRectMake(_width - 20 - textSize.width, _height - 20 - textSize.height, textSize.width, textSize.height);
    _label2.backgroundColor = grey70;
    _label2.textColor = [UIColor blackColor];
    _label2.highlightedTextColor = [UIColor blackColor];
    _label2.font = [UIFont fontWithName:@"Courier" size:_height/_label_medium_text_reducer];
    _label2.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:_label2];
    
    [self.view setBackgroundColor:[self colorWithHexString:arrayColors[arrayIndex]]];
    
    
/* -------------CREDITS-----------------*/
    _label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, _width, _height)];
    _label1.text = @"Credits";
    _label1.backgroundColor = [UIColor clearColor];
    _label1.textColor = [UIColor blackColor];
    _label1.highlightedTextColor = [UIColor blackColor];
    _label1.font = [UIFont fontWithName:@"Courier-Bold" size:_height/_label_medium_text_reducer];
    _label1.textAlignment = NSTextAlignmentCenter;
    _label1.hidden = true;
    [self.view addSubview:_label1];
    
    _label1_textSize = [_label1.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Courier" size:_height/_label_medium_text_reducer]}];
    _label1.frame = CGRectMake(0, 20, _width, _label1_textSize.height);

    _label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, _label1_textSize.height, _width*2, _height)];
    _label3.text = @"all images as original\nlicensed under Creative Commons\nhttps://creativecommons.org/licenses/by/2.0/";
    _label3.numberOfLines = 0;
    _label3.backgroundColor = [UIColor clearColor];
    _label3.textColor = [UIColor blackColor];
    _label3.highlightedTextColor = [UIColor blackColor];
    _label3.textAlignment = NSTextAlignmentCenter;
    _label3.hidden = true;
    [self.view addSubview:_label3];
    
    _label4 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, _width, _height)];
    _label4.backgroundColor = [UIColor clearColor];
    _label4.textColor = [UIColor blackColor];
    _label4.highlightedTextColor = [UIColor blackColor];
    _label4.font = [UIFont fontWithName:@"Courier-Bold" size:_height/20];
    _label4.textAlignment = NSTextAlignmentCenter;
    _label4.hidden = true;
    _label4.numberOfLines = 0;
    NSMutableString *testString = [NSMutableString string];
    for(int i=0;i<27;i++){
        [testString appendString:arrayCredits[i]];
        [testString appendString:@"\n"];
    }
    _label4.text = testString;
    [self.view addSubview:_label4];
    
    int portrait_width;
    int portrait_height;
    int landscape_width;
    int landscape_height;
    
    // set portrait dimensions first
    if([UIScreen mainScreen].bounds.size.width > [UIScreen mainScreen].bounds.size.height) {
        portrait_height=[UIScreen mainScreen].bounds.size.width;
        landscape_width=[UIScreen mainScreen].bounds.size.width;
        portrait_width=[UIScreen mainScreen].bounds.size.height;
        landscape_height=[UIScreen mainScreen].bounds.size.height;
    }
    else{
        portrait_height=[UIScreen mainScreen].bounds.size.height;
        landscape_width=[UIScreen mainScreen].bounds.size.height;
        portrait_width=[UIScreen mainScreen].bounds.size.width;
        landscape_height=[UIScreen mainScreen].bounds.size.width;
    }
    NSLog(@"portrait dimensions: %d, %d", portrait_height, portrait_width);
    
    int currentHeight =  _label1_textSize.height + 20;
    
    // fit text within width of screen...
    CGSize _label3_textSize = [_label3.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Courier" size:portrait_height]}];
    int multiplier = 1;
    
    while (_label3_textSize.width > portrait_width){
        multiplier++;
        _label3_textSize = [_label3.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Courier" size:portrait_height/multiplier]}];
    }
    NSLog(@"width: %f, height: %f", _label3_textSize.width, _label3_textSize.height);
    
    portrait_text_size_3 = portrait_height/multiplier;
    px1_3 = 0;
    px2_3 = portrait_width;
    py1_3 = currentHeight;
    py2_3 = _label3_textSize.height;
    _label3.font = [UIFont fontWithName:@"Courier" size:portrait_height/multiplier];
    _label3.frame = CGRectMake(0, currentHeight, portrait_width, _label3_textSize.height);
    currentHeight = currentHeight + _label3_textSize.height;

    
    multiplier = 1;
    // the size to fit the credits...

    int remainingHeight = portrait_height - currentHeight;
    
    CGSize _label4_textSize = [_label4.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Courier" size:portrait_height/multiplier]}];

    while (_label4_textSize.height > remainingHeight){
        multiplier++;
        _label4_textSize = [_label4.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Courier" size:portrait_height/multiplier]}];
    }
    
     NSLog(@"width: %f, height: %f", _label4_textSize.width, _label4_textSize.height);
    _label4.font = [UIFont fontWithName:@"Courier" size:portrait_height/multiplier];
    _label4.frame = CGRectMake(0, currentHeight, _label4_textSize.width, remainingHeight);

    portrait_text_size_4 = portrait_height/multiplier;
    px1_4 = 0;
    px2_4 = _label4_textSize.width;
    py1_4 = currentHeight;
    py2_4 = remainingHeight;
    
    // NOW SET LANDSCAPE VARS
    currentHeight =  _label1_textSize.height + 20;

    NSLog(@"landscape dimensions: %d, %d", landscape_height, landscape_width);
    
    // fit text within width of screen...
    _label3_textSize = [_label3.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Courier" size:landscape_height]}];
    multiplier = 1;
    
    while (_label3_textSize.width > landscape_width){
        multiplier++;
        _label3_textSize = [_label3.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Courier" size:landscape_height/multiplier]}];
    }
    NSLog(@"width: %f, height: %f", _label3_textSize.width, _label3_textSize.height);
    
    landscape_text_size_3 = landscape_height/multiplier;
    lx1_3 = 0;
    lx2_3 = landscape_width;
    ly1_3 = currentHeight;
    ly2_3 = _label3_textSize.height;
    _label3.font = [UIFont fontWithName:@"Courier" size:landscape_height/multiplier];
    _label3.frame = CGRectMake(0, currentHeight, landscape_width, _label3_textSize.height);
    currentHeight = currentHeight + _label3_textSize.height;
    
    
    multiplier = 1;
    // the size to fit the credits...
    
    remainingHeight = landscape_height - currentHeight;
    
    _label4_textSize = [_label4.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Courier" size:landscape_height/multiplier]}];
    
    while (_label4_textSize.height > remainingHeight){
        multiplier++;
        _label4_textSize = [_label4.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Courier" size:landscape_height/multiplier]}];
    }
    
    NSLog(@"width: %f, height: %f", _label4_textSize.width, _label4_textSize.height);
    _label4.font = [UIFont fontWithName:@"Courier" size:landscape_height/multiplier];
    _label4.frame = CGRectMake(0, currentHeight, _label4_textSize.width, remainingHeight);
    
    landscape_text_size_4 = landscape_height/multiplier;
    lx1_4 = 0;
    lx2_4 = landscape_width;//_label4_textSize.width;
    ly1_4 = currentHeight;
    ly2_4 = remainingHeight;
}
                        
-(UIColor*)colorWithHexString:(NSString*)hex {
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    // call the following function when the sound is no longer used
    // (must be done AFTER the sound is done playing)
    //AudioServicesDisposeSystemSoundID(audioEffect);
    
}

@end
