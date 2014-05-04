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
        budget.categoryBudget = [NSNumber numberWithInt:200];
        [self.spendingCategories addObject:budget];
        CategoryBudget *otherBudget = [[CategoryBudget alloc] init];
        otherBudget.categoryName = @"Nightlife";
        otherBudget.categoryBudget = [NSNumber numberWithInt:300];
        [self.spendingCategories addObject:otherBudget];
        CategoryBudget *lastBudget = [[CategoryBudget alloc] init];
        lastBudget.categoryName = @"Shopping";
        lastBudget.categoryBudget = [NSNumber numberWithInt:100];
        [self.spendingCategories addObject:lastBudget];
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

- (void)updateCategoryAmountSpentWithName:(NSString *)categoryName andAmount:(NSNumber *)amount
{
    for (int i=0; i < self.spendingCategories.count; i++) {
        if ([[[self.spendingCategories objectAtIndex:i] categoryName] isEqualToString:categoryName  ] ) {
            
            CategoryBudget *spendingCategory = [self.spendingCategories objectAtIndex:i];
            NSNumber *oldAmount = spendingCategory.categoryAmountSpent;
            int newAmount = [oldAmount intValue] + [amount intValue];
            spendingCategory.categoryAmountSpent = [NSNumber numberWithInt:newAmount];
            break;
        }
    }
    
}


@end


