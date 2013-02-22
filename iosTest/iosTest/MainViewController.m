//
//  MainViewController.m
//  iosTest
//
//  Created by Abdullah Md. Zubair on 2/16/13.
//  Copyright (c) 2013 Abdullah Md. Zubair. All rights reserved.
//

#import "MainViewController.h"
#import "JsonDataManager.h"
#import "Constants.h"
#import "ContentCell.h"
#import "FileDrive.h"
#import "Content.h"
#import "DetailViewController.h"
#import "CoreDataManager.h"
#import "UserDefaultManager.h"

@interface MainViewController ()

-(void)initPagingController:(NSString *)entitiesName;
-(void)getFileDriveDataDone:(NSNotification *)notif;
-(void)removePagingController;

@end

@implementation MainViewController
@synthesize indicatorView, fileSegmentControl, fileTableView,popoverController;
NSMutableArray *fileTableViewDataSource, *pagedTableViewDataSource;
FileDrive *myFileDrive;
CoreDataManager *coreDataManager;
UIScrollView *pagingScroller;

int initialButtonTag = 10000;
int numberOfPage = 0;
int pageFactor = 0;
int currentPageNo =0 ;
int numOfRows;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    JsonDataManager *jsonDataManager = [[JsonDataManager alloc] init];
    UserDefaultManager *userDefaultManager = [[UserDefaultManager alloc] init];
    
    coreDataManager = [[CoreDataManager alloc] init];
    fileTableViewDataSource = [[NSMutableArray alloc] init];
    pagedTableViewDataSource = [[NSMutableArray alloc] init];
    [indicatorView startAnimating];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getFileDriveDataDone:) name:NOTIF_GET_JSON_DATA_DONE object:nil];
    
    NSLog(@"asas %@",[userDefaultManager readStringFromUserDefaults:@"savedDataToCoreData"]);
    if (![userDefaultManager readStringFromUserDefaults:@"savedDataToCoreData"])
    {
        [userDefaultManager writeToUserDefaults:@"savedDataToCoreData" withString:@"savedDataToCoreDataFlag"];
        [jsonDataManager performSelectorInBackground:@selector(parseJsonData) withObject:nil];
    }
    else
    {
        [self performSelector:@selector(getFileDriveDataDone:) withObject:nil afterDelay:1.0];
    }
    pagingScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(65, self.view.frame.size.height-23-5, self.view.frame.size.width-65-5, 25)];
    [jsonDataManager release];
    [userDefaultManager release];
}

-(void)getFileDriveDataDone:(NSNotification *)notif
{
    NSLog(@"data received");
    [self initPagingController:entitiesNameOfMyFiles];
    [indicatorView removeFromSuperview];
}

-(void)initPagingController:(NSString *)entitiesName
{
    numberOfPage = (ceil([coreDataManager getRowCount:entitiesName]/20.0));
    [pagingScroller setContentSize:CGSizeMake(numberOfPage*30, 25)];
    for (int i=0; i<numberOfPage; i++)
    {
        UIButton *pagingButton = [[UIButton alloc] init];
        [pagingButton setFrame:CGRectMake((30*i), 0, 30, 21)];
        [pagingButton setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
        [pagingButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:12]];
        [pagingButton.titleLabel setTextColor:[UIColor blueColor]];
        [pagingButton addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventTouchUpInside];
        pagingButton.tag = initialButtonTag+i;
        NSLog(@"page: %d",i);
        [pagingScroller addSubview:pagingButton];
        [pagingButton release];
    }
    [self.view addSubview:pagingScroller];
    [self changePage:((UIButton *)[self.view viewWithTag:initialButtonTag])];

}

-(void)removePagingController
{
    for (int i=0; i<numberOfPage; i++)
    {
        [((UIButton *)[pagingScroller viewWithTag:initialButtonTag+i]) removeFromSuperview];
    }
}

-(IBAction)changePage:(id)sender
{
    NSLog(@"tag %d",[sender tag]);
    numOfRows = maxNumRows;
    for (int i=0; i<numberOfPage; i++)
    {
        [((UIButton *)[self.view viewWithTag:initialButtonTag+i]).titleLabel setTextColor:[UIColor blueColor]];
    }
    
    [((UIButton *)sender).titleLabel setTextColor:[UIColor whiteColor]];
    pageFactor = (((UIButton *)sender).tag-initialButtonTag)*maxNumRows;
    if (pageFactor < 0)
    {
        pageFactor = 0;
    }
    currentPageNo = (((UIButton *)sender).tag-initialButtonTag);
    NSLog(@"PF= %d arr= %d  %d",pageFactor,[fileTableViewDataSource count],numOfRows);
    [pagedTableViewDataSource removeAllObjects];
    if (fileSegmentControl.selectedSegmentIndex == 0)
    {
        pagedTableViewDataSource = [[coreDataManager loadContentsForEntity:entitiesNameOfMyFiles:pageFactor] mutableCopy];
    }
    else
    {
        pagedTableViewDataSource = [[coreDataManager loadContentsForEntity:entitiesNameOfSharedFiles:pageFactor] mutableCopy];
    }

    [fileTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//table view delegate methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [pagedTableViewDataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ContentTableCell";
    ContentCell *cell = (ContentCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    Content *tableCellContent = [pagedTableViewDataSource objectAtIndex:indexPath.row];
    cell.name.text = tableCellContent.name;
    cell.status.text = tableCellContent.status;
    cell.last_updated_date.text = tableCellContent.last_updated_date;
    cell.last_updated_by.text = tableCellContent.last_updated_by;
    cell.created_date.text = tableCellContent.created_date;
    cell.fileNo.text = [NSString stringWithFormat:@"%d.",currentPageNo*maxNumRows+indexPath.row+1];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        UIStoryboard *storybrd = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
        DetailViewController *controller =[storybrd instantiateViewControllerWithIdentifier:@"detailViewController"];
        controller.content = [pagedTableViewDataSource objectAtIndex:indexPath.row];
        controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:controller animated:YES];
    }
    else
    {
        UIStoryboard *storybrd = [UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle:nil];
        DetailViewController *controller =[storybrd instantiateViewControllerWithIdentifier:@"detailPopViewController"];
        controller.content = [pagedTableViewDataSource objectAtIndex:indexPath.row];
        controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        
        if([self.popoverController isPopoverVisible])
        {
            [self.popoverController dismissPopoverAnimated:YES];
            return;
        }
        controller.contentSizeForViewInPopover = CGSizeMake(320, 460);
        self.popoverController = [[[UIPopoverController alloc] initWithContentViewController:controller] autorelease];
        [self.popoverController presentPopoverFromRect:[tableView rectForRowAtIndexPath:indexPath] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}

-(IBAction)fileSegmentChanged:(id)sender
{
    [self removePagingController];
    if (fileSegmentControl.selectedSegmentIndex == 0)
    {
        [self initPagingController:entitiesNameOfMyFiles];
        NSLog(@"0 selected");
    }
    else if (fileSegmentControl.selectedSegmentIndex == 1)
    {
        [self initPagingController:entitiesNameOfSharedFiles];

        NSLog(@"1 selected");
    }
}

-(void)viewDidUnload
{
    [super viewDidUnload];
    [pagedTableViewDataSource release];
    [fileTableViewDataSource release];
    [myFileDrive release];
    [coreDataManager release];
    [pagingScroller release];
}

-(void)dealloc
{
    [super dealloc];
    fileTableViewDataSource = nil;
    pagedTableViewDataSource = nil;
    myFileDrive = nil;
    coreDataManager = nil;
    pagingScroller = nil;

    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIF_GET_JSON_DATA_DONE object:nil];
}

@end
