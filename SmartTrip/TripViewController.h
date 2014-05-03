//
//  TripViewController.h
//  SmartTrip
//
//  Created by Isabel Barrera on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TripDetails.h"

@interface TripViewController : UIViewController

@property (nonatomic, strong) TripDetails *tripDetails;
@property (nonatomic, strong) UIScrollView *scrollView;

- (id)initWithTripDetails:(TripDetails *)details;


@end
