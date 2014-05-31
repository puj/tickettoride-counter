//
//  SingleplayerViewController.h
//  TTRCounter
//
//  Created by Mattias Jähnke on 29/01/14.
//  Copyright (c) 2014 Mattias Jähnke. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TicketToRidePlayer;

@interface SingleplayerViewController : UIViewController

@property (nonatomic, readonly) TicketToRidePlayer *player;

- (void)updateUI;

@end
