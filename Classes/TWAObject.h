//
//  TWAObject.h
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWABase.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>

@interface TWAObject : TWABase

- (void) fetchPage: (int) pageNumber withPageSize: (int) pageSize completion: (void(^)(NSArray*)) callback;

@end