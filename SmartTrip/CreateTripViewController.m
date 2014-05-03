//
//  CreateTripViewController.m
//  SmartTrip
//
//  Created by George on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import "CreateTripViewController.h"

@interface CreateTripViewController ()

@end

@implementation CreateTripViewController

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
    
    UITextField *whereInput = [[UITextField alloc] initWithFrame:CGRectMake(30, 120, screenWidth-60, 30)];
    whereInput.placeholder = @"E.g. New York City";
    [self.view addSubview:whereInput];
    
    UILabel *whenQuestion = [[UILabel alloc] initWithFrame:CGRectMake(0, 160, screenWidth, 30)];
    whenQuestion.text = @"When?";
    whenQuestion.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:19.0f];
    whenQuestion.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:whenQuestion];
    
    UIDatePicker *leaving = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 190, screenWidth, 30)];
    leaving.datePickerMode = UIDatePickerModeDate;
    [self.view addSubview:leaving];
    
    //UISlider *length = [[UISlider alloc] initWithFrame:CGRectMake]
    
    // Do any additional setup after loading the view.
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
