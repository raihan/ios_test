//
//  ContentCell.h
//  iosTest
//
//  Created by Abdullah Md. Zubair on 2/16/13.
//  Copyright (c) 2013 Abdullah Md. Zubair. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentCell : UITableViewCell
{
    IBOutlet UILabel *fileNo;
    IBOutlet UILabel *status;
    IBOutlet UILabel *name;
    IBOutlet UILabel *last_updated_date;
    IBOutlet UILabel *last_updated_by;
    IBOutlet UILabel *created_date;
}

@property(nonatomic,retain) IBOutlet UILabel *fileNo;
@property(nonatomic,retain) IBOutlet UILabel *status;
@property(nonatomic,retain) IBOutlet UILabel *name;
@property(nonatomic,retain) IBOutlet UILabel *last_updated_date;
@property(nonatomic,retain) IBOutlet UILabel *last_updated_by;
@property(nonatomic,retain) IBOutlet UILabel *created_date;

@end
