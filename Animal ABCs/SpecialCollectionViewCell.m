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
Utils *_utils;
NSMutableArray *arrayImages;

- (id)initWithFrame:(CGRect)frame
{
    NSLog(@"%s", __FUNCTION__);
    self = [super initWithFrame:frame];
    if (self)
    {
        if (!_imageView) {/*
            NSLog(@"%s: creating image", __FUNCTION__);
            //_imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 450, 400)];
            
            _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];

            _imageView.tag = 100;
            _imageView.contentMode = UIViewContentModeScaleAspectFit;
           // _imageView.frame = frame;
            
            NSString *fullpath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:[NSString stringWithFormat:@"/%@", _utils.arrayImages[2] ]];
            UIImage *loadImage = [UIImage imageWithContentsOfFile:fullpath];
            
            _imageView.image = loadImage;
            NSLog(@"%@", fullpath);
            
            [self.contentView addSubview:_imageView];
            
            */
            _imageView =[[UIImageView alloc] initWithFrame:CGRectMake(0,0, 450, 400)];
            _imageView.image=[UIImage imageNamed:_utils.arrayImages[2]];
            _imageView.contentMode = UIViewContentModeScaleAspectFit;
            [self.contentView addSubview:_imageView];
            
            
            
        }

        if(!_label) {
            NSLog(@"%s: creating label", __FUNCTION__);
            
            _label = [UILabel new];
            _label.tag = 101;
            UIColor* grey70 = [UIColor colorWithWhite: 1.0 alpha:0.45];
            //CGSize textSize = [UIFont fontWithName:@"Arial" size:150]}];
            /*[_label.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Arial" size:150]}];*/
            _label.frame = CGRectMake(0, 0, 450, 400);
            _label.backgroundColor = grey70;
            _label.textColor = [UIColor blackColor];
            _label.highlightedTextColor = [UIColor blackColor];
            _label.font = [UIFont fontWithName:@"Arial" size:150];
            _label.textAlignment = NSTextAlignmentCenter;
            _label.adjustsFontSizeToFitWidth = YES;
            _label.text = @"Hello Worlds!";
            [self.contentView addSubview:_label];
        }
    }
    return self;
}
@end