//
//  HandleSwipe.h
//  MothersDay
//
//  Created by Thomas on 5/5/16.
//  Copyright © 2016 TurnToTech Hackathon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HandleSwipe : NSObject

@property (nonatomic, retain) NSMutableArray *savedNames;
@property (nonatomic, retain) NSMutableArray *deletedNames;

- (void)addNameToSavedNames:(NSString *)name;
- (void)addNameToDeletedNames:(NSString *)name;
- (BOOL)checkForSavedName:(NSString *)name;
- (BOOL)checkForDeletedName:(NSString *)name;

@end
