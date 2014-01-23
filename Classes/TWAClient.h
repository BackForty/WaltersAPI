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

@interface TWAClient : NSObject

extern NSString *const BaseURL;

- (id)initWithAPIKey: (NSString *) apiKey;

- (void) getObjectsOnPage: (int) pageNumber withPageSize: (int) pageSize completion:(void(^)(NSArray*))callback;
- (void) getObjectByID: (NSString *) objectID completion:(void(^)(TWAImage*))callback;

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