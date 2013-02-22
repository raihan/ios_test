//
//  FileDrive.m
//  iosTest
//
//  Created by Abdullah Md. Zubair on 2/16/13.
//  Copyright (c) 2013 Abdullah Md. Zubair. All rights reserved.
//

#import "FileDrive.h"

@implementation FileDrive

@synthesize totalSpace;
@synthesize last_rev_id;
@synthesize usedSpace;
@synthesize availableSpace;
@synthesize mode;
@synthesize pendingRequests;

@synthesize myFileConentsArray;
@synthesize myFileId;
@synthesize myFileName;
@synthesize sharedFileConentsArray;
@synthesize sharedFileId;
@synthesize sharedFileName;

-(id)init
{
    self = [super init];
    if (self)
    {
        myFileConentsArray = [[NSMutableArray alloc] init];
        sharedFileConentsArray = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
