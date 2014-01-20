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
    testClient = [[TWAClient alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGetObjects {
    NSArray *objectResults = [testClient getObjects];
}

@end
