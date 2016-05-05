//
//  DAO.m
//  MothersDay
//
//  Created by Thomas on 5/5/16.
//  Copyright © 2016 TurnToTech Hackathon. All rights reserved.
//

#import "DAO.h"

@implementation DAO


+ (instancetype) sharedInstance {
  static DAO *_sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedInstance = [[DAO alloc] privateInit];
  });
  return _sharedInstance;
};

- (instancetype)privateInit {
  self.savedNames = [NSMutableArray array];
  self.deletedNames = [NSMutableArray array];
  return self;
}

- (void)addNameToSavedNames:(NSString *)name {
  [self.savedNames addObject:name];
}

- (void)addNameToDeletedNames:(NSString *)name {
  [self.deletedNames addObject:name];
}

- (BOOL)checkForSavedName:(NSString *)nameToCheck {
  BOOL hasNameBeenSwiped = NO;
  for (NSString *name in self.savedNames) {         //  Look for name in array of saved names.
    if ([name isEqualToString:nameToCheck]) {
      hasNameBeenSwiped = YES;
    }
  }
  
  if (!hasNameBeenSwiped) {
    hasNameBeenSwiped = [self checkForDeletedName:nameToCheck]; //  Look in array of deleted names.
  }
  
  return hasNameBeenSwiped;
}

- (BOOL)checkForDeletedName:(NSString *)nameToCheck {
  BOOL hasNameBeenSwiped = NO;
  for (NSString *name in self.deletedNames) {
    if ([name isEqualToString:nameToCheck]) {
      hasNameBeenSwiped = YES;
    }
  }
  return hasNameBeenSwiped;
}

@end
