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

- (NSURLRequest*) requestForPath: (NSString*) resourcePath withPaginationOptions: (TWARequestOptions*) paginationOptions {
    NSURL *baseURL = [[NSURL alloc] initWithString: @"http://api.thewalters.org"];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithDictionary: [paginationOptions toDictionary]];
    [parameters setObject: apiKey forKey: @"apiKey"];
    
    NSMutableString *versionedResourcePath = [[NSMutableString alloc] initWithString: @"/v1"];
    [versionedResourcePath appendString: resourcePath];
    NSString *pathWithParams = [self resourcePath: versionedResourcePath withParameters: parameters];
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

- (void) fetchItemsWithRequest: (NSURLRequest *) request onSuccess: (void(^)(NSArray* items)) successBlock fail: (void(^)(NSURLResponse* response, NSError* error)) failureBlock {
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
                                       successBlock([self buildItemListFromJSON: rawObjects]);
                                   }
                               }
                           }];
}

- (void) getAllUsingPaginationOptions: (TWARequestOptions*) paginationOptions onSuccess: (void(^)(NSArray* items)) successBlock fail: (void(^)(NSURLResponse* response, NSError* error)) failureBlock {
    NSURLRequest *request = [self requestForPath:[self collectionPath] withPaginationOptions: paginationOptions];
    [self fetchItemsWithRequest: request onSuccess: successBlock fail: failureBlock];
}

- (NSArray*) buildItemListFromJSON: (NSArray*) rawObjects {
    NSLog(@"buildItemListFromJSON: should be implemented by %@", self.class);
    return nil;
}

- (NSString *)collectionPath {
    NSLog(@"collectionPath: should be implemented by %@", self.class);
    return nil;
}

@end