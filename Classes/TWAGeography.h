//
//  TWAGeography.h
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWABase.h"

@interface TWAGeography : TWABase

@property (nonatomic, assign) double geographyID;
@property (nonatomic, assign) double latitudeNumber;
@property (nonatomic, assign) double longitudeNumber;
@property (nonatomic, strong) NSString *geoHierarchy;
@property (nonatomic, strong) NSString *geoType;
@property (nonatomic, strong) NSString *geographyTerm;
@property (nonatomic, strong) NSString *latitude; // TODO CHECK TYPE
@property (nonatomic, strong) NSString *latitudeDirection; // TODO CHECK TYPE
@property (nonatomic, strong) NSString *longitude; // TODO CHECK TYPE
@property (nonatomic, strong) NSString *longitudeDirection; // TODO CHECK TYPE

@end
