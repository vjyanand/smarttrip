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
    
    if (self) {        
        if (!self.amountSpent) {
            self.amountSpent = [[NSNumber alloc] initWithInt:0];
        }
        
       
        self.spendingCategories = [[NSMutableArray alloc] init];
        CategoryBudget *budget = [[CategoryBudget alloc] init];
        budget.categoryName = @"Entertainment";
        [self.spendingCategories addObject:budget];
        CategoryBudget *otherBudget = [[CategoryBudget alloc] init];
        otherBudget.categoryName = @"Nightlife";
        [self.spendingCategories addObject:otherBudget];
        CategoryBudget *lastBudget = [[CategoryBudget alloc] init];
        lastBudget.categoryName = @"Shopping";
        [self.spendingCategories addObject:lastBudget];
        
        if (!) {
            <#statements#>
        }

    }else{
        return nil;
    }
    
    return self;
}

- (int)getRemainingBudget
{
        double difference = [self.totalBudget intValue] - [self.amountSpent intValue];
        return difference;
}

- (NSString *)getRemaningBudgetString
{
    return [NSString stringWithFormat:@"$ %i", (int)[self getRemainingBudget]];
}

- (void)addExpense:(Expense *)expense
{
    if (!self.expenseList) {
        self.expenseList = [[NSMutableArray alloc] init];
    }
    
    [self.expenseList addObject:expense];
    [self updateAmountSpent];
}

- (void)updateAmountSpent
{
    int amountSpent = 0;
    
    for (Expense *expense in self.expenseList) {
        int expenseAmount = [expense.amount intValue];
        amountSpent += expenseAmount;
    }
    
    self.amountSpent = [NSNumber numberWithInt:amountSpent];
}

@end


