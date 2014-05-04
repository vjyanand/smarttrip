//
//  ViewController.m
//  SmartTrip
//
//  Created by iavian on 5/3/14.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import "ViewController.h"
#import "InitView.h"
#import <FacebookSDK/FacebookSDK.h>
#import "TripViewController.h"
#import "ExpenseHelper.h"
#import "EvernoteSDK.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    InitView *init = [[InitView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    self.view = init;
    
    [[EvernoteSession sharedSession] authenticateWithViewController:self completionHandler:^(NSError *error) {
        
    }];
    
    
   // Do any additional setup after loading the view, typically from a nib.

    UIButton *buttonToTrip = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 50, self.view.frame.size.height/2, 100, 50)];
    [buttonToTrip setBackgroundColor:[UIColor blueColor]];
    [buttonToTrip setTitle:@"Go To Trip" forState:UIControlStateNormal];
    [buttonToTrip addTarget:self action:@selector(goToTrip:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonToTrip];
    /*TripDetails *a = [[TripDetails alloc] init];
    a.destination = @"NY";
    a.tripStart = [NSDate date];
    a.tripLength = @10;
    a.UUID = [[NSUUID UUID] UUIDString];
    [[ExpenseHelper sharedEverNoteHelper] createTrip:a completion:^(NSError *error) {
        [[ExpenseHelper sharedEverNoteHelper] getMyTrips:^(NSError *error, NSArray *trips) {
            NSLog(@"%@", trips);
        }];
    }];
    Expense *e = [[Expense alloc] init];
    e.category = @"VIJAY";
    e.dateAndTime = [NSDate date];
    e.amount = @20.5;
    e.desc = @"AAA";
    [[ExpenseHelper sharedEverNoteHelper] addExpense:e fortrip:nil completion:^(NSError *error) {
        
    }];*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goToTrip:(id)sender
{
    TripViewController *tripVC = [[TripViewController alloc] initWithTripDetails:nil];
    
    [self.navigationController pushViewController:tripVC animated:NO];
    self.navigationController.navigationBar.hidden = YES;
}

@end
