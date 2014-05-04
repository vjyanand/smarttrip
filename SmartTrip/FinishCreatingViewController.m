//
//  FinishCreatingViewController.m
//  SmartTrip
//
//  Created by George on 2014-05-03.
//  Copyright (c) 2014 SmartTrip. All rights reserved.
//

#import "FinishCreatingViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"
@interface FinishCreatingViewController ()

@end

@implementation FinishCreatingViewController
@synthesize friend_list;

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
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    NSArray * allKeys = [friend_list allKeys];
    int count = 0;
    int line = 1;
    UIView *image_holder = [[UIView alloc] init];
    [self.view addSubview:image_holder];
    
    for(NSString *fbuid in allKeys){
        if(count == 4){
            line++;
            count = 0;
        }
        NSString *profile_id = fbuid;
        NSString *base  =@"http://graph.facebook.com/";
        base = [base stringByAppendingString:profile_id];
        base = [base stringByAppendingString:@"/picture?width=200&height=200"];
        base = [base stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake((count*80)+5, 200+(80*line), 70, 70)];
        [img setImageWithURL:[NSURL URLWithString:base]
            placeholderImage:[UIImage imageNamed:@""]];
        
        CALayer *imageLayer = img.layer;
        [imageLayer setCornerRadius:70/2];
        [imageLayer setMasksToBounds:YES];
        
        [image_holder addSubview:img];
        
        
        count++;
    }
    
    UILabel *creates = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, screenWidth, 50)];
    creates.text = @"Trip created!";
    creates.font = [UIFont fontWithName:@"AvenirNext-UltraLight" size:40.0f];
    creates.textColor = [UIColor blackColor];
    creates.alpha = 0.4;
    creates.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:creates];
    
    [UIView animateWithDuration:.5 delay:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        creates.frame  = CGRectMake(0, 100, screenWidth,50);
        image_holder.frame = CGRectMake(0, 100, screenWidth, 70);
    } completion:^(BOOL finished) {
        
        
    }];
    
    UILabel *activate = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, screenWidth, 30)];
    activate.font = [UIFont fontWithName:@"AvenirNext-UltraLight" size:25.0f];
    activate.textColor = [UIColor blackColor];
    activate.alpha = 0;
    activate.textAlignment = NSTextAlignmentCenter;
    activate.text = @"Your trip will activate on";
    [self.view addSubview:activate];
    [UIView animateWithDuration:0.5 delay:1.5 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ activate.alpha = 0.4;}
                     completion:nil];
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
