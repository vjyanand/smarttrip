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
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
