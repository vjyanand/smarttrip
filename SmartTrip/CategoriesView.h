//
//  CategoriesView.h
//  SmartTrip
//
//  Created by George on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoriesView : UIView

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UILabel *price;
-(id)initWithSpecials:(CGRect)frame initWithTitle:(NSString *)title;

@end
