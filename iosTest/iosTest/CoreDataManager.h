//
//  CoreDataManager.h
//  iosTest
//
//  Created by Abdullah Md. Zubair on 2/17/13.
//  Copyright (c) 2013 Abdullah Md. Zubair. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "FileDrive.h"
#import "Content.h"

@interface CoreDataManager : NSObject

- (BOOL)saveFileContent:(Content *)fileContents:(NSString *)entitiesName;
- (NSMutableArray *)loadContentsForEntity:(NSString *)entitiesName:(int)offset;
- (int)getRowCount:(NSString *)entityName;

@end
