//
//  TWAExhibition.h
//  WaltersAPI
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWABase.h"

@interface TWAExhibition : TWABase

@property (nonatomic, assign) BOOL nonWAMExhibition;
@property (nonatomic, assign) double exhibBeginYear;
@property (nonatomic, assign) double exhibEndYear;
@property (nonatomic, assign) double exhibitionID;
@property (nonatomic, strong) NSString *exhTitle;
@property (nonatomic, strong) NSString *exhibBeginDate;
@property (nonatomic, strong) NSString *exhibDisplayDate;
@property (nonatomic, strong) NSString *exhibEndDate;
@property (nonatomic, strong) NSString *locationID; // TODO CHECK TYPE
@property (nonatomic, strong) NSString *textblock;

@end
