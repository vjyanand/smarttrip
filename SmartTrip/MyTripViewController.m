//
//  MyTripViewController.m
//  SmartTrip
//
//  Created by George on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import "MyTripViewController.h"
#import "CreateTripViewController.h"

@interface MyTripViewController ()

@end

@implementation MyTripViewController

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
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    UIImage *image = [UIImage imageNamed: @"smarttrip-large_10.png"];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    UIImageView *imageview = [[UIImageView alloc] initWithImage: image];
    imageview.frame = CGRectMake(70, 250, 200, 70);
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:100.0/255.0 green:200.0/255.0 blue:221/255.0 alpha:1];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(createTrip)];
    //self.navigationItem.titleView = imageview;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [button addTarget:self
               action:@selector(createTrip)
     forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(screenWidth-100, 30, 160.0, 40.0);
    [self.view addSubview:button];
    [self.navigationItem setHidesBackButton:YES];
    [self.view addSubview:imageview];
    
    [self.navigationController.navigationBar setTranslucent:YES];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    // Do any additional setup after loading the view.
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}
-(void)createTrip{
    CreateTripViewController *ctvc = [[CreateTripViewController alloc] init];
    [self.navigationController pushViewController:ctvc animated:YES];
    
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
