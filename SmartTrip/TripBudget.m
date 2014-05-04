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
        
        if (!self.amountSpent) {
            self.amountSpent = [[NSNumber alloc] initWithInt:0];
        }
    }
    
    return self;
}

- (double)getRemainingBudget
{
        double difference = [self.totalBudget doubleValue] - [self.amountSpent doubleValue];
        return difference;
}

- (NSString *)getRemaningBudgetString
{
    return [NSString stringWithFormat:@"$ %i", (int)[self getRemainingBudget]];
}

@end


