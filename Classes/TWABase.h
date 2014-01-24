//
//  TWABase.h
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWARequestOptions.h"

@interface TWABase : NSObject

+ (NSURLRequest*) requestForPath: (NSString*) resourcePath withRequestOptions: (TWARequestOptions*) requestOptions;
+ (NSString*) resourcePath: (NSString*) resourcePath withParameters: (NSDictionary*) parameters;
+ (void) fetchDataWithRequest: (NSURLRequest *) request onSuccess: (void(^)(NSDictionary* responseData)) successBlock fail: (void(^)(NSURLResponse* response, NSError* error)) failureBlock;
+ (void) fetchItemsWithRequest: (NSURLRequest *) request onSuccess: (void(^)(NSArray* items)) successBlock fail: (void(^)(NSURLResponse* response, NSError* error)) failureBlock;
+ (void) fetchItemWithRequest: (NSURLRequest *) request onSuccess: (void(^)(NSArray* items)) successBlock fail: (void(^)(NSURLResponse* response, NSError* error)) failureBlock;

+ (void) getAllUsingOptions: (TWARequestOptions*) requestOptions onSuccess: (void(^)(NSArray* items)) successBlock fail: (void(^)(NSURLResponse* response, NSError* error)) failureBlock;

// Should be implemented by subclass
+ (NSArray*) buildItemListFromJSON: (NSArray*) rawObjects;
- (id) initWithDictionary: (NSDictionary*) attributeDictionary;
+ (NSString*) collectionPath;

@end