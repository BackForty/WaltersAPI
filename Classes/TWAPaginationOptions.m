//
//  TWAPaginationOptions.m
//  WaltersAPISampleApplication
//
//  Created by Ed Schmalzle on 1/23/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import "TWAPaginationOptions.h"

@implementation TWAPaginationOptions

+ (TWAPaginationOptions*) defaultPaginationOptions {
    return [[TWAPaginationOptions alloc] initWithPage: 1 andPageSize: 25];
}

- (id) initWithPage: (int) aPage andPageSize: (int) aPageSize {
    self = [super init];
    if(self) {
        self.page = aPage;
        self.pageSize = aPageSize;
    }
    return self;
}

- (NSDictionary*) toDictionary {
    NSArray *keys = [[NSArray alloc] initWithObjects: @"Page", @"pageSize", nil];
    NSArray *values = [[NSArray alloc] initWithObjects: [@(self.page) description], [@(self.pageSize) description], nil];
    return [[NSDictionary alloc] initWithObjects: values forKeys: keys];
}

@end