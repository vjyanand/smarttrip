//
//  FriendsTableViewCell.h
//  SmartTrip
//
//  Created by George on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendsTableViewCell : UITableViewCell


@property (nonatomic, strong) UITextView *username;
@property (nonatomic, strong) UITextView *name;
@property (nonatomic, strong) NSString  *fbuid;
@property (nonatomic, strong) UIImageView *check_mark;
@property (nonatomic, strong) UIImageView *profile_picture_image_view;
@end
