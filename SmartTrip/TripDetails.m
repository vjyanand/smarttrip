//
//  TripDetails.m
//  SmartTrip
//
//  Created by Isabel Barrera on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import "TripDetails.h"

@implementation TripDetails

- (id)init
{
    self = [super init];
    
    if (self) {
        //do shit
        
    }
    
    return self;
}


- (NSString *)getTotalBudgetString
{
    NSString *budgetString = [NSString stringWithFormat:@"$ %i", (int)[self.budget.totalBudget integerValue]];
    return budgetString;
}


@end
