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
#import "TripBudget.h"
#import "FinishCreatingViewController.h"
#import "CategoryBudget.h"

@interface CreateBudgetViewController ()

@end

@implementation CreateBudgetViewController{
    CategoriesView *travel, *night, *accom, *food;
    UILabel *real_budget;
    CategoryBudget *travelB, *nightB, *accomB, *foodB;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.friend_list = [[NSMutableDictionary alloc] init];
        self.tripDetail = [[TripDetails alloc] init];
        
        travelB = [[CategoryBudget alloc] init];
        nightB = [[CategoryBudget alloc] init];
        accomB = [[CategoryBudget alloc] init];
        foodB   = [[CategoryBudget alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    real_budget = [[UILabel alloc] initWithFrame:CGRectMake(0, 450, screenWidth, 50)];
    self.title = @"Budget";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *add = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, screenWidth, 40)];
    add.text = @"Add Spending Categories";
    add.font = [UIFont fontWithName:@"AvenirNext-UltraLight" size:20.0f];
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

    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(createBudget:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Create Budget" forState:UIControlStateNormal];
    button.frame = CGRectMake(80.0, 500.0, 160.0, 40.0);
    [self.view addSubview:button];
    
    //NSLog(travel.title.text);

    //travel.title.frame = CGRectMake(0, 100, screenWidth, 30);
    //[self.view addSubview:travel.title];
    
    // Do any additional setup after loading the view.
}
-(void)createBudget:(id)sender{
    int travelPrice = [[travel.price.text stringByReplacingOccurrencesOfString:@"$" withString:@""] intValue];
    int foodPrice = [[food.price.text stringByReplacingOccurrencesOfString:@"$" withString:@""] intValue];
    int nightPrice = [[night.price.text stringByReplacingOccurrencesOfString:@"$" withString:@""] intValue];
    int accomPrice = [[accom.price.text stringByReplacingOccurrencesOfString:@"$" withString:@""] intValue];
    
    
    travelB.categoryBudget = [NSNumber numberWithInt:travelPrice];
    nightB.categoryBudget = [NSNumber numberWithInt:nightPrice];
    foodB.categoryBudget = [NSNumber numberWithInt:foodPrice];
    accomB.categoryBudget = [NSNumber numberWithInt:accomPrice];
    
    travelB.categoryName = @"Travel";
    nightB.categoryName = @"Nightlife";
    foodB.categoryName = @"Food";
    accomB.categoryName = @"Accommodation";
    
    travelB.categoryAmountSpent = [NSNumber numberWithInt:0];
    nightB.categoryAmountSpent = [NSNumber numberWithInt:0];
    foodB.categoryAmountSpent = [NSNumber numberWithInt:0];
    accomB.categoryAmountSpent = [NSNumber numberWithInt:0];
    
    int final_budget = travelPrice+foodPrice+nightPrice+accomPrice;
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    real_budget.textAlignment = NSTextAlignmentCenter;
    real_budget.font = [UIFont fontWithName:@"AvenirNext-UltraLight" size:40.0f];
    [self.view addSubview:real_budget];
    NSString *final = [NSString stringWithFormat:@"%d", final_budget];
    real_budget.text = final;

}
-(void)travelSlider:(id)sender{
    UISlider *slider = (UISlider*)sender;
    travel.price.text = [NSString stringWithFormat:@"$%d", (int)slider.value];
}
-(void)accomSlider:(id)sender{
    UISlider *slider = (UISlider*)sender;
    accom.price.text = [NSString stringWithFormat:@"$%d", (int)slider.value];
    
}
-(void)foodSlider:(id)sender{
    UISlider *slider = (UISlider*)sender;
    food.price.text = [NSString stringWithFormat:@"$%d", (int)slider.value];
    
}
-(void)nightSlider:(id)sender{
    
    UISlider *slider = (UISlider*)sender;
    night.price.text = [NSString stringWithFormat:@"$%d", (int)slider.value];
    
}
-(void)clickNext{
    TripBudget *tripBudget = [[TripBudget alloc] init];
    [self createBudget:nil];
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * myNumber = [f numberFromString:real_budget.text];
    tripBudget.totalBudget = myNumber;
    
    tripBudget.spendingCategories = [[NSMutableArray alloc] initWithObjects:travelB, foodB, accomB, nightB, nil];
    
    self.tripDetail.budget = tripBudget;
    FinishCreatingViewController *finish = [[FinishCreatingViewController alloc] init];
    finish.friend_list = self.friend_list;
    finish.tripDetail = self.tripDetail;
    finish.final_budget = real_budget.text;
    //AddFriendsViewController *addFriends = [[AddFriendsViewController alloc] init];
    [self.navigationController pushViewController:finish animated:YES];
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
