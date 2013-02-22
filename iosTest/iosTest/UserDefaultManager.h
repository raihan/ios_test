//
//  UserDefaultManager.h
//  iosTest
//
//  Created by Abdullah Md. Zubair on 2/16/13.
//  Copyright (c) 2013 Abdullah Md. Zubair. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UserDefaultManager : NSObject {

}

- (NSMutableArray *) readArrayFromUserDefaults:(NSString*) keyName;
- (NSString *) readStringFromUserDefaults:(NSString*) keyName;
- (void) writeToUserDefaults:(NSString *) keyName withString:(NSString *) myString;
- (void) writeArrayToUserDefaults:(NSString *) keyName withArray:(NSMutableArray *) myArray;
- (void) removeFromDefault:(NSString *) keyName;
- (NSMutableArray *) readDataFromUserDefaults:(NSString*) keyName;
- (void) writeDataToUserDefaults:(NSString *) keyName withArray:(NSMutableArray *) myArray;

@end
