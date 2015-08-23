//
//  ViewController.h
//  Animal ABCs
//
//  Created by Sara Hender on 9/28/14.
//  Copyright (c) 2014 42 Dragons Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
{



}

@property IBOutlet UIView *_portraitView;
@property IBOutlet UIView *_landscapeView;
@property IBOutlet UIView *_defaultView;
@property UIView *_currentView;
@property UILabel *_label;
    
-(UIColor*)colorWithHexString;
-(void)createSubviews;
-(void)credits;

@end
