//
//  CountdownViewController.h
//  MothersDay
//
//  Created by Imran on 5/5/16.
//  Copyright © 2016 TurnToTech Hackathon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAO.h"

@class dao;
@interface CountdownViewController : UIViewController

@property (nonatomic, strong) NSDate *dueDate;
@property (nonatomic, strong) DAO *dao;
@property (nonatomic, strong) NSString *babyName;

@end
