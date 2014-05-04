//
//  CreateTripViewController.h
//  SmartTrip
//
//  Created by George on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TripDetails.h"
#import "ExpenseViewController.h"

@interface TripViewController : UIViewController <ExpenseViewControllerDelegate>

@property (nonatomic, strong) TripDetails *tripDetails;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImage *friendImage;
@property (nonatomic, strong) NSMutableArray *friendInfo;

- (id)initWithTripDetails:(TripDetails *)details;
@end
