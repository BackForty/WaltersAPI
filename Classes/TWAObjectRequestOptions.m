//
//  TWAObjectRequestOptions.m
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/25/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import "TWAObjectRequestOptions.h"

@implementation TWAObjectRequestOptions
- (NSArray*) validKeys {
    if(!validKeyList) {
        NSMutableArray *keyList = [[NSMutableArray alloc] initWithArray: [super validKeys]];
        [keyList addObjectsFromArray: [[NSArray alloc] initWithObjects: @"keyword", @"name", @"creator", @"collectionID", @"yearBegin", @"yearEnd", @"classification", @"medium", @"orderBy", @"imageType", nil]];
        validKeyList = [[NSArray alloc] initWithArray: keyList];
    }
    
    return validKeyList;
}
@end