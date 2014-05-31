//
//  SingleplayerViewController.m
//  TTRCounter
//
//  Created by Mattias Jähnke on 29/01/14.
//  Copyright (c) 2014 Mattias Jähnke. All rights reserved.
//

#import "SingleplayerViewController.h"
#import "TicketToRidePlayer.h"
#import "NSArray+TicketToRideRules.h"
#import <QuartzCore/QuartzCore.h>

@interface SingleplayerViewController ()
@property (nonatomic, weak) IBOutlet UILabel *pointsLabel;
@property (nonatomic, weak) IBOutlet UILabel *numberOfCarsLabel;
@property (nonatomic, weak) IBOutlet UILabel *numberOfTrainsLabel;
@end

@implementation SingleplayerViewController

@synthesize player = _player;

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (TicketToRidePlayer *)player {
    if (!_player) {
        _player = [TicketToRidePlayer new];
    }
    return _player;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (UIButton *button in self.view.subviews) {
        if (![button isKindOfClass:[UIButton class]])
            continue;
        button.layer.borderWidth = 1;
        button.layer.borderColor = [UIColor blackColor].CGColor;
        if (button.tag > 0)
            button.backgroundColor = [UIColor whiteColor];
    }
    
    [self updateUI];
}

- (IBAction)addTrain:(id)sender {
    [self.player.trainArray addObject:@(((UIButton *)sender).tag)];
    [self updateUI];
}

- (IBAction)clear:(id)sender {
    [self.player.trainArray removeAllObjects];
    [self updateUI];
}

- (IBAction)undoLastTrain:(id)sender {
    [self.player.trainArray removeLastObject];
    [self updateUI];
}

- (void)updateUI {
    _pointsLabel.text = [NSString stringWithFormat:@"%d Points", [[self.player.trainArray ticketToRidePoints] intValue]];
    _numberOfCarsLabel.text = [NSString stringWithFormat:@"%d Train cars (%d left)", [[self.player.trainArray numberOfCars] intValue], 45 -[[self.player.trainArray numberOfCars] intValue]];
    _numberOfTrainsLabel.text = [NSString stringWithFormat:@"%d Train%@", [[self.player.trainArray numberOfTrains] intValue], [[self.player.trainArray numberOfTrains] intValue] > 1 ? @"s" : @""];
    
    _pointsLabel.textColor = ([self.view.backgroundColor isEqual:[UIColor yellowColor]] || [self.view.backgroundColor isEqual:[UIColor greenColor]] ? [UIColor blackColor] : [UIColor whiteColor]);
    _numberOfCarsLabel.textColor = _pointsLabel.textColor;
    _numberOfTrainsLabel.textColor = _pointsLabel.textColor;
}

@end
