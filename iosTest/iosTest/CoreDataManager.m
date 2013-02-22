//
//  CoreDataManager.m
//  iosTest
//
//  Created by Abdullah Md. Zubair on 2/17/13.
//  Copyright (c) 2013 Abdullah Md. Zubair. All rights reserved.
//

#import "CoreDataManager.h"
#import "Constants.h"

@implementation CoreDataManager

- (BOOL)saveFileContent:(Content *)fileContents:(NSString *)entitiesName
{
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSManagedObject *newContact;
    newContact = [NSEntityDescription insertNewObjectForEntityForName:entitiesName
    inManagedObjectContext:context];
    [newContact setValue: fileContents.status forKey:@"status"];
    [newContact setValue: fileContents.is_shared forKey:@"is_shared"];
    [newContact setValue: fileContents.share_id forKey:@"share_id"];
    [newContact setValue: fileContents.user_id forKey:@"user_id"];
    [newContact setValue: fileContents.name forKey:@"name"];
    [newContact setValue: fileContents.shared_by forKey:@"shared_by"];
    [newContact setValue: fileContents.shared_date forKey:@"shared_date"];
    [newContact setValue: fileContents.share_level forKey:@"share_level"];
    [newContact setValue: fileContents.parent_id forKey:@"parent_id"];
    [newContact setValue: fileContents.last_updated_date forKey:@"last_updated_date"];
    [newContact setValue: fileContents.last_updated_by forKey:@"last_updated_by"];
    [newContact setValue: fileContents.link forKey:@"link"];
    [newContact setValue: fileContents.created_date forKey:@"created_date"];
    [newContact setValue: fileContents.item_id forKey:@"item_id"];
    [newContact setValue: fileContents.path forKey:@"path"];
    [newContact setValue: fileContents.path_by_id forKey:@"path_by_id"];
    [newContact setValue: fileContents.type forKey:@"type"];
    [newContact setValue: fileContents.mime_type forKey:@"mime_type"];
    [newContact setValue: fileContents.size forKey:@"size"];
    [newContact setValue: fileContents.urlString forKey:@"urlString"];

    NSError *error;
   return [context save:&error];
    
}

- (NSMutableArray *)loadContentsForEntity:(NSString *)entitiesName:(int)offset
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:entitiesName
                inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"name != null"];
    [request setPredicate:pred];
    [request setFetchLimit:maxNumRows];
    [request setFetchOffset:offset];
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    
    NSLog(@"total C= %d",[objects count]);
    [request release];
    return [NSMutableArray arrayWithArray:objects];
}

-(int)getRowCount:(NSString *)entityName
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];

    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:entityName inManagedObjectContext:context]];
    
    [request setIncludesSubentities:NO];
    
    NSError *err;
    NSUInteger count = [context countForFetchRequest:request error:&err];
    if(count == NSNotFound) {
        NSLog(@"ERROR FOUND!!!");
    }
    [request release];
    return count;
}

@end
