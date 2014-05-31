//
//  TicketToRidePlayer.h
//  TTRCounter
//
//  Created by Mattias Jähnke on 29/01/14.
//  Copyright (c) 2014 Mattias Jähnke. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    PlayerColorBlue,
    PlayerColorRed,
    PlayerColorBlack,
    PlayerColorYellow,
    PlayerColorGreen,
    PlayerColorSpecial
} PlayerColor;

@interface TicketToRidePlayer : NSObject

- (void)setPlayerColor:(PlayerColor)color;

// Player properties
@property (nonatomic, readonly) UIColor *color;
@property (nonatomic, copy) NSString *name;

// Read only
@property (nonatomic, readonly) NSMutableArray *trainArray;

@end
