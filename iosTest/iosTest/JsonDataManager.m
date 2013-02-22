//
//  JsonConsumer.m
//  iosTest
//
//  Created by Abdullah Md. Zubair on 2/16/13.
//  Copyright (c) 2013 Abdullah Md. Zubair. All rights reserved.
//

#import "JsonDataManager.h"
#import "Constants.h"
#import "CoreDataManager.h"

@implementation JsonDataManager

-(FileDrive *)parseJsonData
{
    NSError *error = nil;
    NSString *fileContent = [NSString stringWithContentsOfURL:[NSURL URLWithString:jsonUrlString] encoding:NSUTF8StringEncoding error:&error];
    SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
    NSDictionary *jsonDictionary = [jsonParser objectWithString:fileContent error:&error];
    CoreDataManager *coreDataManager = [[CoreDataManager alloc] init];

    FileDrive *myFileDrive = [[FileDrive alloc] init];
    [myFileDrive setTotalSpace:[[self getNestedKeyVal:jsonDictionary key1:@"totalSpace" key2:nil key3:nil] doubleValue]];
    [myFileDrive setLast_rev_id:[[self getNestedKeyVal:jsonDictionary key1:@"last_rev_id" key2:nil key3:nil] doubleValue]];
    [myFileDrive setUsedSpace:[[self getNestedKeyVal:jsonDictionary key1:@"usedSpace" key2:nil key3:nil] doubleValue]];
    [myFileDrive setAvailableSpace:[[self getNestedKeyVal:jsonDictionary key1:@"availableSpace" key2:nil key3:nil] doubleValue]];
    [myFileDrive setMode:[self getNestedKeyVal:jsonDictionary key1:@"mode" key2:nil key3:nil]];
    [myFileDrive setPendingRequests:[[self getNestedKeyVal:jsonDictionary key1:@"pendingRequests" key2:nil key3:nil] doubleValue]];
    
    for (NSDictionary *myFiles  in [self getNestedKeyVal:jsonDictionary key1:@"my_files" key2:@"content" key3:nil])
    {
        Content *content = [self parseContentData:myFiles];
        [myFileDrive.myFileConentsArray addObject:content];
        NSLog(@"my file content.name %@",content.user_id);
        [coreDataManager saveFileContent:content:entitiesNameOfMyFiles];
    }
    
    [myFileDrive setMyFileId: [self getNestedKeyVal:jsonDictionary key1:@"my_files" key2:@"id" key3:nil]];
    [myFileDrive setMyFileName: [self getNestedKeyVal:jsonDictionary key1:@"my_files" key2:@"name" key3:nil]];
    NSLog(@"my file myFileDrive.myFileName %@",myFileDrive.myFileName);
    
    for (NSDictionary *sharedFiles  in [self getNestedKeyVal:jsonDictionary key1:@"shared_files" key2:@"content" key3:nil])
    {
        Content *content = [self parseContentData:sharedFiles];
        [myFileDrive.sharedFileConentsArray addObject:content];
        NSLog(@"my file content.name %@",content.urlString);
        [coreDataManager saveFileContent:content:entitiesNameOfSharedFiles];
    }
    
    [myFileDrive setSharedFileId: [self getNestedKeyVal:jsonDictionary key1:@"shared_files" key2:@"id" key3:nil]];
    [myFileDrive setSharedFileName: [self getNestedKeyVal:jsonDictionary key1:@"shared_files" key2:@"name" key3:nil]];
    NSLog(@"my file myFileDrive.sharedFileName %@",myFileDrive.sharedFileName);
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIF_GET_JSON_DATA_DONE object:myFileDrive];
    return myFileDrive;
}

-(Content *)parseContentData :(NSDictionary *)jsonDictionary
{
    Content *content = [[Content alloc] init];
    [content setStatus:[self getNestedKeyVal:jsonDictionary key1:@"status" key2:nil key3:nil]];
    [content setIs_shared:[self getNestedKeyVal:jsonDictionary key1:@"is_shared" key2:nil key3:nil]];
    [content setShare_id:[self getNestedKeyVal:jsonDictionary key1:@"share_id" key2:nil key3:nil]];
    [content setUser_id:[NSString stringWithFormat:@"%d",[[self getNestedKeyVal:jsonDictionary key1:@"user_id" key2:nil key3:nil] intValue]]];
    [content setName:[self getNestedKeyVal:jsonDictionary key1:@"name" key2:nil key3:nil]];
    [content setShared_by:[NSString stringWithFormat:@"%d",[[self getNestedKeyVal:jsonDictionary key1:@"shared_by" key2:nil key3:nil] intValue]]];
    [content setShared_date:[self getNestedKeyVal:jsonDictionary key1:@"shared_date" key2:nil key3:nil]];
    [content setShare_level:[NSString stringWithFormat:@"%d",[[self getNestedKeyVal:jsonDictionary key1:@"share_level" key2:nil key3:nil] intValue]]];
    [content setParent_id:[NSString stringWithFormat:@"%d",[[self getNestedKeyVal:jsonDictionary key1:@"parent_id" key2:nil key3:nil] intValue]]];
    [content setLast_updated_date:[self getNestedKeyVal:jsonDictionary key1:@"last_updated_date" key2:nil key3:nil]];
    [content setLast_updated_by:[self getNestedKeyVal:jsonDictionary key1:@"last_updated_by" key2:nil key3:nil]];
    [content setLink:[self getNestedKeyVal:jsonDictionary key1:@"link" key2:nil key3:nil]];
    [content setCreated_date:[self getNestedKeyVal:jsonDictionary key1:@"created_date" key2:nil key3:nil]];
    [content setItem_id:[NSString stringWithFormat:@"%d",[[self getNestedKeyVal:jsonDictionary key1:@"item_id" key2:nil key3:nil] intValue]]];
    [content setPath:[self getNestedKeyVal:jsonDictionary key1:@"path" key2:nil key3:nil]];
    [content setPath_by_id:[self getNestedKeyVal:jsonDictionary key1:@"path_by_id" key2:nil key3:nil]];
    [content setType:[self getNestedKeyVal:jsonDictionary key1:@"type" key2:nil key3:nil]];
    [content setMime_type:[self getNestedKeyVal:jsonDictionary key1:@"mime_type" key2:nil key3:nil]];
    [content setSize:[NSString stringWithFormat:@"%d",[[self getNestedKeyVal:jsonDictionary key1:@"size" key2:nil key3:nil] intValue]]];
    [content setUrlString:[NSString stringWithFormat:@"%@%@%@",content.link,content.path_by_id,content.path]];
    NSLog(@" content.name %@",content.urlString);
    return content;
}

- (id) getNestedKeyVal:(NSDictionary*)dict key1:(NSString*)key1 key2:(NSString*)key2 key3:(NSString*)key3 {
    id val = nil;
    
    @try {
        if (key3 != nil) {
            val=[[[dict objectForKey:key1] objectForKey:key2] objectForKey:key3];
        } else if (key2 != nil) {
            val=[[dict objectForKey:key1] objectForKey:key2];
        } else if (key1 != nil) {
            val=[dict objectForKey:key1];
        }
        if (val == [NSNull null])
            val = nil;
    }
    @catch (id ue) {
        NSLog(@"getNestedKeyVal: Caught %@", ue);
    }
    @finally {
    }
    return val;
}

@end
