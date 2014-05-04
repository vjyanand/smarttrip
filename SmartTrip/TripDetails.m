//
//  TripDetails.m
//  SmartTrip
//
//  Created by Isabel Barrera on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import "TripDetails.h"
#import "ExpenseHelper.h"

@implementation TripDetails

- (id)init
{
    self = [super init];
    
    if (self) {
        self.UUID = [[NSUUID UUID] UUIDString];
    }
    return self;
}


- (NSString *)getTotalBudgetString
{
    NSString *budgetString = [NSString stringWithFormat:@"$ %i", (int)[self.budget.totalBudget integerValue]];
    return budgetString;
}

- (void)fetchExpenses
{
    NSMutableArray *mutableExpenseList = [[NSMutableArray alloc] init];
    
    ExpenseHelper *helper = [ExpenseHelper sharedEverNoteHelper];
    [helper getExpenses:self completion:^(NSError *error, NSArray *expenseList){
        for (int i = 0; i < expenseList.count; i++) {
            NSDictionary *expense = expenseList[i];
            Expense *currentExpense = [Expense new];
            
            if ([expense valueForKey:@"VendorDescription"]) {
                currentExpense.category = [expense valueForKey:@"VendorDescription"];
            }
            
            if ([expense valueForKey:@"TransactionAmount"]) {
                currentExpense.amount = [expense valueForKey:@"TransactionAmount"];
            }
            
            if ([expense valueForKey:@"TransactionDate"]) {
                currentExpense.dateAndTime = [expense valueForKey:@"TransactionDate"];
            }
            
            [mutableExpenseList addObject:currentExpense];
        }
    }];
        
    if (self.budget) {
        self.budget.expenseList = mutableExpenseList;
        [self.budget updateAmountSpent];
    }
}


@end
