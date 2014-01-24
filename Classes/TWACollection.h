//
//  TWACollection.h
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWABase.h"

@interface TWACollection : TWABase

@property (nonatomic, assign) double collectionID;
@property (nonatomic, assign) double numObjects;
@property (nonatomic, strong) NSString *collDescription;
@property (nonatomic, strong) NSString *collectionName;

@end
