//
//  BabyNameView.m
//  MothersDay
//
//  Created by Imran on 5/5/16.
//  Copyright © 2016 TurnToTech Hackathon. All rights reserved.
//

#import "BabyNameView.h"

@interface BabyNameView ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *yesButton;
@property (nonatomic, strong) UIButton *noButton;

@end

@implementation BabyNameView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
      
//      self.name = [GetRequest getName];   //  Set name to property.
      self.dao = [DAO sharedInstance];
      self.name = self.dao.generatedBabyName;
      [self setupUI];
    }
    return self;
}

- (void)setupUI {
  BOOL hasNameBeenSwiped = [self.dao checkForSavedName:self.name];
  if (hasNameBeenSwiped == NO) {
    self.nameLabel.text = self.name;
  } else if (hasNameBeenSwiped == YES) {
    self.nameLabel.text = [self.dao generateNewBabyName];
  }
  
  if ([self.yesButton isSelected]) {
    [self.dao addNameToSavedNames:self.name];
    NSLog(@"%@", [self.dao.savedNames objectAtIndex:0]);
  } else if ([self.noButton isSelected]) {
    [self.dao addNameToDeletedNames:self.name];
  }
    
}


@end
