//
//  TripBudget.h
//  SmartTrip
//
//  Created by Isabel Barrera on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TripBudget : NSObject
@property (nonatomic, strong) NSNumber *totalBudget;

//How much of the budget have they spent
@property (nonatomic, strong) NSNumber *amountSpent;

@property (nonatomic, strong) NSArray *spendingCategories;
//FB friends on the budget
@property (nonatomic, strong) NSArray *budgetContributors;

-(NSString *)getRemaningBudgetString;

@end
