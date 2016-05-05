//
//  GetRequest.m
//  MOTHERS DAY APP
//
//  Created by Clyfford Millet on 5/5/16.
//  Copyright © 2016 Clyff IOS supercompany. All rights reserved.
//

#import "GetRequest.h"

@implementation GetRequest

-(void)getRequest
{
    NSString *dataUrl = @"http://www.behindthename.com/api/random.php?key=be398439&number=1";
    NSURL *url = [NSURL URLWithString:dataUrl];
   
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    request.HTTPMethod = @"GET";
    
    // 2
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                NSLog(@"response == %@", response);
        dispatch_async(dispatch_get_main_queue(),^{
        [self processData:data];
        });
    }];
    
    [task resume];
}

-(void)processData:(NSData *)data
{
    NSXMLParser *parser = [[NSXMLParser alloc]initWithData:data];
    [parser setDelegate:self];
    [parser parse];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    //    NSLog(@"%@",elementName);
    
//    if ([elementName isEqualToString:@"name"]) {
//        
//        NSMutableArray *names = [[NSMutableArray alloc]init];
//    }
}


-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (!self.babyName) {
        self.babyName = [[NSMutableString alloc] initWithString:string];
        NSLog(@"baby name: %@",self.babyName);
    } else {
        [self.babyName stringByAppendingString:string];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSLog(@"baby name at end: %@",self.babyName);
    
}


-(NSString*)getName{
    return self.babyName;
}












@end
