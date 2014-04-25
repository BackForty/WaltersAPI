//
//  TWAClient.h
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWAObject.h"
#import "TWACollection.h"
#import "TWAExhibition.h"
#import "TWAGeography.h"
#import "TWAImage.h"
#import "TWALocation.h"
#import "TWARequestOptions.h"

@interface TWAClient : NSObject

extern NSString *const BaseURL;

typedef void (^TWAClientCollectionSuccess)(NSArray* collection);
typedef void (^TWAClientObjectSuccess)(id object);
typedef void (^TWAClientFailure)(NSURLResponse *response, NSError *error);

- (id)initWithAPIKey: (NSString *) apiKey;

// Objects
- (void) getObjectsWithRequestOptions: (TWARequestOptions*) requestOptions success:(TWAClientCollectionSuccess) successBlock fail: (TWAClientFailure) failureBlock;
- (void) getObjectByID: (NSString *) objectID onSuccess:(TWAClientObjectSuccess) successBlock fail: (TWAClientFailure) failureBlock;

// Collections
- (void) getCollectionsWithRequestOptions: (TWARequestOptions*) requestOptions success:(TWAClientCollectionSuccess) successBlock fail: (TWAClientFailure) failureBlock;
- (void) getCollectionByID: (NSString *) objectID onSuccess:(TWAClientObjectSuccess) successBlock fail: (TWAClientFailure) failureBlock;

// Exhibitions
- (void) getExhibitionsWithRequestOptions: (TWARequestOptions*) requestOptions success:(TWAClientCollectionSuccess) successBlock fail: (TWAClientFailure) failureBlock;
- (void) getExhibitionByID: (NSString *) objectID onSuccess:(TWAClientObjectSuccess) successBlock fail: (TWAClientFailure) failureBlock;

// Geographies
- (void) getGeographiesWithRequestOptions: (TWARequestOptions*) requestOptions success:(TWAClientCollectionSuccess) successBlock fail: (TWAClientFailure) failureBlock;
- (void) getGeographyByID: (NSString *) objectID onSuccess:(TWAClientObjectSuccess) successBlock fail: (TWAClientFailure) failureBlock;

// Locations
- (void) getLocationsWithRequestOptions: (TWARequestOptions*) requestOptions success:(TWAClientCollectionSuccess) successBlock fail: (TWAClientFailure) failureBlock;
- (void) getLocationByID: (NSString *) objectID onSuccess:(TWAClientObjectSuccess) successBlock fail: (TWAClientFailure) failureBlock;

@end