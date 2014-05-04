//
//  ExpenseViewController.h
//  SmartTrip
//
//  Created by Isabel Barrera on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TripDetails.h"

@interface ExpenseViewController : UIViewController

@property (nonatomic, strong) UIPickerView *picker;
@property (nonatomic, strong) TripDetails *tripDetails;

- (id)initWithTripDetails:(TripDetails *)details;


@end
