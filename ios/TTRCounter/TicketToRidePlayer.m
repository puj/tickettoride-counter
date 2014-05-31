//
//  TicketToRidePlayer.m
//  TTRCounter
//
//  Created by Mattias Jähnke on 29/01/14.
//  Copyright (c) 2014 Mattias Jähnke. All rights reserved.
//

#import "TicketToRidePlayer.h"

@implementation TicketToRidePlayer {
    PlayerColor _color;
}

- (id)init {
    if (self = [super init]) {
        _trainArray = [NSMutableArray array];
    }
    return self;
}

- (void)setPlayerColor:(PlayerColor)color {
    _color = color;
}

- (UIColor *)color {
    switch (_color) {
        case PlayerColorBlack:
            return [UIColor blackColor];
        case PlayerColorBlue:
            return [UIColor blueColor];
        case PlayerColorGreen:
            return [UIColor greenColor];
        case PlayerColorRed:
            return [UIColor redColor];
        case PlayerColorSpecial:
            return [UIColor orangeColor];
        case PlayerColorYellow:
            return [UIColor yellowColor];
        default:
            return [UIColor purpleColor];
            assert(NO);
    }
}

@end
