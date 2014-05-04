//
//  CreateBudgetViewController.m
//  SmartTrip
//
//  Created by George on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import "CreateBudgetViewController.h"
#import "CategoriesView.h"
#import "AddFriendsViewController.h"

@interface CreateBudgetViewController ()

@end

@implementation CreateBudgetViewController{
    CategoriesView *travel, *night, *accom, *food;
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
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    self.title = @"Budget";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *add = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, screenWidth, 40)];
    add.text = @"Add Spending Categories";
    add.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:add];
    
    travel = [[CategoriesView alloc] initWithSpecials:CGRectMake(20, 100, screenWidth, 30) initWithTitle:@"Travel"];
    [self.view addSubview:travel.title];
    [self.view addSubview:travel.slider];
    [self.view addSubview:travel.price];
    [travel.slider addTarget:self action:@selector(travelSlider:) forControlEvents:UIControlEventValueChanged];
    travel.slider.minimumValue = 0.0;
    travel.slider.maximumValue = 1000.0;
    travel.slider.continuous = YES;
    travel.slider.value = 0.0;
    
    
    accom = [[CategoriesView alloc] initWithSpecials:CGRectMake(20, 180, screenWidth, 30) initWithTitle:@"Accomodation"];
    [self.view addSubview:accom.title];
    [self.view addSubview:accom.slider];
    [accom.slider addTarget:self action:@selector(accomSlider:) forControlEvents:UIControlEventValueChanged];
    accom.slider.minimumValue = 0.0;
    accom.slider.maximumValue = 1000.0;
    accom.slider.continuous = YES;
    accom.slider.value = 0.0;
    [self.view addSubview:accom.price];
    
    food = [[CategoriesView alloc] initWithSpecials:CGRectMake(20, 260, screenWidth, 30) initWithTitle:@"Food"];
    [self.view addSubview:food.title];
    [self.view addSubview:food.slider];
    [food.slider addTarget:self action:@selector(foodSlider:) forControlEvents:UIControlEventValueChanged];
    food.slider.minimumValue = 0.0;
    food.slider.maximumValue = 1000.0;
    food.slider.continuous = YES;
    food.slider.value = 0.0;
    [self.view addSubview:food.price];
    
    night = [[CategoriesView alloc] initWithSpecials:CGRectMake(20, 340, screenWidth, 30) initWithTitle:@"Nightlife"];
    [self.view addSubview:night.title];
    [self.view addSubview:night.slider];
    [night.slider addTarget:self action:@selector(nightSlider:) forControlEvents:UIControlEventValueChanged];
    night.slider.minimumValue = 0.0;
    night.slider.maximumValue = 1000.0;
    night.slider.continuous = YES;
    night.slider.value = 0.0;
    [self.view addSubview:night.price];
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(clickNext)];
    
    self.navigationItem.rightBarButtonItem = next;

    //NSLog(travel.title.text);

    //travel.title.frame = CGRectMake(0, 100, screenWidth, 30);
    //[self.view addSubview:travel.title];
    
    // Do any additional setup after loading the view.
}
-(void)travelSlider:(id)sender{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    UISlider *slider = (UISlider*)sender;
    travel.price.text = [NSString stringWithFormat:@"$%d", (int)slider.value];
}
-(void)accomSlider:(id)sender{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    UISlider *slider = (UISlider*)sender;
    accom.price.text = [NSString stringWithFormat:@"$%d", (int)slider.value];
    
}
-(void)foodSlider:(id)sender{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    UISlider *slider = (UISlider*)sender;
    food.price.text = [NSString stringWithFormat:@"$%d", (int)slider.value];
    
}
-(void)nightSlider:(id)sender{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    UISlider *slider = (UISlider*)sender;
    night.price.text = [NSString stringWithFormat:@"$%d", (int)slider.value];
    
}
-(void)clickNext{
    AddFriendsViewController *addFriends = [[AddFriendsViewController alloc] init];
    [self.navigationController pushViewController:addFriends animated:YES];
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
