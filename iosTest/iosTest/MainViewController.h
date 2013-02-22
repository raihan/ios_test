//
//  MainViewController.h
//  iosTest
//
//  Created by Abdullah Md. Zubair on 2/16/13.
//  Copyright (c) 2013 Abdullah Md. Zubair. All rights reserved.
//

#import "AppDelegate.h"

@interface MainViewController : UIViewController <UIPopoverControllerDelegate>

{
    IBOutlet UIActivityIndicatorView *indicatorView;
    IBOutlet UISegmentedControl *fileSegmentControl;
    IBOutlet UITableView *fileTableView;
    UIPopoverController *popoverController;
}

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,retain) UIPopoverController *popoverController;
@property (nonatomic,retain) IBOutlet UIActivityIndicatorView *indicatorView;
@property(nonatomic,retain) IBOutlet UISegmentedControl *fileSegmentControl;
@property (nonatomic,retain) IBOutlet UITableView *fileTableView;

-(IBAction)fileSegmentChanged:(id)sender;

@end
