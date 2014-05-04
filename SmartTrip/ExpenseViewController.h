//
//  ExpenseViewController.h
//  SmartTrip
//
//  Created by Isabel Barrera on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TripDetails.h"
#import "Expense.h"

@protocol ExpenseViewControllerDelegate <NSObject>

@required
- (void)didFinishAddingExpense:(Expense *)expense;
@end

@interface ExpenseViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) UIPickerView *picker;
@property (nonatomic, strong) TripDetails *tripDetails;
@property (nonatomic, retain) id <ExpenseViewControllerDelegate> delegate;


- (id)initWithTripDetails:(TripDetails *)details;


@end
