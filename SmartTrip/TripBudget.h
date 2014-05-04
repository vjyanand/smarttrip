//
//  TripBudget.h
//  SmartTrip
//
//  Created by Isabel Barrera on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Expense.h"

@interface TripBudget : NSObject
@property (nonatomic, strong) NSNumber *totalBudget;

//How much of the budget have they spent
@property (nonatomic, strong) NSNumber *amountSpent;

@property (nonatomic, strong) NSMutableArray *spendingCategories;
//FB friends on the budget
@property (nonatomic, strong) NSArray *budgetContributors;
@property (nonatomic, strong) NSMutableArray *expenseList;

- (NSString *)getRemaningBudgetString;
- (void)addExpense:(Expense *)expense;

@end
