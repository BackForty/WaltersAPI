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

- (void) getObjectsWithRequestOptions: (TWARequestOptions*) requestOptions success:(void(^)(NSArray*)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock {
    
    [requestOptions setOption: @"apikey" withValue: apiKey];
    [TWAObject getAllUsingOptions: requestOptions onSuccess: successBlock fail: failureBlock];
}

- (void) getObjectByID: (NSString *) objectID onSuccess:(void(^)(id)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock {
    
    TWARequestOptions *requestOptions = [[TWARequestOptions alloc] init];
    [requestOptions setOption: @"apikey" withValue: apiKey];
    [TWAObject getByID: objectID withRequestOptions: requestOptions onSuccess: successBlock fail: failureBlock];
}

- (void) getCollectionsWithRequestOptions: (TWARequestOptions*) requestOptions success:(void(^)(NSArray*)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock {
    
    [requestOptions setOption: @"apikey" withValue: apiKey];
    [TWACollection getAllUsingOptions: requestOptions onSuccess: successBlock fail: failureBlock];
}

- (void) getCollectionByID: (NSString *) objectID onSuccess:(void(^)(id)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock {
    
    TWARequestOptions *requestOptions = [[TWARequestOptions alloc] init];
    [requestOptions setOption: @"apikey" withValue: apiKey];
    [TWACollection getByID: objectID withRequestOptions: requestOptions onSuccess: successBlock fail: failureBlock];
}

- (void) getExhibitionsWithRequestOptions: (TWARequestOptions*) requestOptions success:(void(^)(NSArray*)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock {
    
    [requestOptions setOption: @"apikey" withValue: apiKey];
    [TWAExhibition getAllUsingOptions: requestOptions onSuccess: successBlock fail: failureBlock];
}

- (void) getExhibitionByID: (NSString *) objectID onSuccess:(void(^)(id)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock {
    
    TWARequestOptions *requestOptions = [[TWARequestOptions alloc] init];
    [requestOptions setOption: @"apikey" withValue: apiKey];
    [TWAExhibition getByID: objectID withRequestOptions: requestOptions onSuccess: successBlock fail: failureBlock];
}

- (void) getGeographiesWithRequestOptions: (TWARequestOptions*) requestOptions success:(void(^)(NSArray*)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock {
    
    [requestOptions setOption: @"apikey" withValue: apiKey];
    [TWAGeography getAllUsingOptions: requestOptions onSuccess: successBlock fail: failureBlock];
}

- (void) getGeographyByID: (NSString *) objectID onSuccess:(void(^)(id)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock {
    
    TWARequestOptions *requestOptions = [[TWARequestOptions alloc] init];
    [requestOptions setOption: @"apikey" withValue: apiKey];
    [TWAGeography getByID: objectID withRequestOptions: requestOptions onSuccess: successBlock fail: failureBlock];
}

- (void) getLocationsWithRequestOptions: (TWARequestOptions*) requestOptions success:(void(^)(NSArray*)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock {
    
    [requestOptions setOption: @"apikey" withValue: apiKey];
    [TWALocation getAllUsingOptions: requestOptions onSuccess: successBlock fail: failureBlock];
}

- (void) getLocationByID: (NSString *) objectID onSuccess:(void(^)(id)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock {
    
    TWARequestOptions *requestOptions = [[TWARequestOptions alloc] init];
    [requestOptions setOption: @"apikey" withValue: apiKey];
    [TWALocation getByID: objectID withRequestOptions: requestOptions onSuccess: successBlock fail: failureBlock];
}

@end
