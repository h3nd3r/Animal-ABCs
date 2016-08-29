//
//  CollectionViewController.m
//  Animal ABCs
//
//  Created by Sara Hender on 06/05/2016.
//
//
#import "ViewController.h"
#import "SpecialCollectionViewCell.h"
#import "Utils.h"
#import "CollectionViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@implementation CollectionViewController

@synthesize collectionView = _collectionView;
@synthesize results = _results;
Utils *_utils;
CGFloat _width;
CGFloat _height;
CGSize portraitCellSize;
CGSize landscapeCellSize;

- (id)init
{
    NSLog(@"hi: %s", __FUNCTION__);
    NSLog(@"0");
    if (self = [super init]) {
        NSLog(@"1");
    }

    _width = [UIScreen mainScreen].bounds.size.width;
    _height = [UIScreen mainScreen].bounds.size.height;
    
    portraitCellSize = CGSizeMake( (_width - _width/10)/3 , (_height - _height/10)/3);
    landscapeCellSize = CGSizeMake(portraitCellSize.height, portraitCellSize.width);
    CGFloat temp = (_width - portraitCellSize.width*3)/6;
    
    NSLog(@"my WIDTH: %f", temp);
    UIView *view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];//view;
    self.view.backgroundColor = [UIColor blackColor];
/*
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    _collectionView=[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
  */  
    
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = portraitCellSize;
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayout setSectionInset:UIEdgeInsetsMake(temp, temp, temp, temp)];
    
    //flowLayout.sectionInset = UIEdgeInsetsMake(topMargin, left, bottom, right);
    //flowLayout.minimumInteritemSpacing = temp;
    flowLayout.minimumLineSpacing = temp*2;
    
    
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    [self.collectionView registerClass:[SpecialCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    //self.collectionView.
    self.collectionView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin);
    
    self.results = [NSMutableArray array];
    
    for(int i=0; i<26; i++){
        NSString *fullpath = @"";
        [self.results addObject:fullpath];
    }
    [self.view addSubview:self.collectionView];
    
    return self;
}

- (enum UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    NSLog(@"%s", __FUNCTION__);
    return UIInterfaceOrientationMaskAll;
}

- (BOOL)shouldAutorotate {
    NSLog(@"%s", __FUNCTION__);
    return YES;
}

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

- (SpecialCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s", __FUNCTION__);
    SpecialCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [Utils colorWithHexString:_utils.arrayColors[indexPath.item]];
    cell.contentMode = UIViewContentModeScaleAspectFit;
    cell.clipsToBounds = true;
    
    NSLog(@"%@", indexPath);
    NSLog(@"%ld", (long)indexPath.item);
    
    NSString *fullpath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:[NSString stringWithFormat:@"/%@", _utils.arrayImages[indexPath.item] ]];
    UIImage *loadImage = [UIImage imageWithContentsOfFile:fullpath];

    NSLog(@"%@", fullpath);

    cell.imageView.image = loadImage;
    cell.label.text = _utils.arrayLetter[indexPath.item];
    
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

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    NSLog(@"%s", __FUNCTION__);
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [self updateCollectionViewLayoutWithSize:size];
}

- (void)updateCollectionViewLayoutWithSize:(CGSize)size
{
    NSLog(@"%s", __FUNCTION__);
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.itemSize = (size.width < size.height) ? landscapeCellSize : portraitCellSize;
    [layout invalidateLayout];
    //[self.collectionView reloadData];
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
