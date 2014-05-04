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
            
            if ([expense valueForKey:@"VendorDescription"] &&  [expense valueForKey:@"VendorDescription"] != [NSNull null] && [expense valueForKey:@"TransactionAmount"] &&[expense valueForKey:@"TransactionDate"]) {
                Expense *currentExpense = [Expense new];
                currentExpense.category = [expense valueForKey:@"VendorDescription"];
                currentExpense.amount = [expense valueForKey:@"TransactionAmount"];
                currentExpense.dateAndTime = [expense valueForKey:@"TransactionDate"];
                [mutableExpenseList addObject:currentExpense];
                
                if (self.budget) {
                    [self.budget updateCategoryAmountSpentWithName:currentExpense.category andAmount:currentExpense.amount];
                }
            }
        }
    }];
        
    if (self.budget) {
        self.budget.expenseList = mutableExpenseList;
        [self.budget updateAmountSpent];
    }
}


@end
