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

+ (void) fetchJSONDataAtURL: (NSURL *) dataURL returningResultsTo: (void(^)(NSURLResponse*, id, NSError*)) callback {
    
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    AFURLSessionManager *sessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
//
//    NSURLRequest *request = [NSURLRequest requestWithURL: dataURL];
//    NSURLSessionDataTask *dataTask = [sessionManager dataTaskWithRequest:request completionHandler:callback];
//    [dataTask resume];
}

@end