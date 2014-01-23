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

- (id) initWithDictionary: (NSDictionary*) attributeDict;

@property NSString* classification;

@end
