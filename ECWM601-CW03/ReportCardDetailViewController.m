//
//  ReportCardDetailViewController.m
//  ECWM601-CW03
//
//  Created by Rasanga Pathirage Perera on 14/05/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ReportCardDetailViewController.h"

@interface ReportCardDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation ReportCardDetailViewController

@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize levelFourView = _levelFourView;
@synthesize levelFiveView = _levelFiveView;
@synthesize levelSixView = _levelSixView;
@synthesize summaryView = _summaryView;
@synthesize levelFourBarItem = _levelFourBarItem;
@synthesize levelFiveBarItem = _levelFiveBarItem;
@synthesize levelSIxBarItem = _levelSIxBarItem;
@synthesize datesBarItem = _datesBarItem;
@synthesize summaryBarItem = _summaryBarItem;
@synthesize levelFourBarItemCollection = _levelFourBarItemCollection;
@synthesize courseTabBar = _courseTabBar;
@synthesize masterPopoverController = _masterPopoverController;

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSLog(@"didSelectItem");
    NSString *string = item.title;
    if ([string isEqualToString:@"Level 4"])
    {
        NSLog(@"LEVEL 4");
    } else if ([string isEqualToString:@"Level 5"])
    {
        NSLog(@"LEVEL 5");
    } else if ([string isEqualToString:@"Level 6"])
    {
        NSLog(@"LEVEL 6");
    } else if ([string isEqualToString:@"Dates"])
    {
        NSLog(@"Dates");
    } else if ([string isEqualToString:@"Summary"])
    {
        NSLog(@"Summary");
    } 
    
}


/////////////////////////////////////////////////////////////////////////

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.levelFourView.hidden = YES;
    self.levelFiveView.hidden = YES;
    self.levelSixView.hidden = YES;
    self.summaryView.hidden = YES;
    
    self.courseTabBar.delegate = self;
    
    
    //UIImage *summaryBarItemBg = [[UIImage imageNamed:@"grad.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    //[[UITabBar appearance] setBackground:summaryBarItemBg];
    
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    [self setLevelFourView:nil];
    [self setLevelFiveView:nil];
    [self setLevelSixView:nil];
    [self setSummaryView:nil];
    [self setLevelFourBarItem:nil];
    [self setLevelFiveBarItem:nil];
    [self setLevelSIxBarItem:nil];
    [self setDatesBarItem:nil];
    [self setSummaryBarItem:nil];
    [self setLevelFourBarItemCollection:nil];
    [self setCourseTabBar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
