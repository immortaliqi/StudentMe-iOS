//
//  StudentMe_iOSTests.m
//  StudentMe-iOSTests
//
//  Created by SeanChense on 15/7/25.
//  Copyright (c) 2015年 UESTC-BBS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSURL+SMURL.h"

@interface StudentMe_iOSTests : XCTestCase

@end

@implementation StudentMe_iOSTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


- (void)testUrlTools {
    NSString *login = [NSURL smLoginString];
    NSLog(@"user login url is %@", login);
}

@end
