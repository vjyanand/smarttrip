//
//  TripBudget.m
//  SmartTrip
//
//  Created by Isabel Barrera on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import "TripBudget.h"
#import "CategoryBudget.h"


@interface TripBudget()

@end

@implementation TripBudget

- (id)init
{
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    return self;
}

- (double)getRemainingBudget
{
    if (self.totalBudget && self.amountSpent) {
        double difference = [self.totalBudget doubleValue] - [self.amountSpent doubleValue];
        return difference;
    } else {
        return 0.0;
    }
}

@end


