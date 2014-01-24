//
//  TWAObject.h
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWABase.h"

@interface TWAObject : TWABase

@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *inscriptions;
@property (nonatomic, strong) NSString *primaryImage;
@property (nonatomic, strong) NSString *reign;
@property (nonatomic, strong) NSString *style;
@property (nonatomic, assign) double collectionID;
@property (nonatomic, assign) double dateBeginYear;
@property (nonatomic, assign) double dateEndYear;
@property (nonatomic, assign) double objectID;
@property (nonatomic, assign) double onView;
@property (nonatomic, strong) NSString *classification;
@property (nonatomic, strong) NSString *collection;
@property (nonatomic, strong) NSString *creator;
@property (nonatomic, strong) NSString *creditLine;
@property (nonatomic, strong) NSString *culture;
@property (nonatomic, strong) NSString *dateText;
@property (nonatomic, strong) NSString *dimensions;
@property (nonatomic, strong) NSString *dynasty;
@property (nonatomic, strong) NSString *exhibIDs;
@property (nonatomic, strong) NSString *geoIDs;
@property (nonatomic, strong) NSString *images;
@property (nonatomic, strong) NSString *keywords;
@property (nonatomic, strong) NSString *medium;
@property (nonatomic, strong) NSString *objectName;
@property (nonatomic, strong) NSString *objectNumber;
@property (nonatomic, strong) NSString *period;
@property (nonatomic, strong) NSString *provenance;
@property (nonatomic, strong) NSString *publicAccessDate;
@property (nonatomic, strong) NSString *resourceURL;
@property (nonatomic, strong) NSString *sortNumber;
@property (nonatomic, strong) NSString *title;


@end