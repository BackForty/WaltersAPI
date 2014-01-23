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

- (void) getAllUsingPaginationOptions: (TWAPaginationOptions*) paginationOptions onSuccess: (void(^)(NSArray* items)) successBlock fail: (void(^)(NSURLResponse* response, NSError* error)) failureBlock {
    NSURLRequest *request = [self requestForPath: @"/objects" withPaginationOptions: paginationOptions];
    
    [NSURLConnection sendAsynchronousRequest: request
                                       queue: [self operationQueue]
                           completionHandler: ^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               if(connectionError) {
                                   failureBlock(response, connectionError);
                               } else {
                                   NSError *parsingError;
                                   NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData: data
                                                                                                options: kNilOptions
                                                                                                  error: &parsingError];
                                   if(parsingError) {
                                       failureBlock(response, parsingError);
                                   } else {
                                       NSArray *rawObjects = [responseData objectForKey: @"Items"];
                                       NSMutableArray *objects = [[NSMutableArray alloc] init];
                                       for(id thing in rawObjects) {
                                           [objects addObject: [[TWAObject alloc] initWithDictionary: thing]];
                                       }
                                       successBlock(objects);
                                   }
                               }
                           }];
}

@end