//
//  SpecialCollectionViewCell.m
//  Animal ABCs
//
//  Created by Sara Hender on 25/05/2016.
//
//

#import <Foundation/Foundation.h>
#include "SpecialCollectionviewCell.h"
#include "Utils.h"

@implementation SpecialCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    NSLog(@"%s", __FUNCTION__);
    
    _width = [UIScreen mainScreen].bounds.size.width;
    _height = [UIScreen mainScreen].bounds.size.height;
    
    CGSize cellSize = CGSizeMake( (_width - _width/10)/3 , (_height - _height/10)/3);
    
    self = [super initWithFrame:frame];
    if(self)
    {
        if(!_imageView)
        {
            _imageView =[[UIImageView alloc] initWithFrame:CGRectMake(0,0, cellSize.width, cellSize.height)];
            _imageView.image=[UIImage imageNamed:[Utils sharedInstance].arraySmallImages[2]];
            _imageView.contentMode = UIViewContentModeScaleAspectFit;
            [self.contentView addSubview:_imageView];
        }
        if(!_label)
        {
            NSLog(@"%s: creating label", __FUNCTION__);
            _label = [UILabel new];
            _label.tag = 101;
            _label.frame = CGRectMake(0,0, cellSize.width, cellSize.height);
            _label.backgroundColor = [Utils grey];
            _label.textColor = [UIColor blackColor];
            _label.highlightedTextColor = [UIColor blackColor];
            _label.text = @"W";
            
            _label.font = [UIFont fontWithName:@"Arial" size:[Utils findFontSize:_label.frame withText:_label.text]];
            
            _label.textAlignment = NSTextAlignmentCenter;
            _label.adjustsFontSizeToFitWidth = YES;

            [self.contentView addSubview:_label];
        }
    }
    return self;
}
@end
