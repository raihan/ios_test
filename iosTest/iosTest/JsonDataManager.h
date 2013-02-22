//
//  JsonConsumer.h
//  iosTest
//
//  Created by Abdullah Md. Zubair on 2/16/13.
//  Copyright (c) 2013 Abdullah Md. Zubair. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSON.h"
#import "FileDrive.h"
#import "Content.h"

@interface JsonDataManager : NSObject

- (FileDrive *) parseJsonData;
- (id) getNestedKeyVal:(NSDictionary*)dict key1:(NSString*)key1 key2:(NSString*)key2 key3:(NSString*)key3;
- (Content *) parseContentData :(NSDictionary *)jsonDictionary;

@end
