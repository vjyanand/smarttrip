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

+ (NSNumber *)getRemainingBudget
{
    NSNumber *number = [[NSNumber alloc] initWithInt:1];
    return number;
}

@end


