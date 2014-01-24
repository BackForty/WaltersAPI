//
//  TWACollection.m
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import "TWACollection.h"

@implementation TWACollection

+ (NSString *)collectionPath {
    return @"/collections";
}

+ (NSString *)itemPathWithID: (NSString*) itemID {
    NSMutableString *path = [[NSMutableString alloc] initWithString: @"/collections/"];
    [path appendString: itemID];
    return path;
}

@end