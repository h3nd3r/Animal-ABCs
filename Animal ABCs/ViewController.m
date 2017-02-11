//
//  ViewController.m
//  Animal ABCs
//
//  Created by Sara Hender on 9/28/14.
//  Copyright (c) 2014 Sara Hender. All rights reserved.
//

#import "ViewController.h"
#import "Utils.h"
#import "AppDelegate.h"
#import "CollectionViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@implementation ViewController

int _arrayIndex;
UILabel *_label;
UILabel *_label1;
UILabel *_label2;
UILabel *_label3;
UILabel *_label4;
UIImageView *_image;


CGSize _label1_textSize;

int arrayCount;
int collectionIndex = 0;

int _label_big_text_reducer = 7;
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

- (id)init
{
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"0");
    if (self = [super init]) {
        NSLog(@"1");
    }

    _arrayIndex = 0;
    return self;
}

- (void)viewDidLoad
{
    NSLog(@"%s", __FUNCTION__);
    
    [super viewDidLoad];
    
    _width = [UIScreen mainScreen].bounds.size.width;
    _height = [UIScreen mainScreen].bounds.size.height;
    
    [self createSubviews];
    
    UIGestureRecognizer *gestureRecognizer;
    UISwipeGestureRecognizer *swipeRecognizer;
    UIPinchGestureRecognizer *pinchRecognizer;
    UITapGestureRecognizer *tapRecognizer;
    
    gestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchGesture:)];
    [[self view] addGestureRecognizer:gestureRecognizer];
    
    swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFromRight:)];
    [swipeRecognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [[self view] addGestureRecognizer:swipeRecognizer];
    
    swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFromLeft:)];
    [swipeRecognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [[self view] addGestureRecognizer:swipeRecognizer];
    
    pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchGesture:)];
    [[self view] addGestureRecognizer:pinchRecognizer];

    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [[self view] addGestureRecognizer:tapRecognizer];
    
    
    
    // play sound
    [(AVAudioPlayer *)[Utils sharedInstance].audioPlayers[_arrayIndex] play];
}

- (IBAction)handlePinchGesture:(UIPinchGestureRecognizer *)recognizer
{
    NSLog(@"%s", __FUNCTION__);

    if(_arrayIndex < 26)
    {
        [(AVAudioPlayer *)[Utils sharedInstance].audioPlayers[_arrayIndex] stop];
        [(AVAudioPlayer *)[Utils sharedInstance].audioPlayers[_arrayIndex] setCurrentTime:0];
    }
    
    if(UIGestureRecognizerStateEnded == recognizer.state)
    {
        CollectionViewController *collectionViewController =
                                        [[CollectionViewController alloc] init];
        collectionViewController.modalPresentationStyle = UIModalPresentationFullScreen;

        [self presentViewController:collectionViewController animated:YES completion: nil];
    }
}

- (void)handleTapGesture:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"%s", __FUNCTION__);
    
    if(UIGestureRecognizerStateEnded == recognizer.state)
    {
        AVAudioPlayer *temp = [Utils sharedInstance].audioPlayers[_arrayIndex];
        
        if(temp.currentTime == 0)
        {
            [(AVAudioPlayer *)[Utils sharedInstance].audioPlayers[_arrayIndex] play];
        }
        else
        {
            [(AVAudioPlayer *)[Utils sharedInstance].audioPlayers[_arrayIndex] stop];
            [(AVAudioPlayer *)[Utils sharedInstance].audioPlayers[_arrayIndex] setCurrentTime:0];
        }
    }
}

-(void)handleSwipeFromRight:(UISwipeGestureRecognizer *)recognizer
{
    NSLog(@"%s", __FUNCTION__);
    
    if (_arrayIndex !=26)
    {
        // stop playing any sounds & rewind
        [(AVAudioPlayer *)[Utils sharedInstance].audioPlayers[_arrayIndex] stop];
        [(AVAudioPlayer *)[Utils sharedInstance].audioPlayers[_arrayIndex] setCurrentTime:0];
    }
    
    _arrayIndex--;
    NSLog(@"Right swipe received, arrayIndex %d", _arrayIndex);

    if(_arrayIndex < 0) {
        _arrayIndex = arrayCount - 1;
    }

    if (_arrayIndex == 25) {
        [self clearCredits];
    }
    
    if (_arrayIndex !=26) {
        _label.text = [Utils sharedInstance].arrayLetters[_arrayIndex];
        _label2.text = [Utils sharedInstance].arrayNames[_arrayIndex];
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;

        
        CGSize textSize = [_label.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Arial" size:_height/_label_big_text_reducer]}];
        _label.frame = CGRectMake(20, 20, textSize.width+20, textSize.height);
        
        
        
        textSize = [_label2.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Arial" size:_height/_label_medium_text_reducer]}];
        _label2.frame = CGRectMake(width - 40 - textSize.width, height - 20 - textSize.height, textSize.width + 20, textSize.height);
        
        NSString *fullpath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:[NSString stringWithFormat:@"/%@", [Utils sharedInstance].arrayImages[_arrayIndex]]];
        NSLog(@"Right swipe received, path %@", fullpath);
        
        UIImage *loadImage = [UIImage imageWithContentsOfFile:fullpath];
        _image.image = loadImage;
        
        [self.view setBackgroundColor:[Utils colorWithHexString:[Utils sharedInstance].arrayColors[_arrayIndex]]];

        [(AVAudioPlayer *)[Utils sharedInstance].audioPlayers[_arrayIndex] play];
    } else {
        [self setCredits];
    }
}

-(void)handleSwipeFromLeft:(UISwipeGestureRecognizer *)recognizer
{
    NSLog(@"%s", __FUNCTION__);
    
    if (_arrayIndex !=26) {
        // stop playing any sounds & ...
        [(AVAudioPlayer *)[Utils sharedInstance].audioPlayers[_arrayIndex] stop];
        [(AVAudioPlayer *)[Utils sharedInstance].audioPlayers[_arrayIndex] setCurrentTime:0];
    }
    
    _arrayIndex++;
    NSLog(@"Left swipe received, _arrayIndex %d", _arrayIndex);

    if(_arrayIndex >= arrayCount) {
        _arrayIndex = 0;
    }

    if (_arrayIndex == 0) {
        [self clearCredits];
    }
    
    if (_arrayIndex !=26) {
        _label.text = [Utils sharedInstance].arrayLetters[_arrayIndex];
        _label2.text = [Utils sharedInstance].arrayNames[_arrayIndex];

        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;

        CGSize textSize = [_label.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Arial" size:_height/_label_big_text_reducer]}];
        _label.frame = CGRectMake(20, 20, textSize.width+20, textSize.height);
        
        textSize = [_label2.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Arial" size:_height/_label_medium_text_reducer]}];
        _label2.frame = CGRectMake(width - 40 - textSize.width, height - 20 - textSize.height, textSize.width + 20, textSize.height);
        
        NSString *fullpath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:[NSString stringWithFormat:@"/%@", [Utils sharedInstance].arrayImages[_arrayIndex]]];
        NSLog(@"Left swipe received, path %@", fullpath);
        
        UIImage *loadImage = [UIImage imageWithContentsOfFile:fullpath];
        _image.image = loadImage;
        
        [self.view setBackgroundColor:[Utils colorWithHexString:[Utils sharedInstance].arrayColors[_arrayIndex]]];
    
        [(AVAudioPlayer *)[Utils sharedInstance].audioPlayers[_arrayIndex] play];
    } else {
        [self setCredits];
    }
}

- (BOOL)shouldAutorotate
{
    NSLog(@"%s", __FUNCTION__);
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    _image.frame = CGRectMake(0, 0, width, height);
    
    CGSize textSize = [_label.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Arial" size:_height/_label_big_text_reducer]}];
    _label.frame = CGRectMake(20, 20, textSize.width+20, textSize.height);
    
    textSize = [_label2.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Arial" size:_height/_label_medium_text_reducer]}];
    
    _label2.frame = CGRectMake(width - 40 - textSize.width, height - 20 - textSize.height, textSize.width + 20, textSize.height);
    
    _label1.frame = CGRectMake(0, 20, width, _label1_textSize.height);
    
    if (height > width) {
        NSLog(@"portrait");
        _label3.font = [UIFont fontWithName:@"Arial" size:portrait_text_size_3];
        _label3.frame = CGRectMake(px1_3, py1_3, px2_3, py2_3);
        
        _label4.font = [UIFont fontWithName:@"Arial" size:portrait_text_size_4];
        _label4.frame = CGRectMake(px1_4, py1_4, px2_4, py2_4);
        
    }
    else
    {
        NSLog(@"landscape");
        _label3.font = [UIFont fontWithName:@"Arial" size:landscape_text_size_3];
        _label3.frame = CGRectMake(lx1_3, ly1_3, lx2_3, ly2_3);
        
        _label4.font = [UIFont fontWithName:@"Arial" size:landscape_text_size_4];
        _label4.frame = CGRectMake(lx1_4, ly1_4, lx2_4, ly2_4);
    }
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"%ld", (long)orientation);
    
    return YES;
}

-(void)setUpViewForOrientation:(UIInterfaceOrientation)orientation
{
    NSLog(@"%s", __FUNCTION__);
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"%s", __FUNCTION__);
    
    [self setUpViewForOrientation:toInterfaceOrientation];
    [self shouldAutorotate];
}

-(void)clearCredits
{
    _label.hidden = false;
    _label1.hidden = true;
    _label2.hidden = false;
    _label3.hidden = true;
    _label4.hidden = true;
    _image.hidden = false;
}

-(void)setCredits
{
    _label.hidden = true;
    _label1.hidden = false;
    _label2.hidden = true;
    _label3.hidden = false;
    _label4.hidden = false;
    _image.hidden = true;
    
    [self.view setBackgroundColor:[Utils colorWithHexString:[Utils sharedInstance].arrayColors[_arrayIndex]]];
}

-(void)createSubviews
{
    NSLog(@"%s", __FUNCTION__);
    arrayCount = (int)[[Utils sharedInstance].arrayNames count];
    
    _image =[[UIImageView alloc] initWithFrame:CGRectMake(0,0, _width, _height)];
    _image.image=[UIImage imageNamed:[Utils sharedInstance].arrayImages[_arrayIndex]];
    _image.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_image];
    
    _label = [UILabel new];
    _label.text = [Utils sharedInstance].arrayLetters[_arrayIndex];
    CGSize textSize = [_label.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Arial" size:_height/_label_big_text_reducer]}];
    _label.frame = CGRectMake(20, 20, textSize.width+20, textSize.height);
    
    _label.backgroundColor = [Utils grey];
    _label.textColor = [UIColor blackColor];
    _label.highlightedTextColor = [UIColor blackColor];
    _label.font = [UIFont fontWithName:@"Arial" size:_height/_label_big_text_reducer];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];
    
    _label2 = [UILabel new];
    _label2.text = [Utils sharedInstance].arrayNames[_arrayIndex];
    textSize = [_label2.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Arial" size:_height/_label_medium_text_reducer]}];
    _label2.frame = CGRectMake(_width - 40 - textSize.width, _height - 20 - textSize.height, textSize.width + 20, textSize.height);
    _label2.backgroundColor = [Utils grey];
    _label2.textColor = [UIColor blackColor];
    _label2.highlightedTextColor = [UIColor blackColor];
    _label2.font = [UIFont fontWithName:@"Arial" size:_height/_label_medium_text_reducer];
    _label2.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label2];
    
    [self.view setBackgroundColor:[Utils colorWithHexString:[Utils sharedInstance].arrayColors[_arrayIndex]]];
    
    
/* -------------CREDITS-----------------*/
    _label1 = [UILabel new];
    _label1.text = @"Credits";
    _label1.backgroundColor = [UIColor clearColor];
    _label1.textColor = [UIColor blackColor];
    _label1.highlightedTextColor = [UIColor blackColor];
    _label1.font = [UIFont fontWithName:@"Arial" size:_height/_label_medium_text_reducer];
    _label1.textAlignment = NSTextAlignmentCenter;
    _label1.hidden = true;
    _label1_textSize = [_label1.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Arial" size:_height/_label_medium_text_reducer]}];
    _label1.frame = CGRectMake(0, 20, _width, _label1_textSize.height);
    [self.view addSubview:_label1];
    
    _label3 = [UILabel new];
    _label3.text = @"licensed under Creative Commons\nhttps://creativecommons.org/licenses/by/2.0/";
    _label3.numberOfLines = 0;
    _label3.backgroundColor = [UIColor clearColor];
    _label3.textColor = [UIColor blackColor];
    _label3.highlightedTextColor = [UIColor blackColor];
    _label3.textAlignment = NSTextAlignmentCenter;
    _label3.hidden = true;
    [self.view addSubview:_label3];
    
    _label4 = [UILabel new];
    _label4.backgroundColor = [UIColor clearColor];
    _label4.textColor = [UIColor blackColor];
    _label4.highlightedTextColor = [UIColor blackColor];
    _label4.font = [UIFont fontWithName:@"Arial" size:_height/20];
    _label4.textAlignment = NSTextAlignmentCenter;
    _label4.hidden = true;
    _label4.numberOfLines = 0;
    NSMutableString *tempString = [NSMutableString string];
    for(int i=0;i<27;i++){
        [tempString appendString:[Utils sharedInstance].arrayCredits[i]];
        [tempString appendString:@"\n"];
    }
    _label4.text = tempString;
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
    
    // NOW SET PORTRAIT VARS
    NSLog(@"portrait dimensions: %d, %d", portrait_width, portrait_height);
    
    int currentHeight =  _label1_textSize.height + 20;
    
    // fit text within width of screen...
    CGSize _label3_textSize = [_label3.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Arial" size:portrait_height]}];
    int multiplier = 1;
    
    while (_label3_textSize.width > portrait_width){
        multiplier++;
        _label3_textSize = [_label3.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Arial" size:portrait_height/multiplier]}];
    }
    NSLog(@"width: %f, height: %f", _label3_textSize.width, _label3_textSize.height);
    
    portrait_text_size_3 = portrait_height/multiplier;
    px1_3 = 0;
    px2_3 = portrait_width;
    py1_3 = currentHeight;
    py2_3 = _label3_textSize.height;
/*
    _label3.font = [UIFont fontWithName:@"Arial" size:portrait_text_size_3];
    _label3.frame = CGRectMake(px1_3, py1_3, px2_3, py2_3);
  */
    currentHeight = currentHeight + _label3_textSize.height;
    multiplier = 1;
    // the size to fit the credits...

    int remainingHeight = portrait_height - currentHeight;
    
    CGSize _label4_textSize = [_label4.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Arial" size:portrait_height/multiplier]}];

    while (_label4_textSize.height > remainingHeight){
        multiplier++;
        _label4_textSize = [_label4.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Arial" size:portrait_height/multiplier]}];
    }
    
    NSLog(@"width: %f, height: %f", _label4_textSize.width, _label4_textSize.height);

    portrait_text_size_4 = portrait_height/multiplier;
    px1_4 = 0;
    px2_4 = portrait_width;
    py1_4 = currentHeight;
    py2_4 = remainingHeight;
/*
    _label4.font = [UIFont fontWithName:@"Arial" size:portrait_text_size_4];
    _label4.frame = CGRectMake(px1_4, py1_4, px2_4, py2_4);
  */
    // NOW SET LANDSCAPE VARS
    currentHeight =  _label1_textSize.height + 20;

    NSLog(@"landscape dimensions: %d, %d", landscape_width, landscape_height);
    
    // fit text within width of screen...
    _label3_textSize = [_label3.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Arial" size:landscape_height]}];
    multiplier = 1;
    
    while (_label3_textSize.width > landscape_width){
        multiplier++;
        _label3_textSize = [_label3.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Arial" size:landscape_height/multiplier]}];
    }
    NSLog(@"width: %f, height: %f", _label3_textSize.width, _label3_textSize.height);
    
    landscape_text_size_3 = landscape_height/multiplier;
    lx1_3 = 0;
    lx2_3 = landscape_width;
    ly1_3 = currentHeight;
    ly2_3 = _label3_textSize.height;
    /*
    _label3.font = [UIFont fontWithName:@"Arial" size:landscape_text_size_3];
    _label3.frame = CGRectMake(lx1_3, ly1_3, lx2_3, ly2_3);
    */
    
    currentHeight = currentHeight + _label3_textSize.height;
    
    
    multiplier = 1;
    // the size to fit the credits...
    
    remainingHeight = landscape_height - currentHeight;
    
    _label4_textSize = [_label4.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Arial" size:landscape_height/multiplier]}];
    
    while (_label4_textSize.height > remainingHeight){
        multiplier++;
        _label4_textSize = [_label4.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Arial" size:landscape_height/multiplier]}];
    }
    
    NSLog(@"%@", NSStringFromCGSize(_label4_textSize));
    
    landscape_text_size_4 = landscape_height/multiplier;
    lx1_4 = 0;
    lx2_4 = landscape_width;//_label4_textSize.width;
    ly1_4 = currentHeight;
    ly2_4 = remainingHeight;
   /*
    _label4.font = [UIFont fontWithName:@"Arial" size:landscape_text_size_4];
    _label4.frame = CGRectMake(lx1_4, ly1_4, lx2_4, ly2_4);
*/
    [self shouldAutorotate];
}
                        
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    // call the following function when the sound is no longer used
    // (must be done AFTER the sound is done playing)
    //AudioServicesDisposeSystemSoundID(audioEffect);
    
}

@end
