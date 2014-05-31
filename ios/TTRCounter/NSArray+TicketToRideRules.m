//
//  NSArray+TicketToRideRules.m
//  TTRCounter
//
//  Created by Mattias Jähnke on 29/01/14.
//  Copyright (c) 2014 Mattias Jähnke. All rights reserved.
//

#import "NSArray+TicketToRideRules.h"

static int _ttrRulesTrainValues[6] = {1, 2, 4, 7, 10, 15};
static int _ttrRulesTrainPoolCount = 45;

@implementation NSArray (TicketToRideRules)

- (NSNumber *)numberOfTrains {
    return @(self.count);
}

- (NSNumber *)numberOfCars {
    int cars = 0;
    for (int i = 0; i < self.count; i++) {
        cars += [self[i] intValue];
    }
    return @(cars);
}

- (NSNumber *)ticketToRidePoints {
    int points = 0;
    for (int i = 0; i < self.count; i++) {
        points += _ttrRulesTrainValues[[self[i] intValue] - 1];
    }
    return @(points);
}

- (NSNumber *)carsLeft {
    return @(_ttrRulesTrainPoolCount - [self.numberOfCars intValue]);
}

@end
