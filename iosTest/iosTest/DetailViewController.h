//
//  DetailViewController.h
//  iosTest
//
//  Created by Abdullah Md. Zubair on 2/18/13.
//  Copyright (c) 2013 Abdullah Md. Zubair. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Content.h"

@interface DetailViewController : UIViewController
{
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *lastUpdatedDateLabel;
    IBOutlet UILabel *lastUpdatedByLabel;
    IBOutlet UITextView *linkTxtView;
    IBOutlet UILabel *createdDateLabel;
    IBOutlet UILabel *pathLabel;
    IBOutlet UILabel *sizeLabel;
    IBOutlet UILabel *statusLabel;
    IBOutlet UILabel *isSharedLabel;
    IBOutlet UILabel *relPathLabel;
}

@property(nonatomic,retain) IBOutlet UILabel *nameLabel;
@property(nonatomic,retain) IBOutlet UILabel *lastUpdatedDateLabel;
@property(nonatomic,retain) IBOutlet UILabel *lastUpdatedByLabel;
@property(nonatomic,retain) IBOutlet UITextView *linkTxtView;
@property(nonatomic,retain) IBOutlet UILabel *createdDateLabel;
@property(nonatomic,retain) IBOutlet UILabel *pathLabel;
@property(nonatomic,retain) IBOutlet UILabel *sizeLabel;
@property(nonatomic,retain) IBOutlet UILabel *statusLabel;
@property(nonatomic,retain) IBOutlet UILabel *isSharedLabel;
@property(nonatomic,retain) IBOutlet UILabel *relPathLabel;
@property(nonatomic,retain) Content *content;

-(IBAction)backButtonAction:(id)sender;

@end
