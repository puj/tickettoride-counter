//
//  NSArray+TicketToRideRules.h
//  TTRCounter
//
//  Created by Mattias Jähnke on 29/01/14.
//  Copyright (c) 2014 Mattias Jähnke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (TicketToRideRules)

- (NSNumber *)numberOfTrains;
- (NSNumber *)numberOfCars;
- (NSNumber *)ticketToRidePoints;
- (NSNumber *)carsLeft;

@end
