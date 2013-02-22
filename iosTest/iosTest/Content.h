//
//  Content.h
//  iosTest
//
//  Created by Abdullah Md. Zubair on 2/16/13.
//  Copyright (c) 2013 Abdullah Md. Zubair. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Content : NSObject
{
    NSString *status;
    NSString *is_shared;
    NSString *share_id;
    NSString *user_id;
    NSString *name;
    NSString *shared_by;
    NSString *shared_date;
    NSString *share_level;
    NSString *parent_id;
    NSString *last_updated_date;
    NSString *last_updated_by;
    NSString *link;
    NSString *created_date;
    NSString *item_id;
    NSString *path;
    NSString *path_by_id;
    NSString *type;
    NSString *mime_type;
    NSString *size;
    NSString *urlString;
}

@property(nonatomic,retain) NSString *status;
@property(nonatomic,retain)NSString *is_shared;
@property(nonatomic,retain)NSString *share_id;
@property(nonatomic,retain)NSString *user_id;
@property(nonatomic,retain)NSString *name;
@property(nonatomic,retain)NSString *shared_by;
@property(nonatomic,retain)NSString *shared_date;
@property(nonatomic,retain)NSString *share_level;
@property(nonatomic,retain)NSString *parent_id;
@property(nonatomic,retain)NSString *last_updated_date;
@property(nonatomic,retain)NSString *last_updated_by;
@property(nonatomic,retain)NSString *link;
@property(nonatomic,retain)NSString *created_date;
@property(nonatomic,retain)NSString *item_id;
@property(nonatomic,retain)NSString *path;
@property(nonatomic,retain)NSString *path_by_id;
@property(nonatomic,retain)NSString *type;
@property(nonatomic,retain)NSString *mime_type;
@property(nonatomic,retain)NSString *size;
@property(nonatomic,retain)NSString *urlString;

@end
