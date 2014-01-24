//
//  TWAGeography.m
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import "TWAGeography.h"

@implementation TWAGeography

+ (NSString *)collectionPath {
    return @"/geographies";
}

+ (NSString *)itemPathWithID: (NSString*) itemID {
    NSMutableString *path = [[NSMutableString alloc] initWithString: @"/geographies/"];
    [path appendString: itemID];
    return path;
}
@end