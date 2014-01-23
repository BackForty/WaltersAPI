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

// Object methods
- (void) getObjectsWithRequestOptions: (TWARequestOptions*) requestOptions success:(void(^)(NSArray*)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock;
- (void) getObjectByID: (NSString *) objectID onSuccess:(void(^)(TWAObject*)) successBlock fail: (void(^)(NSURLResponse *response, NSError *error)) failureBlock;

- (NSArray *) getCollections;
- (TWACollection *) getCollectionByID: (NSString *) objectID;

- (NSArray *) getExhibitions;
- (TWAExhibition *) getExhibitionByID: (NSString *) objectID;

- (NSArray *) getGeographies;
- (TWAGeography *) getGeographyByID: (NSString *) objectID;

- (NSArray *) getImages;
- (TWAImage *) getImnageByID: (NSString *) objectID;

- (NSArray *) getLocations;
- (TWALocation *) getLocationByID: (NSString *) objectID;

@end