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
#import "ExpenseViewController.h"
#import "CategoryBudget.h"

NSInteger const kbarHeight = 20;

@interface TripViewController () 

@property (nonatomic, strong) UIView *tripView;
@property (nonatomic, strong) UIView *tripProgressView;
@property (nonatomic, strong) UIView *recieptView;
@property (nonatomic, strong) UIScrollView *userProgressView;
@property (nonatomic, strong) UILabel *budget;

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
        
        [self.tripDetails fetchExpenses];
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
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
//    self.scrollView.backgroundColor = [UIColor redColor];
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height)];
    [self.scrollView setPagingEnabled:YES];
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setBounces:NO];
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width, kbarHeight)];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    [self.scrollView setShowsVerticalScrollIndicator:NO];
    
    NSLog(@"%f",self.scrollView.frame.size.height);
    
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
    
    self.budget = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tripView.frame.size.width, 60)];
    self.budget.center = self.view.center;
    self.budget.text = [self.tripDetails.budget getRemaningBudgetString];
    self.budget.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:30.0];
    self.budget.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    self.budget.textColor = [UIColor blackColor];
    self.budget.textAlignment = NSTextAlignmentCenter;
    
    [self.tripView addSubview:self.budget];
    int viewWidth = (int)self.tripDetails.tripFriends.count*80;
    
    UIView *imageViewContainer = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - viewWidth/2, self.budget.frame.origin.y + 100, viewWidth, 100)];
    
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
    [addExpense addTarget:self action:@selector(addExpense:) forControlEvents:UIControlEventTouchUpInside];
    
    self.userProgressView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.userProgressView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + self.tripDetails.budget.spendingCategories.count*50 + 20)];
    self.userProgressView.showsVerticalScrollIndicator = YES;
    
    UILabel *headerUserView = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 50)];
    headerUserView.text = @"Your Progress";
    headerUserView.textAlignment = NSTextAlignmentCenter;
    
    [self.userProgressView addSubview:headerUserView];
    
    int count = 0;

    for (CategoryBudget *category in self.tripDetails.budget.spendingCategories) {
        UIView *categoryView = [[UIView alloc] initWithFrame:CGRectMake(0, count*140 + 80, self.view.frame.size.width, 120)];
        UILabel *categoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 150,  10, 300, 20)];
        categoryLabel.textAlignment = NSTextAlignmentLeft;

        categoryLabel.text = category.categoryName;
        categoryLabel.textColor = [UIColor colorWithRed:144.0/255.0 green:206.0/255.0 blue:221.0/255.0 alpha:1];
        [categoryView addSubview:categoryLabel];
        
        UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
        progressView.frame = CGRectMake(0, 40, self.view.frame.size.width, 2);
        float progress = [category.categoryAmountSpent floatValue]/[category.categoryBudget floatValue];
        [progressView setProgress:progress];
        [categoryView addSubview:progressView];
        [self.userProgressView addSubview:categoryView];
        
        count++;
    }
    
    [self.tripView addSubview:addExpense];
    [self.tripView addSubview:imageViewContainer];
    [self.scrollView addSubview:self.tripView];
    [self.scrollView addSubview:self.userProgressView];
    
    self.recieptView = [[UIView alloc] initWithFrame:CGRectMake(2 * self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
    UILabel *header1 = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 100, 50, 200, 50)];
    header1.text = @"Expense Receipt";
    header1.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:25.0];
    header1.backgroundColor = [UIColor clearColor];
    header1.textColor = [UIColor blackColor];
    header1.textAlignment = NSTextAlignmentCenter;
    
    [self.recieptView addSubview:header1];
    
    UILabel *destination1 = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 100, 120, 200, 50)];
    destination1.text = self.tripDetails.destination;
    destination1.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:30.0];
    destination1.backgroundColor = [UIColor clearColor];
    destination1.textColor = [UIColor whiteColor];
    destination1.textAlignment = NSTextAlignmentCenter;
    [self.recieptView addSubview:destination1];
    
    UILabel *recepitDate = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 100, 120, 200, 50)];
    recepitDate.text = @"April 29th, 2014";
    recepitDate.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:30.0];
    recepitDate.backgroundColor = [UIColor clearColor];
    recepitDate.textColor = [UIColor grayColor];
    recepitDate.adjustsFontSizeToFitWidth = YES;
    destination1.textAlignment = NSTextAlignmentCenter;
    [self.recieptView addSubview:recepitDate];
    
    NSLog(@"%@", self.tripDetails);
    
   // UILabel
    UIWebView *attributedLabel = [[UIWebView alloc] initWithFrame:CGRectMake(10, recepitDate.frame.origin.y + 70, self.view.frame.size.width - 20, self.view.frame.size.height-10-recepitDate.frame.origin.y)];
    
    NSString *pathFile = [[NSBundle mainBundle] bundlePath];
    NSString *path = [[NSString alloc] initWithString:[pathFile stringByAppendingPathComponent:@"html.html"]];
    NSString *txtFileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    [attributedLabel loadHTMLString:txtFileContents baseURL:nil];
    
    [_recieptView addSubview:attributedLabel];
    
    
    _recieptView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:_recieptView];
    
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

    NSString *baseURL = @"http://graph.facebook.com/";
    self.friendInfo = [[NSMutableArray alloc] init];
    
    for (NSString *userid in self.tripDetails.tripFriends) {
        NSString *base = [baseURL stringByAppendingString:userid];
        base = [base stringByAppendingString:@"/picture?width=200&height=200"];
        base = [base stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        NSURL *url = [NSURL URLWithString:base];
        FriendData *friendData = [[FriendData alloc] init];
        friendData.profileImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        
        NSURL *dataUrl = [NSURL URLWithString:[baseURL stringByAppendingString:userid]];
        NSData *data = [NSData dataWithContentsOfURL:dataUrl];
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        NSLog(@"%@", dictionary);
        friendData.firstName = [dictionary objectForKey:@"first_name"];
        friendData.lastName = [dictionary objectForKey:@"last_name"];
        
        [self.friendInfo addObject:friendData];
    }
    
}

- (void)addExpense:(id)sender {
    ExpenseViewController *expenseVC = [[ExpenseViewController alloc] initWithTripDetails:self.tripDetails];
    expenseVC.delegate = self;
    //expenseVC.view.backgroundColor = [UIColor clearColor];
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    self.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    //self.modalPresentationStyle = UIModalPresentationCurrentContext;
    
    [self presentViewController:expenseVC animated:YES completion:nil];
}

#pragma mark - ExpenseViewControllerDelegate Methods
- (void)didFinishAddingExpense:(Expense *)expense
{
    [self.tripDetails.budget addExpense:expense];
    self.budget.text = [self.tripDetails.budget getRemaningBudgetString];
}

@end
