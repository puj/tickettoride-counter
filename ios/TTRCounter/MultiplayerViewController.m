//
//  ViewController.m
//  TTRCounter
//
//  Created by Mattias Jähnke on 28/01/14.
//  Copyright (c) 2014 Mattias Jähnke. All rights reserved.
//

#import "MultiplayerViewController.h"
#import "NSArray+TicketToRideRules.h"
#import "TicketToRidePlayer.h"
#import "SingleplayerViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MultiplayerViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *players;
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@end

@implementation MultiplayerViewController {
    NSMutableArray *_playerViews;
}

#pragma mark - View life cycle

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:39.0f/255.0f green:39.0f/255.0f blue:39.0f/255.0f alpha:1];
    
    _playerViews = [NSMutableArray array];
    
    [self addPlayerView];
}

- (void)addPlayerView {
    SingleplayerViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"playerController"];
    
    PlayerColor c = (PlayerColor)_playerViews.count;
    [controller.player setPlayerColor:c];
    controller.view.backgroundColor = controller.player.color;
    [controller updateUI];
    
    [_playerViews addObject:controller];
    [_collectionView reloadData];
}

#pragma mark - CollectionView

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _playerViews.count < 5 ? _playerViews.count + 1 : _playerViews.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(320, 380);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(50, 10, 10, 10);
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < _playerViews.count) {
        UICollectionViewCell *playerView = [collectionView dequeueReusableCellWithReuseIdentifier:@"PlayerCell" forIndexPath:indexPath];
        UIViewController *vc = _playerViews[indexPath.row];
        if (playerView.contentView.subviews.count) {
            UIView *lastView = [playerView.contentView subviews][0];
            [lastView removeFromSuperview];
        }
        [playerView.contentView addSubview:vc.view];
        [playerView.contentView setNeedsLayout];
        return playerView;
    } else {
        UICollectionViewCell *addCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AddCell" forIndexPath:indexPath];
        return addCell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= _playerViews.count) {
        UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
        for (UILabel *v in cell.contentView.subviews) {
            if ([v respondsToSelector:@selector(setHighlighted:)])
                v.highlighted = YES;
        }
    }
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= _playerViews.count) {
        UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
        for (UILabel *v in cell.contentView.subviews) {
            if ([v respondsToSelector:@selector(setHighlighted:)])
                v.highlighted = NO;
        }
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= _playerViews.count) {
        [self addPlayerView];
    }
}

@end

