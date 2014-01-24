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

- (id)initWithAPIKey: (NSString *) apiKey;

// Objects
- (void) getObjectsWithRequestOptions: (TWARequestOptions*) requestOptions success:(void(^)(NSArray*)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock;
- (void) getObjectByID: (NSString *) objectID onSuccess:(void(^)(id)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock;

// Collections
- (void) getCollectionsWithRequestOptions: (TWARequestOptions*) requestOptions success:(void(^)(NSArray*)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock;
- (void) getCollectionByID: (NSString *) objectID onSuccess:(void(^)(id)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock;

// Exhibitions
- (void) getExhibitionsWithRequestOptions: (TWARequestOptions*) requestOptions success:(void(^)(NSArray*)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock;
- (void) getExhibitionByID: (NSString *) objectID onSuccess:(void(^)(id)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock;

// Geographies
- (void) getGeographiesWithRequestOptions: (TWARequestOptions*) requestOptions success:(void(^)(NSArray*)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock;
- (void) getGeographyByID: (NSString *) objectID onSuccess:(void(^)(id)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock;

// Locations
- (void) getLocationsWithRequestOptions: (TWARequestOptions*) requestOptions success:(void(^)(NSArray*)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock;
- (void) getLocationByID: (NSString *) objectID onSuccess:(void(^)(id)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock;

@end