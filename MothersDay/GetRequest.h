//
//  GetRequest.h
//  MOTHERS DAY APP
//
//  Created by Clyfford Millet on 5/5/16.
//  Copyright © 2016 Clyff IOS supercompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface GetRequest : NSObject <NSURLConnectionDelegate,NSXMLParserDelegate>


@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSString *babyName;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContent;



-(void)getRequest;

@end
