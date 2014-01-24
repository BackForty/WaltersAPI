//
//  TWABase.m
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import "TWABase.h"

@implementation TWABase

- (id)initWithDictionary: (NSDictionary*) attributeDict {
    self = [super init];
    if(self) {
        for(NSString *key in [attributeDict keyEnumerator]) {
            NSString *cased = [NSString stringWithFormat:@"%@%@", [[key substringToIndex:1] lowercaseString],
                               [key substringFromIndex:1]];
            [self setValue:attributeDict[key] forKey:cased];
        }
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"ignoring undefined key:value => %@: %@", key, value);
}

+ (NSURLRequest*) requestForPath: (NSString*) resourcePath withRequestOptions: (TWARequestOptions*) requestOptions {
    NSURL *baseURL = [[NSURL alloc] initWithString: @"http://api.thewalters.org"];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithDictionary: [requestOptions toDictionary]];
    
    NSMutableString *versionedResourcePath = [[NSMutableString alloc] initWithString: @"/v1"];
    [versionedResourcePath appendString: resourcePath];
    NSString *pathWithParams = [self resourcePath: versionedResourcePath withParameters: parameters];
    NSURL *requestURL = [[NSURL alloc] initWithString: pathWithParams relativeToURL: baseURL];
    
    return [[NSURLRequest alloc] initWithURL: requestURL];
}

+ (NSString*) resourcePath: (NSString*) resourcePath withParameters: (NSDictionary*) parameters {
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

+ (void) fetchDataWithRequest: (NSURLRequest *) request onSuccess: (void(^)(NSDictionary* responseData)) successBlock fail: (void(^)(NSURLResponse* response, NSError* error)) failureBlock {
    [NSURLConnection sendAsynchronousRequest: request
                                       queue: [NSOperationQueue mainQueue]
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
                                       successBlock(responseData);
                                   }
                               }
                           }];
}

+ (void) fetchItemsWithRequest: (NSURLRequest *) request onSuccess: (void(^)(NSArray* items)) successBlock fail: (void(^)(NSURLResponse* response, NSError* error)) failureBlock {
    [self fetchDataWithRequest: request
                     onSuccess: ^(NSDictionary* responseData) {
                         NSArray *rawObjects = [responseData objectForKey: @"Items"];
                         successBlock([self buildItemListFromJSON: rawObjects]);
                     }
                          fail: failureBlock];
}

+ (void) fetchItemWithRequest: (NSURLRequest *) request onSuccess: (void(^)(id item)) successBlock fail: (void(^)(NSURLResponse* response, NSError* error)) failureBlock {
    [self fetchDataWithRequest: request
                     onSuccess: ^(NSDictionary* responseData) {
                         NSDictionary *objectAttributes = [responseData objectForKey: @"Data"];
                         successBlock([[self alloc] initWithDictionary: objectAttributes]);
                     }
                          fail: failureBlock];
}

+(void) getAllUsingOptions: (TWARequestOptions*) requestOptions onSuccess: (void(^)(NSArray* items)) successBlock fail: (void(^)(NSURLResponse* response, NSError* error)) failureBlock {
    NSURLRequest *request = [self requestForPath:[self collectionPath] withRequestOptions: requestOptions];
    [self fetchItemsWithRequest: request onSuccess: successBlock fail: failureBlock];
}

+ (void) getByID: (NSString*) objectID withRequestOptions: (TWARequestOptions*) requestOptions onSuccess: (void(^)(id item)) successBlock fail: (void(^)(NSURLResponse* response, NSError* error)) failureBlock {
    NSURLRequest *request = [self requestForPath: [self itemPathWithID: objectID] withRequestOptions: requestOptions];
    [self fetchItemWithRequest: request onSuccess: successBlock fail: failureBlock];
}


+ (NSArray*) buildItemListFromJSON: (NSArray*) rawObjects {
    NSMutableArray *objects = [[NSMutableArray alloc] init];
    for(id thing in rawObjects) {
        [objects addObject: [[self alloc] initWithDictionary: thing]];
    }
    return objects;
}

+ (NSString *)collectionPath {
    NSLog(@"collectionPath: should be implemented by %@", self.class);
    return nil;
}

+ (NSString *)itemPathWithID: (NSString*) itemID {
    NSLog(@"itemPath: should be implemented by %@", self.class);
    return nil;
}

@end