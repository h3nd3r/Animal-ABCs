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
//CGSize portraitCellSize;
//CGSize landscapeCellSize;

- (id)init
{
    NSLog(@"hi: %s", __FUNCTION__);
    NSLog(@"0");
    if (self = [super init]) {
        NSLog(@"1");
    }

    _width = [UIScreen mainScreen].bounds.size.width;
    _height = [UIScreen mainScreen].bounds.size.height;

    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor blackColor];
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = [Utils cellSize];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    CGFloat temp = (_width - flowLayout.itemSize.width*3)/6;
    NSLog(@"my WIDTH: %f", temp);
    [flowLayout setSectionInset:UIEdgeInsetsMake(temp, temp, temp, temp)];
    flowLayout.minimumLineSpacing = temp*2;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    [self.collectionView registerClass:[SpecialCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
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
        UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    flowLayout.itemSize = [Utils cellSize];
    CGFloat temp = (_width - flowLayout.itemSize.width*3)/6;
    NSLog(@"my WIDTH: %f", temp);
    [flowLayout setSectionInset:UIEdgeInsetsMake(temp, temp, temp, temp)];
    flowLayout.minimumLineSpacing = temp*2;
    
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

    _width = [UIScreen mainScreen].bounds.size.width;
    _height = [UIScreen mainScreen].bounds.size.height;
    
    CGSize cellSize = [Utils cellSize];
    
    
    cell.backgroundColor = [Utils colorWithHexString:_utils.arrayColors[indexPath.item]];
    cell.contentMode = UIViewContentModeScaleAspectFit;
    cell.clipsToBounds = true;
    
    NSLog(@"%@", indexPath);
    NSLog(@"%ld", (long)indexPath.item);
    
    NSString *fullpath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:[NSString stringWithFormat:@"/%@", _utils.arraySmallImages[indexPath.item] ]];
    UIImage *loadImage = [UIImage imageWithContentsOfFile:fullpath];

    NSLog(@"%@", fullpath);

    cell.imageView.frame = CGRectMake(0,0, cellSize.width, cellSize.height);
    cell.imageView.image = loadImage;
    
    cell.label.text = _utils.arrayLetter[indexPath.item];
    cell.label.frame = CGRectMake(0,0, cellSize.width, cellSize.height);
    cell.label.textAlignment = NSTextAlignmentCenter;
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
    vc.arrayIndex = (int)indexPath.item;
    
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
    layout.itemSize = [Utils cellSize];//(size.width < size.height) ? landscapeCellSize : portraitCellSize;
    
    // this call causes dodgey errors
    [self.collectionView reloadData];
    
    // so does this
    //[self.collectionView reloadItemsAtIndexPaths:[self.collectionView indexPathsForVisibleItems]];
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
