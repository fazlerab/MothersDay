//
//  CountdownViewController.m
//  MothersDay
//
//  Created by Imran on 5/5/16.
//  Copyright © 2016 TurnToTech Hackathon. All rights reserved.
//

#import "CountdownViewController.h"
#import "DAO.h"

@interface CountdownViewController ()

@property (weak, nonatomic) IBOutlet UIView *circularView;
@property (weak, nonatomic) IBOutlet UILabel *countdownDays;
@property (weak, nonatomic) IBOutlet UILabel *babyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet NSArray *names;

@end

@implementation CountdownViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.names = @["John, Jane, "]
    [self setupUI];
    [self setupGestureRecognizer];
    [self setDayCount];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor colorWithRed:137.0/255 green:207.0/255 blue:240.0/255 alpha:1.0];
    
    CGSize circularSize = self.circularView.bounds.size;
    
    self.circularView.layer.cornerRadius = circularSize.width / 2;
    self.circularView.layer.borderWidth = 20.0;
    self.circularView.layer.borderColor = [UIColor colorWithRed:1 green:102.0/255 blue:1.0 alpha:1.0].CGColor;
    
    
//    self.dao = [DAO sharedInstance];
//    [[DAO sharedInstance]generateNewBabyName];
//    self.babyName = [[DAO sharedInstance]generateNewBabyName];
//    
//    self.babyNameLabel.text = self.babyName;
//    NSLog(@"%@",self.babyName);

    self.babyNameLabel.text = @"John";

    /*
    NSString *name = [self.dao generateNewBabyName];
    self.babyNameLabel.text = name;
     */
}

- (void)setupGestureRecognizer {
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.babyNameLabel setUserInteractionEnabled:YES];
    [self.babyNameLabel addGestureRecognizer:swipeGesture];
}

- (void)setDayCount {
    NSCalendar *calander = [NSCalendar currentCalendar];
    NSDate *now = [NSDate date];
    
    NSDateComponents *dateComponents = [calander components:NSCalendarUnitDay fromDate:now toDate:self.dueDate options:0];
    self.countdownDays.text = [NSString stringWithFormat:@"%lu", [dateComponents day]];

}

- (IBAction)handleSaveButton:(UIButton *)sender {
    
}

- (void)handleSwipe:(UIGestureRecognizer *)sender {
    NSLog(@"handleSwipe");
//    NSString *name = [self.dao generateNewBabyName];
//    self.babyNameLabel.text = name;
    NSString *name =  self.babyNameLabel.text;
    self.babyNameLabel.text = [name isEqualToString:@"Jane"] ? @"John" : @"Jane";
}
@end
