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
#import "SpecialCollectionViewCell.h"

@interface CollectionViewController : UICollectionViewController

@property (nonatomic, retain) UICollectionView *collectionView;
@property (nonatomic, retain) NSMutableArray *results;

@end


#endif /* CollectionViewController_h */

