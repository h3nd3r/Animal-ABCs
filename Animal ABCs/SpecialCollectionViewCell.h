//
//  SpecialCollectionViewCell.h
//  Animal ABCs
//
//  Created by Sara Hender on 25/05/2016.
//
//

#ifndef SpecialCollectionViewCell_h
#define SpecialCollectionViewCell_h

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SpecialCollectionViewCell : UICollectionViewCell

@property (nonatomic, retain) UICollectionView *collectionView;
@property (nonatomic, retain) NSMutableArray *results;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;
@end


#endif /* SpecialCollectionViewCell_h */
