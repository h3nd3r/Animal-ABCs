//
//  CollectionViewController.h
//  Animal ABCs
//
//  Created by Sara Hender on 06/05/2016.
//
//

#ifndef CollectionViewController_h
#define CollectionViewController_h

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "ViewController.h"

@interface CollectionViewController : UICollectionViewController
{
@private
    UICollectionView *_collectionView;
    NSMutableArray *_results; // data source array
    
    
}
/*
@property IBOutlet UIView *_portraitView;
@property IBOutlet UIView *_landscapeView;
@property IBOutlet UIView *_defaultView;
@property UIView *_currentView;
@property UILabel *_label;
*/
-(void)turkey;

@end


#endif /* CollectionViewController_h */

