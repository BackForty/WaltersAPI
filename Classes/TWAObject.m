//
//  TWAObject.m
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import "TWAObject.h"

@implementation TWAObject

- (void) fetchPage: (int) pageNumber withPageSize: (int) pageSize completion: (void(^)(NSArray*)) callback {

    NSString *indexURL = @"http://api.thewalters.org/v1/objects?apikey=sOK3xgGkv3ooeK4J9P5yKINSs8vSgWEMSeLp6TLUkT6iX7B5hraqLDEZ1sBpln3O";
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET: indexURL parameters: nil success: ^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
//    NSLog(@"Done with that");
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL: [NSURL URLWithString: indexURL]];
    NSOperationQueue *defaultQueue = [NSOperationQueue mainQueue];
    [NSURLConnection sendAsynchronousRequest: request
                                       queue: defaultQueue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               NSLog(@"Well, mayber here?");
                               if(connectionError) {
                                   NSLog(@"Error: %@", connectionError);
                               } else {
                                   NSLog(@"JSON: %@", data);
                               }
                           }];
}

@end