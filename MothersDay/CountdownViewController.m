//
//  CountdownViewController.m
//  MothersDay
//
//  Created by Imran on 5/5/16.
//  Copyright © 2016 TurnToTech Hackathon. All rights reserved.
//

#import "CountdownViewController.h"

@interface CountdownViewController ()

@property (weak, nonatomic) IBOutlet UIView *circularView;
@property (weak, nonatomic) IBOutlet UILabel *countdownDays;


@end

@implementation CountdownViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Date: %@", self.dueDate);
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor colorWithRed:137.0/255 green:207.0/255 blue:240.0/255 alpha:1.0];
    
    CGSize circularSize = self.circularView.bounds.size;
    self.circularView.layer.cornerRadius = circularSize.width / 2;
    self.circularView.layer.borderWidth = 20.0;
    self.circularView.layer.borderColor = [UIColor colorWithRed:1 green:102.0/255 blue:1.0 alpha:1.0].CGColor;
    
}

@end
