//
//  JsonDataManagerTests.m
//  iosTest
//
//  Created by Abdullah Md. Zubair on 2/21/13.
//  Copyright (c) 2013 Abdullah Md. Zubair. All rights reserved.
//

#import "JsonDataManagerTests.h"

@implementation JsonDataManagerTests

JsonDataManager *jsonDataManager;

- (void)setUp
{
    [super setUp];
    // Set-up code here.
    jsonDataManager = [[JsonDataManager alloc] init];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

-(void) testParseJsonData
{
    STAssertTrue([[jsonDataManager parseJsonData] isKindOfClass:[FileDrive class]], @"Fetch json from an URL and Parsing json data failed");
}

-(void) testGetNestedKeyVal
{
    NSDictionary *aDictionary = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"a",@"b",@"c", nil] forKeys:[NSArray arrayWithObjects:@"x",@"y",@"z", nil]];
    STAssertTrue([[jsonDataManager getNestedKeyVal:aDictionary key1:@"x" key2:nil key3:nil] isKindOfClass:[NSString class]], @"Get nested key value");
}

-(void) testParseContentData
{
    NSDictionary *aDictionary = [[NSDictionary alloc] init];
    STAssertTrue([[jsonDataManager parseContentData:aDictionary] isKindOfClass:[Content class]], @"Parse content and map them to business objects");
}

@end
