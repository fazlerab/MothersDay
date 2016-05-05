//
//  ViewController.h
//  MothersDay
//
//  Created by Imran on 5/5/16.
//  Copyright © 2016 TurnToTech Hackathon. All rights reserved.
//

#import <UIKit/UIKit.h>
<<<<<<< HEAD
#import "GetRequest.h"
=======
#import <QuartzCore/QuartzCore.h>
#import "DAO.h"

<<<<<<< HEAD
@class DAO;
=======
>>>>>>> 158b6e7b70d9d3e1a0ea2eba522ad60a22102e4a
>>>>>>> 59f860ebda208d263f751e727f41b1e68810d128

@interface ItsHappeningViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *ItsHappeningLabel;
@property (weak, nonatomic) IBOutlet UILabel *dueDateLabel;
@property (nonatomic, retain) DAO *dao;



@end

