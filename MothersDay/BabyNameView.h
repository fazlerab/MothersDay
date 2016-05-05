//
//  BabyNameView.h
//  MothersDay
//
//  Created by Imran on 5/5/16.
//  Copyright © 2016 TurnToTech Hackathon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAO.h"

@class DAO;

@interface BabyNameView : UIView

@property (nonatomic, strong) NSString *name;
@property (nonatomic, retain) DAO *dao;

@end
