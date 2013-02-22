//
//  DetailViewController.m
//  iosTest
//
//  Created by Abdullah Md. Zubair on 2/18/13.
//  Copyright (c) 2013 Abdullah Md. Zubair. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize nameLabel;
@synthesize lastUpdatedDateLabel;
@synthesize lastUpdatedByLabel;
@synthesize linkTxtView;
@synthesize createdDateLabel;
@synthesize pathLabel;
@synthesize sizeLabel;
@synthesize statusLabel;
@synthesize isSharedLabel;
@synthesize relPathLabel;
@synthesize content;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    nameLabel.text = content.name;
    lastUpdatedDateLabel.text = content.last_updated_date;
    lastUpdatedByLabel.text = content.last_updated_by;
    linkTxtView.text = content.urlString;
    createdDateLabel.text = content.created_date;
    pathLabel.text = content.path;
    sizeLabel.text = [NSString stringWithFormat:@"%@",content.size];
    statusLabel.text = content.status;
    isSharedLabel.text = content.is_shared;
    relPathLabel.text = content.path;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(IBAction)backButtonAction:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
