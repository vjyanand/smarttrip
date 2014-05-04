//
//  FinishCreatingViewController.h
//  SmartTrip
//
//  Created by George on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TripDetails.h"
@interface FinishCreatingViewController : UIViewController
@property (nonatomic, strong) NSMutableDictionary *friend_list;
@property (nonatomic, strong) TripDetails *tripDetail;
@property (nonatomic, strong) NSString *final_budget;
@end
