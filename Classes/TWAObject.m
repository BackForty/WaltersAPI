//
//  TWAObject.m
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import "TWAObject.h"

@implementation TWAObject

+ (NSString *)collectionPath {
    return @"/objects";
}

- (void)setValue:(id)value forKey:(NSString *)key {
    if([key isEqualToString:@"collection"]) {
        if([NSStringFromClass([value class]) isEqualToString:@"__NSCFString"]) {
            self.collectionName = (NSString *)value;
        } else {
            self.collectionName = [value objectForKey:@"Name"];
            self.collectionID = [value objectForKey:@"CollectionID"];
        }
    }
    else if([key isEqualToString:@"museumLocation"]) {
        self.museumLocationName = [value objectForKey:@"DisplayCurrentLocation"];
        self.museumLocationID = [value objectForKey:@"LocationID"];
    } else {
        [super setValue: value forKey: key];
    }
}

+ (NSString *)itemPathWithID: (NSString*) itemID {
    NSMutableString *path = [[NSMutableString alloc] initWithString: @"/objects/"];
    [path appendString: itemID];
    return path;
}

- (void) primaryImageOnSuccess: (void(^)(UIImage *primaryImage)) successBlock onFail: (void(^)(NSError* error)) failureBlock {
    NSURL *baseURL = [[NSURL alloc] initWithString: [self.primaryImage objectForKey: @"Large"]];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL: baseURL];
    [NSURLConnection sendAsynchronousRequest: request
                                       queue: [NSOperationQueue mainQueue]
                           completionHandler: ^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               if(connectionError) {
                                   failureBlock(connectionError);
                               } else {
                                   UIImage *primary = [[UIImage alloc] initWithData: data];
                                   successBlock(primary);
                               }
                           }];
}

@end