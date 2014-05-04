//
//  FriendData.h
//  SmartTrip
//
//  Created by Isabel Barrera on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendData : NSObject

@property (nonatomic, strong) UIImage *profileImage;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSNumber *amountSpent;

@end
