//
//  TWAClient.m
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import "TWAClient.h"

NSString *const BaseURL = @"http://api.thewalters.org";

@implementation TWAClient {

    NSString *apiKey;
}

- (id)initWithAPIKey: (NSString *) someAPIKey {

    self = [super init];

    if(self) {
        apiKey = someAPIKey;
        return self;
    } else {
        return nil;
    }
}

- (void) getObjectsOnPage: (int) pageNumber withPageSize: (int) pageSize completion:(void(^)(NSArray*))callback {

    TWAObject *twaObject = [[TWAObject alloc] initWithAPIKey: apiKey];
    [twaObject fetchPage: pageNumber withPageSize: pageSize completion: callback];
}

- (void) getObjectByID: (NSString *) objectID completion:(void(^)(TWAImage*))callback {

}

- (NSArray *) getCollections {
    return nil;
}

- (TWACollection *) getCollectionByID: (NSString *) objectID {
    return nil;
}

- (NSArray *) getExhibitions {
    return nil;
}

- (TWAExhibition *) getExhibitionByID: (NSString *) objectID {
    return nil;
}

- (NSArray *) getGeographies {
    return nil;
}

- (TWAGeography *) getGeographyByID: (NSString *) objectID {
    return nil;
}

- (NSArray *) getImages {
    return nil;
}

- (TWAImage *) getImnageByID: (NSString *) objectID {
    return nil;
}

- (NSArray *) getLocations {
    return nil;
}

- (TWALocation *) getLocationByID: (NSString *) objectID {
    return nil;
}

@end
