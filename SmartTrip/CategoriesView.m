//
//  CategoriesView.m
//  SmartTrip
//
//  Created by George on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import "CategoriesView.h"

@implementation CategoriesView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}
-(id)initWithSpecials:(CGRect)frame initWithTitle:(NSString *)title{
    self = [super init];
    if (self) {
        
        
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        
        // Initialization code
        self.frame = frame;
        self.title = [[UILabel alloc] initWithFrame:frame];
        self.title.text = title;
        self.title.backgroundColor = [UIColor clearColor];
        
        self.title.font = [UIFont fontWithName:@"AvenirNext-UltraLight" size:18.0f];
        
        CGRect slider_frame = frame;
        slider_frame.origin.y += 30;
        slider_frame.size.width -= 40;
        //slider_frame.origin.x += 20;
        self.slider = [[UISlider alloc] initWithFrame:slider_frame];
        
        CGRect price_frame = frame;
        price_frame.origin.x = screenWidth-50;
        self.price = [[UILabel alloc] initWithFrame:price_frame];
        self.price.text = @"0";
        self.price.font = [UIFont fontWithName:@"AvenirNext-UltraLight" size:18.0f];
    }
    return self;
    
}
- (id)init
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    return [self initWithSpecials:CGRectMake(0, 0, screenWidth, screenHeight) initWithTitle:@"Expenses"];
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
