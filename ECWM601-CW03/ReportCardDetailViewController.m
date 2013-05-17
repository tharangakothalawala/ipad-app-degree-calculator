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
@synthesize levelFourBarItem = _levelFourBarItem;
@synthesize levelFiveBarItem = _levelFiveBarItem;
@synthesize levelSIxBarItem = _levelSIxBarItem;
@synthesize datesBarItem = _datesBarItem;
@synthesize summaryBarItem = _summaryBarItem;
@synthesize levelFourBarItemCollection = _levelFourBarItemCollection;
@synthesize courseTabBar = _courseTabBar;
@synthesize masterPopoverController = _masterPopoverController;

// UI Elements
@synthesize textBoxModuleTitle = _textBoxModuleTitile;
@synthesize textBoxModuleCredit = _textBoxModuleCredit;
@synthesize textBoxAssignment1Title = _textBoxAssignment1Title;
@synthesize textBoxAssignment2Title = _textBoxAssignment2Title;
@synthesize textBoxAssignment3Title = _textBoxAssignment3Title;
@synthesize textBoxAssignment4Title = _textBoxAssignment4Title;
@synthesize textBoxAssignment5Title = _textBoxAssignment5Title;
@synthesize textBoxAssignment6Title = _textBoxAssignment6Title;
@synthesize textBoxAssigment1Mark = _textBoxAssigment1Mark;
@synthesize textBoxAssigment2Mark = _textBoxAssigment2Mark;
@synthesize textBoxAssigment3Mark = _textBoxAssigment3Mark;
@synthesize textBoxAssigment4Mark = _textBoxAssigment4Mark;
@synthesize textBoxAssigment5Mark = _textBoxAssigment5Mark;
@synthesize textBoxAssigment6Mark = _textBoxAssigment6Mark;
@synthesize textBoxAssigment1Dates = _textBoxAssigment1Dates;
@synthesize textBoxAssigment2Dates = _textBoxAssigment2Dates;
@synthesize textBoxAssigment3Dates = _textBoxAssigment3Dates;
@synthesize textBoxAssigment4Dates = _textBoxAssigment4Dates;
@synthesize textBoxAssigment5Dates = _textBoxAssigment5Dates;
@synthesize textBoxAssigment6Dates = _textBoxAssigment6Dates;
@synthesize labelFinalModuleMark = _labelFinalModuleMark;
@synthesize summaryView = _summaryView;


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"datePickerPopover"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSLog(@"didSelectItem");
    NSString *string = item.title;
    if ([string isEqualToString:@"Level 4"])
    {
        self.summaryView.hidden = YES;
        NSLog(@"LEVEL 4");
    } else if ([string isEqualToString:@"Level 5"])
    {
        self.summaryView.hidden = YES;
        NSLog(@"LEVEL 5");
    } else if ([string isEqualToString:@"Level 6"])
    {
        self.summaryView.hidden = YES;
        NSLog(@"LEVEL 6");
    } else if ([string isEqualToString:@"Dates"])
    {
        self.summaryView.hidden = YES;
        NSLog(@"Dates");
    } else if ([string isEqualToString:@"Summary"])
    {
        self.summaryView.hidden = NO;
        NSLog(@"Summary");
    } 
    
}

- (void) setDueDate:(NSDate *) date
{
    NSLog(@"%@", (NSString *)date);
}

- (IBAction)moduleDetailSave:(id)sender 
{
    
}

- (IBAction)addAssignment:(id)sender 
{
    
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
        //self.detailDescriptionLabel.text = [self.detailItem description];
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
    self.courseTabBar.delegate = self;
    
    
    //UIImage *summaryBarItemBg = [[UIImage imageNamed:@"grad.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    //[[UITabBar appearance] setBackground:summaryBarItemBg];
    
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    [self setLevelFourBarItem:nil];
    [self setLevelFiveBarItem:nil];
    [self setLevelSIxBarItem:nil];
    [self setDatesBarItem:nil];
    [self setSummaryBarItem:nil];
    [self setLevelFourBarItemCollection:nil];
    [self setCourseTabBar:nil];
    self.summaryView.hidden = YES;
    
    // Module UI Elements
    [self setTextBoxModuleTitle:nil];
    [self setTextBoxModuleCredit:nil];
    [self setTextBoxAssignment1Title:nil];
    [self setTextBoxAssigment1Mark:nil];
    [self setTextBoxAssigment1Dates:nil];
    [self setTextBoxAssignment1Title:nil];
    [self setTextBoxAssignment2Title:nil];
    [self setTextBoxAssignment3Title:nil];
    [self setTextBoxAssignment4Title:nil];
    [self setTextBoxAssignment5Title:nil];
    [self setTextBoxAssignment6Title:nil];
    [self setTextBoxAssigment2Mark:nil];
    [self setTextBoxAssigment3Mark:nil];
    [self setTextBoxAssigment4Mark:nil];
    [self setTextBoxAssigment4Mark:nil];
    [self setTextBoxAssigment5Mark:nil];
    [self setTextBoxAssigment6Mark:nil];
    [self setTextBoxAssigment2Dates:nil];
    [self setTextBoxAssigment3Dates:nil];
    [self setTextBoxAssigment4Dates:nil];
    [self setTextBoxAssigment5Dates:nil];
    [self setTextBoxAssigment6Dates:nil];
    
    [self setLabelFinalModuleMark:nil];
    [self setSummaryView:nil];
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
