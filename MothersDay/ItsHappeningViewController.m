//
//  ViewController.m
//  MothersDay
//
//  Created by Imran on 5/5/16.
//  Copyright © 2016 TurnToTech Hackathon. All rights reserved.
//

#import "ItsHappeningViewController.h"
#import "CountdownViewController.h"

@interface ItsHappeningViewController ()
@property (nonatomic,strong)NSDate *dueDate;
@property (nonatomic, strong)UISegmentedControl *genderControl;

@end

@implementation ItsHappeningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dao = [DAO sharedInstance];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(doneButton)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Done" forState:UIControlStateNormal];
    button.frame = CGRectMake(115.0, 670.0, 160.0, 40.0);
    
    self.genderControl = [[UISegmentedControl alloc] initWithItems:@[@"It's a Boy", @"It's a Girl"]];
    [self.genderControl addTarget:self action:@selector(handleGenderControl) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:button];
  
    
    
[self textlabelGlowAndColor];
    
    CGRect pickerFrame = CGRectMake(50,450,0,0);
    
    UIDatePicker *myPicker = [[UIDatePicker alloc] initWithFrame:pickerFrame];
    [myPicker addTarget:self action:@selector(pickerChanged:)               forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:myPicker];
    
    
}

- (void)pickerChanged:(id)sender
{
    
    NSLog(@"value: %@",[sender date]);
    self.dueDate = [sender date];
}
    


-(void)textlabelGlowAndColor{
    self.ItsHappeningLabel.text = @"IT'S HAPPENING";
        
    //Baby Blue
    self.ItsHappeningLabel.textColor = [UIColor colorWithRed:(255.0/255)green:(102.0/255) blue:(255.0/255)alpha:1.0];
    
   UIColor *color = self.ItsHappeningLabel.textColor;
    
    //Create Shadow
    self.ItsHappeningLabel.layer.shadowColor = [color CGColor];
    self.ItsHappeningLabel.layer.shadowRadius = 4.0f;
    self.ItsHappeningLabel.layer.shadowOpacity = .9;
    self.ItsHappeningLabel.layer.shadowOffset = CGSizeZero;
    self.ItsHappeningLabel.layer.masksToBounds = NO;
    
        
    //change font size
    self.ItsHappeningLabel.font = [UIFont systemFontOfSize:42];
    
    //make the label diagonal
    self.ItsHappeningLabel.transform = CGAffineTransformMakeRotation(M_PI / 8);
    
    //set text label for due data
    
    self.dueDateLabel.text = @" WHen IS YOUR DUE DATE?";
    
    //change the text size
    self.dueDateLabel.font = [UIFont systemFontOfSize:25];

    
    self.dueDateLabel.textColor = [UIColor colorWithRed:(255.0/255)green:(102.0/255) blue:(255.0/255)alpha:1.0];
    UIColor *colorDueDate = self.dueDateLabel.textColor;
    
    //Create Shadow
    self.dueDateLabel.layer.shadowColor =[colorDueDate CGColor];
    self.dueDateLabel.layer.shadowRadius = 4.0f;
    self.dueDateLabel.layer.shadowOpacity = .9;
    self.dueDateLabel.layer.shadowOffset = CGSizeZero;
    self.dueDateLabel.layer.masksToBounds = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)doneButton{
    if (!self.dueDate) {
        self.dueDate = [NSDate date];
    }
    [self performSegueWithIdentifier:@"SegueToCountdown" sender:self.dueDate];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SegueToCountdown"]) {
        CountdownViewController *cntrl = (CountdownViewController *)segue.destinationViewController;
        cntrl.dueDate = (NSDate *)sender;
    }
}

@end
