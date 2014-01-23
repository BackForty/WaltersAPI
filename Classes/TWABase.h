//
//  TWABase.h
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWAPaginationOptions.h"

@interface TWABase : NSObject

- (id)initWithAPIKey: (NSString *) someAPIKey;
- (NSOperationQueue*) operationQueue;
- (NSURLRequest*) requestForPath: (NSString*) resourcePath withPaginationOptions: (TWAPaginationOptions*) paginationOptions;
- (NSString*) resourcePath: (NSString*) resourcePath withParameters: (NSDictionary*) parameters;

@end