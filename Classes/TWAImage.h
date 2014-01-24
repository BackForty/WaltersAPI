//
//  TWAImage.h
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWABase.h"

@interface TWAImage : TWABase

@property (nonatomic, assign) BOOL isPrimary;
@property (nonatomic, assign) double mediaXrefID;
@property (nonatomic, assign) double objectID;
@property (nonatomic, assign) double rank;
@property (nonatomic, strong) NSString *filename;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSString *mediaType;
@property (nonatomic, strong) NSString *mediaView;

@end
