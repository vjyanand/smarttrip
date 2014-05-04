//
//  FriendsTableViewCell.m
//  SmartTrip
//
//  Created by George on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import "FriendsTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation FriendsTableViewCell
@synthesize username, name, check_mark, profile_picture_image_view, fbuid;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        
        name = [[UITextView alloc] initWithFrame:CGRectMake(80, 5, screenWidth, 30)];
        name.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16.0f];
        name.userInteractionEnabled = NO;
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(80, 45, self.bounds.size.width-80, 1)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        lineView.alpha = 0.5;
        
        profile_picture_image_view = [[UIImageView alloc] initWithFrame:CGRectMake(20, 5, 40, 40)];
        
        CALayer *imageLayer = profile_picture_image_view.layer;
        [imageLayer setCornerRadius:40/2];
        [imageLayer setMasksToBounds:YES];
        
        check_mark = [[UIImageView alloc] initWithFrame:CGRectMake(screenWidth-40, 10, 30,25)];
        check_mark.image = [UIImage imageNamed:@"checkmark.jpg"];
        check_mark.hidden = YES;
        
        [self addSubview:name];
        [self addSubview:profile_picture_image_view];
        
        [self addSubview:lineView];
        
        [self addSubview:check_mark];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
