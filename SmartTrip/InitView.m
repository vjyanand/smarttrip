//
//  InitView.m
//  travel
//
//  Created by George on 2014-05-03.
//  Copyright (c) 2014 iavian. All rights reserved.
//

#import "InitView.h"
#import <FacebookSDK/FacebookSDK.h>


@implementation InitView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        FBLoginView *loginView = [[FBLoginView alloc] init];
        loginView.frame = CGRectOffset(loginView.frame, (self.center.x - (loginView.frame.size.width / 2)), 5);
        CGRect loginViewFrame = loginView.frame;
        loginViewFrame.origin.y = 100;
        loginView.frame = loginViewFrame;
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:loginView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end