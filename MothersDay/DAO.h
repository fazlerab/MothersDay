//
//  DAO.h
//  MothersDay
//
//  Created by Thomas on 5/5/16.
//  Copyright © 2016 TurnToTech Hackathon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAO : NSObject

@property (nonatomic, retain) NSMutableArray *savedNames;
@property (nonatomic, retain) NSMutableArray *deletedNames;

+ (instancetype)sharedInstance;
- (instancetype)privateInit;
- (void)addNameToSavedNames:(NSString *)name;
- (void)addNameToDeletedNames:(NSString *)name;
- (BOOL)checkForSavedName:(NSString *)nameToCheck;
//- (BOOL)checkForDeletedName:(NSString *)nameToCheck;

@end
