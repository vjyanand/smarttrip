//
//  TripViewController.m
//  SmartTrip
//
//  Created by Isabel Barrera on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import "TripViewController.h"

NSInteger const kbarHeight = 64;

@interface TripViewController ()

@property (nonatomic, strong) UIView *tripView;
@property (nonatomic, strong) UIView *tripProgressView;
@property (nonatomic, strong) UIView *userProgressView;

@end

@implementation TripViewController

- (id)initWithTripDetails:(TripDetails *)details
{
    self = [super init];
    if (self) {
        
        if (details) {
            self.tripDetails = details;
        } else {
            self.tripDetails = [[TripDetails alloc] init];
            self.tripDetails.destination = @"California";
            self.tripDetails.tripStart = [NSDate date];
            self.tripDetails.tripLength = [[NSNumber alloc] initWithInt:7];
            
            self.tripDetails.budget = [[TripBudget alloc] init];
            
            self.tripDetails.budget.totalBudget = [[NSNumber alloc] initWithInt:2000];
        }
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    self.scrollView.backgroundColor = [UIColor whiteColor];
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height)];
    [self.scrollView setPagingEnabled:YES];
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width, 0)];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    
    self.tripView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    UIGraphicsBeginImageContext(self.tripView.frame.size);
    [[UIImage imageNamed:@"newyork.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.tripView.backgroundColor = [UIColor colorWithPatternImage:image];
    
    
    UITextView *header = [[UITextView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 100, 20, 200, 50)];
    header.text = @"Current Trip";
    header.font = [UIFont fontWithName:@"Helvetica" size:30.0];
    header.backgroundColor = [UIColor clearColor];
//    header.textColor = [UIColor colorWithRed:144 green:206 blue:221 alpha:1.0];
    header.textColor = [UIColor blackColor];
    header.textAlignment = NSTextAlignmentCenter;
    [header setUserInteractionEnabled:NO];
    
    [self.tripView addSubview:header];
    
    [self.scrollView addSubview:self.tripView];
    [self.view addSubview:self.scrollView];
    [self.view setNeedsDisplay];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
