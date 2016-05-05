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
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
}


@end
