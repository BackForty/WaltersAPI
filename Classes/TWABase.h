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

- (id)initWithAPIKey: (NSString *) someAPIKey;
- (NSOperationQueue*) operationQueue;
- (NSURLRequest*) requestForPath: (NSString*) resourcePath withPaginationOptions: (TWARequestOptions*) paginationOptions;
- (NSString*) resourcePath: (NSString*) resourcePath withParameters: (NSDictionary*) parameters;
- (void) fetchItemsWithRequest: (NSURLRequest *) request onSuccess: (void(^)(NSArray* items)) successBlock fail: (void(^)(NSURLResponse* response, NSError* error)) failureBlock;
- (void) getAllUsingPaginationOptions: (TWARequestOptions*) paginationOptions onSuccess: (void(^)(NSArray* items)) successBlock fail: (void(^)(NSURLResponse* response, NSError* error)) failureBlock;

// Should be implemented by subclass
- (NSArray*) buildItemListFromJSON: (NSArray*) rawObjects;

@end