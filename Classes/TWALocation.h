//
//  TWALocation.h
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWABase.h"

@interface TWALocation : TWABase

@property (nonatomic, assign) BOOL publicAccess;
@property (nonatomic, assign) double locationID;
@property (nonatomic, strong) NSString *displayCurrentLocation;
@property (nonatomic, strong) NSString *room; // TODO CHECK TYPE
@property (nonatomic, strong) NSString *site; // TODO CHECK TYPE
@property (nonatomic, strong) NSString *unitType; // TODO CHECK TYPE

@end
