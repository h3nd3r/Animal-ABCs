//
//  ViewController.h
//  Animal ABCs
//
//  Created by Sara Hender on 9/28/14.
//  Copyright (c) 2014 Sara Hender. All rights reserved.
//

#ifndef ViewController_h
#define ViewController_h

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
{

    
@private
    UICollectionView *_collectionView;
    NSMutableArray *_results; // data source array
}

- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer;
- (UIColor*)colorWithHexString:(NSString*)hex;

@property (nonatomic) int arrayIndex;
@property IBOutlet UIView *_portraitView;
@property IBOutlet UIView *_landscapeView;
@property IBOutlet UIView *_defaultView;
@property UIView *_currentView;
@property UILabel *_label;
    
-(void)createSubviews;

@end

#endif /* ViewController_h */
