//
//  AddFriendsViewController.m
//  SmartTrip
//
//  Created by George on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import "AddFriendsViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "FriendsTableViewCell.h"
#import "FinishCreatingViewController.h"
#import "TripDetails.h"
#import "CreateBudgetViewController.h"

@interface AddFriendsViewController ()

@property (nonatomic, strong) UITableView *friends;
@property (nonatomic, strong) UISearchBar *search;
@property (nonatomic, strong) NSMutableArray *facebook_ids;

@end

@implementation AddFriendsViewController{
    NSMutableDictionary *friend_list;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tripDetail = [[TripDetails alloc] init];
        
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        
        self.friends = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, screenWidth, screenHeight-40)];
        self.friends.delegate = self;
        self.friends.dataSource = self;
        self.friends.separatorStyle = UITableViewCellSelectionStyleNone;
        self.friends.separatorColor = [UIColor clearColor];
        self.search = [[UISearchBar alloc] initWithFrame:CGRectMake(-13, 70, screenWidth+25, 28)];
        
        self.facebook_ids = [[NSMutableArray alloc] initWithObjects:@"4",@"216311481960", @"113529011990795", @"500065899",@"606910", @"551683250",@"1550970059", @"22433917219",@"499855708",@"202012", @"100002268160293", @"506148678", @"1335306799", @"1587744377", @"100005055302522", @"256577984352748",  nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Add Friends";
    NSLog(@"%@",self.tripDetail.destination);
    
    friend_list = [[NSMutableDictionary alloc] init];
    
    UIView *temp_white = [[UIView alloc] initWithFrame:CGRectMake(self.search.frame.origin.x, self.search.frame.origin.y-40, self.search.frame.size.width+25, self.search.frame.size.height+25)];
    temp_white.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.friends];
    [self.view addSubview:temp_white];
    
    [self.view addSubview:self.search];
    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithTitle:@"Skip" style:UIBarButtonItemStylePlain target:self action:@selector(clickNext)];
    
    self.navigationItem.rightBarButtonItem = next;
    
    // Do any additional setup after loading the view.
}
-(void)clickNext{
    NSArray * allKeys = [friend_list allKeys];
    self.tripDetail.tripFriends = allKeys;
    
    CreateBudgetViewController *budget = [[CreateBudgetViewController alloc] init];
    budget.tripDetail = self.tripDetail;
    budget.friend_list = friend_list;
    [self.navigationController pushViewController:budget animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.facebook_ids count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"FacebookCell";
    // Similar to UITableViewCell, but
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    FriendsTableViewCell *cell = (FriendsTableViewCell *)[self.friends dequeueReusableCellWithIdentifier:@"FacebookCell"];
    if (cell == nil) {
        cell = [[FriendsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSString *profile_id = [self.facebook_ids objectAtIndex:indexPath.row];
    cell.name.text = @"facebook test";
    NSString *base  =@"http://graph.facebook.com/";
    base = [base stringByAppendingString:profile_id];
    base = [base stringByAppendingString:@"/picture?width=200&height=200"];
    base = [base stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    [cell.profile_picture_image_view setImageWithURL:[NSURL URLWithString:base]
                                    placeholderImage:[UIImage imageNamed:@""]];
    
    base  =@"http://graph.facebook.com/";
    base = [base stringByAppendingString:profile_id];
    base = [base stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:base];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSError * error;
    
    //Get json data in Dictionary
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error: &error];
    
    cell.name.text = [json objectForKey:@"name"];
    cell.fbuid = [json objectForKey:@"id"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
    
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FriendsTableViewCell *cell = (FriendsTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    if(cell.check_mark.hidden == NO) {
        cell.check_mark.hidden = YES;
        [friend_list removeObjectForKey:cell.fbuid];
    }else{
        cell.check_mark.hidden = NO;
        [friend_list setObject:cell.fbuid forKey:cell.fbuid];
    }
    
    self.navigationItem.rightBarButtonItem.title = @"Next";
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}


@end
