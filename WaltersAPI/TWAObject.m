//
//  TWAObject.m
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import "TWAObject.h"

@implementation TWAObject

+ (void) fetchPage: (int) pageNumber withPageSize: (int) pageSize completion: (void(^)(NSArray*)) callback {

    NSURL *indexURL = [NSURL URLWithString: @"http://api.thewalters.org/v1/objects?apikey=sOK3xgGkv3ooeK4J9P5yKINSs8vSgWEMSeLp6TLUkT6iX7B5hraqLDEZ1sBpln3O"];
    [TWABase fetchJSONDataAtURL: indexURL returningResultsTo: ^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            callback([[NSArray alloc] init]);
        } else {
            NSLog(@"%@ %@", response, responseObject);
            callback([[NSArray alloc] init]);
        }
    }];
}

@end