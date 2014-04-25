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

- (void) fetchCollectionForClass: (NSString*) receiverClassName withRequestionOptions: (TWARequestOptions*) requestOptions success: (TWAClientCollectionSuccess) successBlock fail: (TWAClientFailure) failureBlock {
  
    [requestOptions setOption: @"apikey" withValue: apiKey];
    Class receiver = NSClassFromString(receiverClassName);
    [receiver getAllUsingOptions: requestOptions onSuccess: successBlock fail: failureBlock];
}

- (void) fetchSingleInstanceForClass: (NSString*) receiverClassName withID: (NSString*) ID success: (TWAClientObjectSuccess) successBlock fail: (TWAClientFailure) failureBlock{

    TWARequestOptions *requestOptions = [[TWARequestOptions alloc] init];
    [requestOptions setOption: @"apikey" withValue: apiKey];
    Class receiver = NSClassFromString(receiverClassName);
    [receiver getByID: ID withRequestOptions: requestOptions onSuccess: successBlock fail: failureBlock];
}

- (void) getObjectsWithRequestOptions: (TWARequestOptions*) requestOptions success:(TWAClientCollectionSuccess) successBlock fail: (TWAClientFailure) failureBlock {
  
    [self fetchCollectionForClass: @"TWAObject" withRequestionOptions: requestOptions success: successBlock fail: failureBlock];
}

- (void) getObjectByID: (NSString *) objectID onSuccess:(TWAClientObjectSuccess) successBlock fail: (TWAClientFailure) failureBlock {
  
    [self fetchSingleInstanceForClass: @"TWAObject" withID: objectID success: successBlock fail: failureBlock];
}

- (void) getCollectionsWithRequestOptions: (TWARequestOptions*) requestOptions success:(TWAClientCollectionSuccess) successBlock fail: (TWAClientFailure) failureBlock {
  
    [self fetchCollectionForClass: @"TWACollection" withRequestionOptions: requestOptions success: successBlock fail: failureBlock];
}

- (void) getCollectionByID: (NSString *) objectID onSuccess:(TWAClientObjectSuccess) successBlock fail: (TWAClientFailure) failureBlock {
  
    [self fetchSingleInstanceForClass: @"TWACollection" withID: objectID success: successBlock fail: failureBlock];
}

- (void) getExhibitionsWithRequestOptions: (TWARequestOptions*) requestOptions success:(TWAClientCollectionSuccess) successBlock fail: (TWAClientFailure) failureBlock {
  
    [self fetchCollectionForClass: @"TWAExhibition" withRequestionOptions: requestOptions success: successBlock fail: failureBlock];
}

- (void) getExhibitionByID: (NSString *) objectID onSuccess:(TWAClientObjectSuccess) successBlock fail: (TWAClientFailure) failureBlock {
  
    [self fetchSingleInstanceForClass: @"TWAExhibition" withID: objectID success: successBlock fail: failureBlock];
}

- (void) getGeographiesWithRequestOptions: (TWARequestOptions*) requestOptions success:(TWAClientCollectionSuccess) successBlock fail: (TWAClientFailure) failureBlock {
  
    [self fetchCollectionForClass: @"TWAGeography" withRequestionOptions: requestOptions success: successBlock fail: failureBlock];
}

- (void) getGeographyByID: (NSString *) objectID onSuccess:(TWAClientObjectSuccess) successBlock fail: (TWAClientFailure) failureBlock {
  
    [self fetchSingleInstanceForClass: @"TWAGeography" withID: objectID success: successBlock fail: failureBlock];
}

- (void) getLocationsWithRequestOptions: (TWARequestOptions*) requestOptions success:(TWAClientCollectionSuccess) successBlock fail: (TWAClientFailure) failureBlock {
  
    [self fetchCollectionForClass: @"TWALocation" withRequestionOptions: requestOptions success: successBlock fail: failureBlock];
}

- (void) getLocationByID: (NSString *) objectID onSuccess:(TWAClientObjectSuccess) successBlock fail: (TWAClientFailure) failureBlock {
  
    [self fetchSingleInstanceForClass: @"TWALocation" withID: objectID success: successBlock fail: failureBlock];
}

@end
