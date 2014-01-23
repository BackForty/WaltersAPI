//
//  TWABase.m
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import "TWABase.h"

@implementation TWABase {
    NSString *apiKey;
}

- (id)initWithAPIKey: (NSString *) someAPIKey {
    self = [super init];
    
    if(self) {
        apiKey = someAPIKey;
        return self;
    } else {
        return nil;
    }
}

- (NSOperationQueue*) operationQueue {
    return [NSOperationQueue mainQueue];
}

- (NSURLRequest*) requestForPath: (NSString*) resourcePath withPaginationOptions: (TWAPaginationOptions*) paginationOptions {
    NSURL *baseURL = [[NSURL alloc] initWithString: @"http://api.thewalters.org/v1"];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithDictionary: [paginationOptions toDictionary]];
    [parameters setObject: apiKey forKey: @"apiKey"];
    
    NSString *pathWithParams = [self resourcePath: resourcePath withParameters: parameters];
    NSURL *requestURL = [[NSURL alloc] initWithString: pathWithParams relativeToURL: baseURL];
    
    return [[NSURLRequest alloc] initWithURL: requestURL];
}

- (NSString*) resourcePath: (NSString*) resourcePath withParameters: (NSDictionary*) parameters {
    NSMutableString *returnString = [[NSMutableString alloc] initWithString: resourcePath];
    
    if([parameters count] > 0) {
        [returnString appendString: @"?"];
        for(id key in parameters) {
            [returnString appendString: key];
            [returnString appendString: @"="];
            [returnString appendString: [parameters objectForKey: key]];
            [returnString appendString: @"&"];
        }
    }
    
    return returnString;
}

@end