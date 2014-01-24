//
//  TWARequestOptions.m
//  WaltersAPISampleApplication
//
//  Created by Ed Schmalzle on 1/23/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import "TWARequestOptions.h"

@implementation TWARequestOptions {
    NSArray *validKeyList;
    NSMutableDictionary *options;
}

- (id) initWithDictionary: (NSDictionary*) aDict {
    self = [super init];
    if(self) {
        options = [[NSMutableDictionary alloc] initWithDictionary: aDict];
    }
    return self;
}

- (NSDictionary*) toDictionary {
    return options;
}

- (NSArray*) validKeys {
    if(!validKeyList) {
        validKeyList = [[NSArray alloc] initWithObjects: @"apikey", @"page", @"pagesize", nil];
    }
    return validKeyList;
}

- (BOOL) setOptionWithKey: (NSString*) key andValue: (NSString*) value {
    if([[self validKeys] containsObject: key]) {
        if(!options) {options = [[NSMutableDictionary alloc] init];}
        [options setObject: value forKey: key];
        return TRUE;
    } else {
        return FALSE;
    }
}

@end