//
//  TWAObject.m
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import "TWAObject.h"

@implementation TWAObject

- (id) initWithDictionary: (NSDictionary*) attributeDict {
    self = [super init];
    if(self) {
        self.classification = [attributeDict objectForKey: @"Classification"];
    }
    return self;
}

- (void) fetchPage: (int) pageNumber withPageSize: (int) pageSize completion: (void(^)(NSArray*)) callback {

    NSString *indexURL = @"http://api.thewalters.org/v1/objects?apikey=sOK3xgGkv3ooeK4J9P5yKINSs8vSgWEMSeLp6TLUkT6iX7B5hraqLDEZ1sBpln3O";
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL: [NSURL URLWithString: indexURL]];
    NSOperationQueue *defaultQueue = [NSOperationQueue mainQueue];
    
    [NSURLConnection sendAsynchronousRequest: request
                                       queue: defaultQueue
                           completionHandler: ^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               if(connectionError) {
                                   // Call callback with connection error
                               } else {
                                   NSError *parsingError;
                                   NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData: data
                                                                                                options: kNilOptions
                                                                                                  error: &parsingError];
                                   if(parsingError) {
                                       // Call callback with parsing error
                                   } else {
                                       NSArray *rawObjects = [responseData objectForKey: @"Items"];
                                       NSMutableArray *objects = [[NSMutableArray alloc] init];
                                       for(id thing in rawObjects) {
                                           [objects addObject: [[TWAObject alloc] initWithDictionary: thing]];
                                       }
                                       callback(objects);
                                   }
                               }
                           }];
}

@end