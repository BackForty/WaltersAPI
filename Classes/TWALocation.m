//
//  TWALocation.m
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import "TWALocation.h"

@implementation TWALocation

+ (NSString *)collectionPath {
    return @"/museum/locations";
}

+ (NSString *)itemPathWithID: (NSString*) itemID {
    NSMutableString *path = [[NSMutableString alloc] initWithString: @"/museum/locations/"];
    [path appendString: itemID];
    return path;
}

@end