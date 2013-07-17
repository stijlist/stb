//
//  STBGradeCollectionTest.m
//  Set The Bar
//
//  Created by Bert Muthalaly on 7/15/13.
//  Copyright (c) 2013 Bert Muthalaly. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "STBGradeCollection.h"

@interface STBGradeCollectionTest : XCTestCase

@end

@implementation STBGradeCollectionTest

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    STBGradeCollection *collection = [[STBGradeCollection alloc] init];
    
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
