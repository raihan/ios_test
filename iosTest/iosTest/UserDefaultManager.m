//
//  UserDefaultManager.m
//  iosTest
//
//  Created by Abdullah Md. Zubair on 2/16/13.
//  Copyright (c) 2013 Abdullah Md. Zubair. All rights reserved.
//

#import "UserDefaultManager.h"
@implementation UserDefaultManager


- (NSString *) readStringFromUserDefaults:(NSString*) keyName
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSString *storedString = [defaults objectForKey:keyName];
	[defaults synchronize];
	return storedString;
}
- (NSMutableArray *) readArrayFromUserDefaults:(NSString*) keyName
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSMutableArray *storedArray = [defaults objectForKey:keyName];
	[defaults synchronize];
	return storedArray;
}

- (NSMutableArray *) readDataFromUserDefaults:(NSString*) keyName
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSData *data = [defaults objectForKey:keyName];
	NSArray *myArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    [defaults synchronize];
	return [NSMutableArray arrayWithArray:myArray];
}

- (void) writeDataToUserDefaults:(NSString *) keyName withArray:(NSMutableArray *) myArray
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSData *data = [NSKeyedArchiver archivedDataWithRootObject:myArray];
    [defaults setObject:data forKey:keyName];
	[defaults synchronize];
}

- (void) writeToUserDefaults:(NSString *) keyName withString:(NSString *) myString
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:myString forKey:keyName];
	[defaults synchronize];
}

- (void) writeArrayToUserDefaults:(NSString *) keyName withArray:(NSMutableArray *) myArray
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:myArray forKey:keyName];
	[defaults synchronize];
	
}

- (void) removeFromDefault:(NSString *) keyName
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults removeObjectForKey:keyName];
	[defaults synchronize];	
}
@end
