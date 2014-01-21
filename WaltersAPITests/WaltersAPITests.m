//
//  WaltersAPITests.m
//  WaltersAPITests
//
//  Created by Ed Schmalzle on 1/20/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TWAClient.h"

@interface WaltersAPITests : XCTestCase

@end

@implementation WaltersAPITests {
    TWAClient *testClient;
}

- (void)setUp {
    [super setUp];
    testClient = [[TWAClient alloc] initWithAPIKey: @"sOK3xgGkv3ooeK4J9P5yKINSs8vSgWEMSeLp6TLUkT6iX7B5hraqLDEZ1sBpln3O"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGetObjects {

    __block BOOL stopper = true;
    __block NSArray *resultArray;

    [testClient getObjectsOnPage: 1 withPageSize: 10 completion: ^(NSArray *objectArray) {
        stopper = false;
        resultArray = objectArray;
    }];

    while(stopper) {

    }

    NSLog(@"%@", resultArray);
}

@end