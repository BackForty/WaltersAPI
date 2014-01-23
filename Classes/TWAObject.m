//
//  TWAObject.m
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import "TWAObject.h"

@implementation TWAObject

- (id) initWithDictionary: (NSDictionary*) attributeDict {
    self = [super init];
    if(self) {
        self.classification = [attributeDict objectForKey: @"Classification"];
    }
    return self;
}

- (NSString *)collectionPath {
    return @"/objects";
}

- (NSArray*) buildItemListFromJSON: (NSArray*) rawObjects {
    NSMutableArray *objects = [[NSMutableArray alloc] init];
    for(id thing in rawObjects) {
        [objects addObject: [[TWAObject alloc] initWithDictionary: thing]];
    }
    return objects;
}

@end