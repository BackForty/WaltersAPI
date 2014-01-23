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
    NSNumber *currentPage = [NSNumber numberWithInt: self.page];
    NSNumber *currentPageSize = [NSNumber numberWithInt: self.pageSize];
    return [[NSDictionary alloc] initWithObjects: [[NSArray alloc] initWithObjects: @"Page", @"pageSize", nil]  forKeys: [[NSArray alloc] initWithObjects: currentPage, currentPageSize, nil]];
}

@end