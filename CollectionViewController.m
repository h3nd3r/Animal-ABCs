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

- (id)init
{
    NSLog(@"hi: %s", __FUNCTION__);
    NSLog(@"0");
    if (self = [super init]) {
        NSLog(@"1");
    }
    
    UIView *view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = view;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(450, 400);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    [self.collectionView registerClass:[SpecialCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    
    self.results = [NSMutableArray array];
    
    for(int i=0; i<26; i++){
        NSString *fullpath = @"";
        [self.results addObject:fullpath];
    }
    [self.view addSubview:self.collectionView];
    
    return self;
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
