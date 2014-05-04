//
//  TripDetails.h
//  SmartTrip
//
//  Created by Isabel Barrera on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TripBudget.h"

//Describes the model for a TripDetail Object
@interface TripDetails : NSObject

@property (nonatomic, strong) NSString *destination;
@property (nonatomic, strong) NSDate   *tripStart;
@property (nonatomic, strong) NSNumber *tripLength;
@property (nonatomic, strong) TripBudget *budget;
@property (nonatomic, strong) NSArray *tripFriends;
@property (nonatomic, strong) NSString *UUID;


- (void)fetchExpenses;

@end
