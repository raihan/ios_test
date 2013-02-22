//
//  FileDrive.h
//  iosTest
//
//  Created by Abdullah Md. Zubair on 2/16/13.
//  Copyright (c) 2013 Abdullah Md. Zubair. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileDrive : NSObject
{
    double totalSpace;
    double last_rev_id;
    double usedSpace;
    double availableSpace;
    NSString *mode;
    double pendingRequests;
    
    NSMutableArray *myFileConentsArray;
    NSString *myFileId;
    NSString *myFileName;
    NSMutableArray *sharedFileConentsArray;
    NSString *sharedFileId;
    NSString *sharedFileName;
}

@property(nonatomic) double totalSpace;
@property(nonatomic) double last_rev_id;
@property(nonatomic) double usedSpace;
@property(nonatomic) double availableSpace;
@property(nonatomic,retain) NSString *mode;
@property(nonatomic) double pendingRequests;

@property(nonatomic,retain) NSMutableArray *myFileConentsArray;
@property(nonatomic,retain) NSString *myFileId;
@property(nonatomic,retain) NSString *myFileName;
@property(nonatomic,retain) NSMutableArray *sharedFileConentsArray;
@property(nonatomic,retain) NSString *sharedFileId;
@property(nonatomic,retain) NSString *sharedFileName;

@end
