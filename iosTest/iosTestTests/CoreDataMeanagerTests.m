//
//  iosTestTests.m
//  iosTestTests
//
//  Created by Abdullah Md. Zubair on 2/16/13.
//  Copyright (c) 2013 Abdullah Md. Zubair. All rights reserved.
//

#import "CoreDataMeanagerTests.h"
#import "Constants.h"
#import "CoreDataManager.h"
#import "UserDefaultManager.h"

@implementation CoreDataMeanagerTests

CoreDataManager *coreDataManager;
UserDefaultManager *userDefaultManager;

- (void)setUp
{
    [super setUp];
    // Set-up code here.
    
    coreDataManager = [[CoreDataManager alloc] init];
    userDefaultManager = [[UserDefaultManager alloc] init];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void) testSaveFileContentToCoreData
{
    Content *aContent = [[Content alloc] init];
    if (![userDefaultManager readStringFromUserDefaults:@"savedDataToCoreData"])
    {
        STAssertTrue([coreDataManager saveFileContent:aContent :entitiesNameOfMyFiles], @"Save a content to core data");
    }
    else
    {
        [userDefaultManager writeToUserDefaults:@"savedDataToCoreData" withString:@"savedDataToCoreData"];
    }
}

- (void) testLoadContentsFromCoreData
{
    STAssertTrue([[coreDataManager loadContentsForEntity:entitiesNameOfMyFiles :0] isKindOfClass:[NSMutableArray class]], @"Retrieve data from core data");
}

- (void) testLoadNumRowsCount
{
    if ([userDefaultManager readStringFromUserDefaults:@"savedDataToCoreData"])
    {
        STAssertTrue([coreDataManager getRowCount:entitiesNameOfMyFiles], @"Number of rows not nil");
    }
}

@end
