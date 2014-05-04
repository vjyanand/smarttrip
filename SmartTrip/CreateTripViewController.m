//
//  CreateTripViewController.m
//  SmartTrip
//
//  Created by George on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import "CreateTripViewController.h"
#import "CreateBudgetViewController.h"
#import "AddFriendsViewController.h"

@interface CreateTripViewController ()

@end

@implementation CreateTripViewController{
    UILabel *longQuestion;
    NSNumber *lengthOfTrip;
    NSDate *dateOfTrip;
    UIDatePicker *leaving;
    NSString *destinationOfTrip;
    UITextField *whereInput;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tripDetail = [[TripDetails alloc] init];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Add A Trip";
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    UILabel *whereQuestion = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, screenWidth, 30)];
    whereQuestion.text = @"Where are you going?";
    whereQuestion.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:19.0f];
    whereQuestion.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:whereQuestion];
    
    whereInput = [[UITextField alloc] initWithFrame:CGRectMake(30, 120, screenWidth-60, 30)];
    whereInput.placeholder = @"E.g. New York City";
    whereInput.delegate = self;
    [self.view addSubview:whereInput];
    
    UILabel *whenQuestion = [[UILabel alloc] initWithFrame:CGRectMake(0, 160, screenWidth, 30)];
    whenQuestion.text = @"When?";
    whenQuestion.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:19.0f];
    whenQuestion.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:whenQuestion];
    
    leaving = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 190, screenWidth, 30)];
    leaving.datePickerMode = UIDatePickerModeDate;
    [self.view addSubview:leaving];
    
    
    UISlider *length = [[UISlider alloc] initWithFrame:CGRectMake(20, 440, screenWidth-40, 30)];
    [self.view addSubview:length];
    
    [length addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    length.minimumValue = 0.0;
    length.maximumValue = 50.0;
    length.continuous = YES;
    length.value = 0.0;
    
    longQuestion = [[UILabel alloc] initWithFrame:CGRectMake(0, 410, screenWidth, 30)];
    
    longQuestion.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:19.0f];
    longQuestion.textAlignment = NSTextAlignmentCenter;
    longQuestion.text = [NSString stringWithFormat:@" Length of stay %d days", (int)length.value];
    [self.view addSubview:longQuestion];
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(clickNext)];
    
    self.navigationItem.rightBarButtonItem = next;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
-(IBAction)sliderAction:(id)sender
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    UISlider *slider = (UISlider*)sender;
    lengthOfTrip = [NSNumber numberWithFloat:slider.value];
    longQuestion.text = [NSString stringWithFormat:@" Length of stay %d days", (int)slider.value];
}
-(void)clickNext{
    self.tripDetail.tripLength = lengthOfTrip;
    
    NSDate *myDate = leaving.date;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd, MM yyy"];
    // NSString *prettyVersion = [dateFormat stringFromDate:myDate];
    
    dateOfTrip = myDate;
    
    self.tripDetail.tripStart = dateOfTrip;
    
    destinationOfTrip = whereInput.text;
    self.tripDetail.destination = destinationOfTrip;
    
    //CreateBudgetViewController *bvc = [[CreateBudgetViewController alloc] init];
    AddFriendsViewController  *bvc = [[AddFriendsViewController alloc] init];
    bvc.tripDetail = self.tripDetail;
    [self.navigationController pushViewController:bvc animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
