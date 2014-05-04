//
//  ExpenseViewController.m
//  SmartTrip
//
//  Created by Isabel Barrera on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import "ExpenseViewController.h"
#import "TripDetails.h"
#import "CategoryBudget.h"

@interface ExpenseViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UIButton *selectCat;

@end

@implementation ExpenseViewController

- (id)initWithTripDetails:(TripDetails *)details
{
    self = [super init];
    if (self) {
        if (details) {
            self.tripDetails = details;
        }
        
        self.view.backgroundColor = [UIColor whiteColor];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.picker  = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 200, self.view.frame.size.width, 280)];;
    self.picker.showsSelectionIndicator = YES;
    self.picker.backgroundColor = [UIColor whiteColor];
    self.picker.delegate = self;
    self.picker.dataSource = self;
    [self.picker reloadAllComponents];
    [self.picker setHidden:YES];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 100, 50, 200, 50)];
    titleLabel.text = @"Add Expense";
    titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:25.0];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    UILabel *chooseCat = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 100, 120, 200, 50)];
    chooseCat.text = @"Expense Category";
    chooseCat.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0];
    chooseCat.backgroundColor = [UIColor clearColor];
    chooseCat.textColor = [UIColor blackColor];
    chooseCat.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:chooseCat];
    
    self.selectCat = [UIButton buttonWithType:UIButtonTypeCustom];
    self.selectCat.frame = CGRectMake(self.view.frame.size.width/2 - 100, chooseCat.frame.origin.y + 80, 200, 50);
    self.selectCat.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    [self.selectCat setTitle:@"Select Category" forState:UIControlStateNormal];
    [self.selectCat setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.selectCat.layer setBorderWidth:1.0];
    [self.selectCat.layer setBorderColor:[UIColor colorWithRed:144.0/255.0 green:206.0/255.0 blue:221.0/255.0 alpha:1].CGColor];
    
    [self.selectCat addTarget:self action:@selector(selectCat:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.selectCat];
    
    UILabel *expenseAmountLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 100, self.selectCat.frame.origin.y + 70, 200, 50)];
    expenseAmountLabel.text = @"Enter Expense Amount";
    expenseAmountLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0];
    expenseAmountLabel.backgroundColor = [UIColor clearColor];
    expenseAmountLabel.textColor = [UIColor blackColor];
    expenseAmountLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:expenseAmountLabel];

    
    UITextField *expenseAmount = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 100, expenseAmountLabel.frame.origin.y + 70, 200, 50)];
    expenseAmount.text = @"$0.00";
    expenseAmount.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:25.0];
    expenseAmount.backgroundColor = [UIColor clearColor];
    expenseAmount.textColor = [UIColor blackColor];
    expenseAmount.textAlignment = NSTextAlignmentCenter;
    [expenseAmount setKeyboardType:UIKeyboardTypeDecimalPad];
    [expenseAmount setReturnKeyType:UIReturnKeyDone];
    
    [self.view addSubview:expenseAmount];

    
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    doneButton.frame = CGRectMake(self.view.frame.size.width/2 - 75, self.view.frame.size.height - 100, 150, 50);
    doneButton.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [doneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [doneButton.layer setBorderWidth:1.0];
    [doneButton.layer setBorderColor:[UIColor colorWithRed:144.0/255.0 green:206.0/255.0 blue:221.0/255.0 alpha:1].CGColor];
    
    [doneButton addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:titleLabel];
    [self.view addSubview:doneButton];
    [self.view addSubview:self.picker];
}

- (void)done:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)selectCat:(id)sender
{
    [self.picker setHidden:NO];
}


#pragma mark - UIPickerView Data Source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return self.tripDetails.budget.spendingCategories.count;
}

#pragma-mark UIPickerView Delegate Methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    CategoryBudget *budget = [self.tripDetails.budget.spendingCategories objectAtIndex:row];
    return budget.categoryName;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *selection = [self.picker.delegate pickerView:self.picker titleForRow:row forComponent:component];
    [self.selectCat setTitle:selection forState:UIControlStateNormal];
    [self.picker setHidden:YES];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30.0;
}

#pragma mark- Expense Creation

- (void)createExpense
{
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end