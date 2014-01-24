//
//  TWARequestOptions.h
//  WaltersAPISampleApplication
//
//  Created by Ed Schmalzle on 1/23/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWARequestOptions : NSObject

@property int pageSize;
@property int page;

- (id) initWithDictionary: (NSDictionary*) aDict;
- (NSDictionary*) toDictionary;
- (void) setOption: (NSString*) key withValue: (NSString*) value;

@end