//
//  CollectionViewController.m
//  Animal ABCs
//
//  Created by Sara Hender on 06/05/2016.
//
//
#import "ViewController.h"
#import "Utils.h"
#import "CollectionViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface CollectionViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, retain) UICollectionView *collectionView;
@property (nonatomic, retain) NSMutableArray *results;

@end

@implementation CollectionViewController

NSMutableArray *arrayNames;
NSMutableArray *arrayLetters;
NSMutableArray *arrayLetter;
NSMutableArray *arrayImages;
NSMutableArray *arrayCredits;
NSMutableArray *arrayAudio;
NSMutableArray *arrayColors;
NSMutableArray *_audioPlayers;

@synthesize collectionView = _collectionView;
@synthesize results = _results;


- (id)init
{
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"0");
    if (self = [super init]) {
        NSLog(@"1");
    }
    
    UIView *view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = view;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(400, 400);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    
    self.results = [NSMutableArray array];
    
    for(int i=0; i<26; i++){
        NSString *fullpath = @"";/*[[[NSBundle mainBundle] bundlePath] stringByAppendingString:[NSString stringWithFormat:@"/%@", arrayImages[i]]];
                                  UIImage *image = [UIImage imageWithContentsOfFile:fullpath];*/
        [self.results addObject:fullpath/*image*/];
    }
    [self.view addSubview:self.collectionView];
    //[self.collectionView reloadData];
    
    return self;
}


/*
-(void)turkey{
    NSLog(@"%s", __FUNCTION__);
 
    UIView *view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = view;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(400, 400);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;

    
    self.results = [NSMutableArray array];
    
    for(int i=0; i<26; i++){
        NSString *fullpath = @"";/ *[[[NSBundle mainBundle] bundlePath] stringByAppendingString:[NSString stringWithFormat:@"/%@", arrayImages[i]]];
        UIImage *image = [UIImage imageWithContentsOfFile:fullpath];* /
        [self.results addObject:fullpath/ *image* /];
    }
    [self.view addSubview:self.collectionView];
    //[self.collectionView reloadData];
}
*/

- (void)viewDidLoad {
    NSLog(@"%s", __FUNCTION__);
    
    [super viewDidLoad];
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"numberOfItemsInSection %lu", (unsigned long)[self.results count]);
    return [self.results count];
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    NSLog(@"%s", __FUNCTION__);
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s", __FUNCTION__);
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [Utils colorWithHexString:arrayColors[indexPath.item]];
    cell.contentMode = UIViewContentModeScaleAspectFit;
    cell.clipsToBounds = true;

    NSLog(@"%@", indexPath);
    NSLog(@"%ld", (long)indexPath.item);
    
    //self.results[indexPath.item];
    
    
    NSString *fullpath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:[NSString stringWithFormat:@"/%@", arrayImages[indexPath.item] ]];
    UIImage *loadImage = [UIImage imageWithContentsOfFile:fullpath];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:loadImage];
    
    //set contentMode to scale aspect to fit
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    //change width of frame
    CGRect frame = imageView.frame;
    frame.size.width = 400;
    frame.size.height = 400;
    imageView.frame = frame;
    
    UILabel *label = [UILabel new];
    label.text = arrayLetter[indexPath.item];
    
    UIColor* grey70 = [UIColor colorWithWhite: 1.0 alpha:0.45];
    CGSize textSize = [label.text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Courier" size:150]}];
    label.frame = CGRectMake(0, 0, 400, 400);
    label.backgroundColor = grey70;
    label.textColor = [UIColor blackColor];
    label.highlightedTextColor = [UIColor blackColor];
    label.font = [UIFont fontWithName:@"Courier" size:textSize.height];
    label.textAlignment = NSTextAlignmentCenter;
    label.adjustsFontSizeToFitWidth = YES;
    
    //Add image view
    [cell addSubview:imageView];
    [cell addSubview:label];
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s", __FUNCTION__);
    // If you need to use the touched cell, you can retrieve it like so
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    NSLog(@"touched cell %@ at indexPath %@", cell, indexPath);
    NSLog(@"indexPath: %ld",(long)indexPath.item);
    
    //[self.navigationController pushViewController:self.view animated:YES];
    ViewController *vc = [[ViewController alloc] init];
    vc.arrayIndex = indexPath.item;
    
    [self presentViewController:vc animated:YES completion:nil];
}

/*
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    UIImage *image = [self.results objectAtIndex:indexPath.row];
    return CGSizeMake(150, 150);
}
*/
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    NSLog(@"%s", __FUNCTION__);
    return UIEdgeInsetsMake(50, 20, 50, 20);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    // call the following function when the sound is no longer used
    // (must be done AFTER the sound is done playing)
    //AudioServicesDisposeSystemSoundID(audioEffect);
    
}

@end
