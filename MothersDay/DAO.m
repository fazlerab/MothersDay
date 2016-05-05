//
//  DAO.m
//  MothersDay
//
//  Created by Thomas on 5/5/16.
//  Copyright © 2016 TurnToTech Hackathon. All rights reserved.
//

#import "DAO.h"

@implementation DAO
{
  NSString *dataUrl;
}


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

- (NSString *)itsABoy {
  self.babyGender = @"boy";
  return self.babyGender;
}

- (NSString *)itsAGirl {
  self.babyGender = @"girl";
  return self.babyGender;
}

- (NSString *)generateNewBabyName {
  if ([self.babyGender isEqualToString:@"boy"]) {
    dataUrl = @"http://www.behindthename.com/api/random.php?key=be398439&number=1";
  } else if ([self.babyGender isEqualToString:@"girl"]){
    dataUrl = @"http://www.behindthename.com/api/random.php?usage=ita&gender=f&key=be398439&number=1";
  }
  NSURL *url = [NSURL URLWithString:dataUrl];
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
  request.HTTPMethod = @"GET";
  NSURLSession *session = [NSURLSession sharedSession];
  NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    //NSLog(@"response == %@", response);
    dispatch_async(dispatch_get_main_queue(),^{
      NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
      NSString *haystack = string;
      NSString *haystackPrefix = @"<name>";
      NSString *haystackSuffix = @"</name>";
      NSRange prefixRange = [haystack rangeOfString:haystackPrefix];
      NSRange suffixRange = [haystack rangeOfString:haystackSuffix];
      NSRange parsedName = NSMakeRange(prefixRange.location + prefixRange.length, suffixRange.location - (prefixRange.location + prefixRange.length));
      
      self.generatedBabyName = [haystack substringWithRange:parsedName];
    });
  }];
  [task resume];
  return self.generatedBabyName;
}

- (void)addNameToSavedNames:(NSString *)name {
  [self.savedNames addObject:name];
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  [userDefaults setObject:self.savedNames forKey:@"savedNames"];
  [userDefaults synchronize];
}

- (void)addNameToDeletedNames:(NSString *)name {
  [self.deletedNames addObject:name];
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  [userDefaults setObject:self.deletedNames forKey:@"deletedNames"];
  [userDefaults synchronize];
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
