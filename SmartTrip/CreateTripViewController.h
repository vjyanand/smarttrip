//
//  CreateTripViewController.h
//  SmartTrip
//
//  Created by George on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TripDetails.h"
@interface CreateTripViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) TripDetails *tripDetail;
@end
