//
//  TWABase.h
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <AFNetworking/AFURLSessionManager.h>

@interface TWABase : NSObject

- (id)initWithAPIKey: (NSString *) someAPIKey;
+ (void) fetchJSONDataAtURL: (NSURL *) dataURL returningResultsTo: (void(^)(NSURLResponse*, id, NSError*)) callback;

@end