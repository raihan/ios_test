//
//  iosTestTests.h
//  iosTestTests
//
//  Created by Abdullah Md. Zubair on 2/16/13.
//  Copyright (c) 2013 Abdullah Md. Zubair. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "CoreDataMeanagerTests.h"

@interface CoreDataMeanagerTests : SenTestCase

- (void) testSaveFileContentToCoreData;

- (void) testLoadContentsFromCoreData;

- (void) testLoadNumRowsCount;

@end
