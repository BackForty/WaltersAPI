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

- (void) getObjectsWithPaginationOptions: (TWAPaginationOptions*) paginationOptions success:(void(^)(NSArray*)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock {
    
    TWAObject *twaObject = [[TWAObject alloc] initWithAPIKey: apiKey];
    [twaObject getAllUsingPaginationOptions: paginationOptions onSuccess: successBlock fail: failureBlock];
}

- (void) getObjectByID: (NSString *) objectID onSuccess:(void(^)(TWAObject*)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock {
    
}

- (void) getObjectsOnPage: (int) pageNumber withPageSize: (int) pageSize completion:(void(^)(NSArray*))callback {


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
