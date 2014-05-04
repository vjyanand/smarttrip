//
//  TripViewController.m
//  SmartTrip
//
//  Created by Isabel Barrera on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import "TripViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "FriendData.h"

NSInteger const kbarHeight = 45;

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
            self.tripDetails.destination = @"New York, NY";
            self.tripDetails.tripStart = [NSDate date];
            self.tripDetails.tripLength = [[NSNumber alloc] initWithInt:7];
            self.tripDetails.tripFriends = [[NSArray alloc] initWithObjects: @"10152415181973679", nil];
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
    
    if (self.tripDetails.tripFriends.count > 0) {
        [self getFBUserData];
    }
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    self.scrollView.backgroundColor = [UIColor whiteColor];
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height - kbarHeight)];
    [self.scrollView setPagingEnabled:YES];
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width, 0)];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    
    self.tripView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
   
    UIImageView *imageBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"newyork3.jpg"]];
    imageBackground.frame = CGRectMake(0, 0, self.tripView.frame.size.width, self.tripView.frame.size.height);
    imageBackground.contentMode = UIViewContentModeScaleAspectFill;
    imageBackground.layer.masksToBounds = YES;
    [self.tripView addSubview:imageBackground];
    
    
    UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 100, 50, 200, 50)];
    header.text = @"Current Trip";
    header.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:25.0];
    header.backgroundColor = [UIColor clearColor];
    header.textColor = [UIColor blackColor];
    header.textAlignment = NSTextAlignmentCenter;
    
    [self.tripView addSubview:header];
    
    UILabel *destination = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 100, 120, 200, 50)];
    destination.text = self.tripDetails.destination;
    destination.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:30.0];
    destination.backgroundColor = [UIColor clearColor];
    destination.textColor = [UIColor whiteColor];
    destination.textAlignment = NSTextAlignmentCenter;
    
    [self.tripView addSubview:destination];
    
    UILabel *remainingBudget = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 100, 200, 200, 50)];
    remainingBudget.text = @"Remaining Budget";
    remainingBudget.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:15.0];
    remainingBudget.backgroundColor = [UIColor clearColor];
    remainingBudget.textColor = [UIColor blackColor];
    remainingBudget.textAlignment = NSTextAlignmentCenter;
    
    [self.tripView addSubview:remainingBudget];
    
    UILabel *budget = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tripView.frame.size.width, 60)];
    budget.center = self.view.center;
    budget.text = [self.tripDetails.budget getRemaningBudgetString];;
    budget.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:30.0];
    budget.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    budget.textColor = [UIColor blackColor];
    budget.textAlignment = NSTextAlignmentCenter;
    
    [self.tripView addSubview:budget];
    int viewWidth = (int)self.tripDetails.tripFriends.count*80;
    
    UIView *imageViewContainer = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - viewWidth/2, budget.frame.origin.y + 100, viewWidth, 100)];
    
    for (int i = 0; i < self.friendInfo.count; i++) {
        FriendData *friendData = self.friendInfo[i];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:friendData.profileImage];
        imageView.frame = CGRectMake(80*i, 0, 80, 80);
        [imageView.layer setCornerRadius:40.0];
        [imageView.layer setMasksToBounds:YES];
        
        UILabel *friendName = [[UILabel alloc] initWithFrame:CGRectMake(80*i, 80, 80, 20)];
        friendName.text = friendData.firstName;
        friendName.textAlignment = NSTextAlignmentCenter;
        friendName.backgroundColor = [UIColor clearColor];
        friendName.font = [UIFont fontWithName:@"HelveticaNeue" size:15.0];
        friendName.textColor = [UIColor whiteColor];
        
        [imageViewContainer addSubview:imageView];
        [imageViewContainer addSubview:friendName];
    }
    
    UIButton *addExpense = [UIButton buttonWithType:UIButtonTypeCustom];
    addExpense.frame = CGRectMake(self.view.frame.size.width/2 - 75, imageViewContainer.frame.origin.y + 130, 150, 50);
    addExpense.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    [addExpense setTitle:@"Add Expense" forState:UIControlStateNormal];
    [addExpense setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.tripView addSubview:addExpense];
    [self.tripView addSubview:imageViewContainer];
    [self.scrollView addSubview:self.tripView];
    [self.view addSubview:self.scrollView];
    [self.view setNeedsDisplay];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getFBUserData
{
//    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
//                            NO, @"redirect",
//                            @"200", @"height",
//                            @"normal", @"type",
//                            @"200", @"width",
//                            nil
//                            ];
//    
//    /* make the FB API call */
//    [FBRequestConnection startWithGraphPath:@"/10152415181973679/picture"
//                                 parameters:params
//                                 HTTPMethod:@"GET"
//                          completionHandler:^(
//                                              FBRequestConnection *connection,
//                                              id result,
//                                              NSError *error
//                                              ) {
//                              /* handle the result */
//                              self.friendData = [[NSDictionary alloc] initWithDictionary:result];
//                              NSLog(@"%@", result);
//                              NSLog(@"%@", error);
//                          }];
    NSString *base  =@"http://graph.facebook.com/";
    self.friendInfo = [[NSMutableArray alloc] init];
    
    for (NSString *userid in self.tripDetails.tripFriends) {
        base = [base stringByAppendingString:userid];
        base = [base stringByAppendingString:@"/picture?width=200&height=200"];
        base = [base stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        NSURL *url = [NSURL URLWithString:base];
        FriendData *friendData = [[FriendData alloc] init];
        friendData.profileImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        friendData.firstName = @"Isabel";
        
        [self.friendInfo addObject:friendData];
    }
    
}

@end
