//
//  TWAExhibition.m
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import "TWAExhibition.h"

@implementation TWAExhibition

+ (NSString *)collectionPath {
    return @"/exhibitions";
}

+ (NSString *)itemPathWithID: (NSString*) itemID {
    NSMutableString *path = [[NSMutableString alloc] initWithString: @"/exhibitions/"];
    [path appendString: itemID];
    return path;
}

@end