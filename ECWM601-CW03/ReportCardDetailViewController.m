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

@synthesize module = _module;
@synthesize levelFourBarItem = _levelFourBarItem;
@synthesize levelFiveBarItem = _levelFiveBarItem;
@synthesize levelSIxBarItem = _levelSIxBarItem;
@synthesize datesBarItem = _datesBarItem;
@synthesize summaryBarItem = _summaryBarItem;
@synthesize levelFourBarItemCollection = _levelFourBarItemCollection;
@synthesize courseTabBar = _courseTabBar;
@synthesize masterPopoverController = _masterPopoverController;
@synthesize masterViewController = _masterViewController;

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
@synthesize textBoxAssignment1Wegiht = _textBoxAssignment1Wegiht;
@synthesize summaryView = _summaryView;

@synthesize dueDateIdentifier = _dueDateIdentifier;
@synthesize textBoxAssignment2Wegiht = _textBoxAssignment2Wegiht;
@synthesize textBoxAssignment3Wegiht = _textBoxAssignment3Wegiht;
@synthesize textBoxAssignment4Wegiht = _textBoxAssignment4Wegiht;
@synthesize textBoxAssignment5Wegiht = _textBoxAssignment5Wegiht;
@synthesize textBoxAssignment6Wegiht = _textBoxAssignment6Wegiht;

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
        self.title = @" - Level 4";
        [self.masterViewController displayLevel:4];
    } else if ([string isEqualToString:@"Level 5"])
    {
        self.summaryView.hidden = YES;
        self.title = @" - Level 5";
        [self.masterViewController displayLevel:5];
    } else if ([string isEqualToString:@"Level 6"])
    {
        self.summaryView.hidden = YES;
        self.title = @" - Level 6";
        [self.masterViewController displayLevel:6];
    } else if ([string isEqualToString:@"Dates"])
    {
        self.summaryView.hidden = YES;
        NSLog(@"Dates");
    } else if ([string isEqualToString:@"Summary"])
    {
        self.summaryView.hidden = NO;
        self.title = @"Summary";
        [self.masterViewController hideLevelDetails];
    } 
    
}

- (void) setDueDate:(NSDate *) date
{
    if (self.dueDateIdentifier == 1) {
        //
    } else if (self.dueDateIdentifier == 2) {
        
    }
    NSLog(@"%d", self.dueDateIdentifier);
    NSLog(@"%@", (NSString *)date);
}

- (IBAction)moduleDetailSave:(id)sender 
{
    // save module details
}

- (IBAction)addAssignment:(id)sender 
{
    // adding assignment for each module
}

- (IBAction)setDate:(id)sender {
    NSLog(@"%d", [sender tag]);
    self.dueDateIdentifier = [sender tag];
}

// Manage module details

- (void)setModule:(Module *)module
{
    if (_module != module) {
        _module = module;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
    
    [self showModuleDetails:module];
}

- (void)showModuleDetails:(Module *)module
{
    self.textBoxModuleTitle.text = module.moduleName;
    
    if (module.credits == nil) {
        self.textBoxModuleCredit.text = [NSString stringWithFormat:@"%@", module.credits];
    }
    
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.module) {
        //self.detailDescriptionLabel.text = [module description];
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
    
    self.masterViewController = (ReportCardMasterViewController *)[[self.splitViewController.viewControllers objectAtIndex:0] topViewController];
    
    // set default course level
    self.masterViewController.courseLevelId = 4;
    // show default level on TabBar
    
    //UIImage *summaryBarItemBg = [[UIImage imageNamed:@"grad.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    //[[UITabBar appearance] setBackground:summaryBarItemBg];
    UIImage *summaryBarItemBg = [UIImage imageNamed:@"grad.png"];
    UITabBar *tabbar = self.tabBarController.tabBar;
    UITabBarItem *item0 = [tabbar.items objectAtIndex:0];
    UITabBarItem *item1 = [tabbar.items objectAtIndex:1];
    UITabBarItem *item2 = [tabbar.items objectAtIndex:2];
    UITabBarItem *item3 = [tabbar.items objectAtIndex:3];
    UITabBarItem *item4 = [tabbar.items objectAtIndex:4];
    
    [item0 setFinishedSelectedImage:summaryBarItemBg withFinishedUnselectedImage:summaryBarItemBg];
    [item1 setFinishedSelectedImage:summaryBarItemBg withFinishedUnselectedImage:summaryBarItemBg];
    [item2 setFinishedSelectedImage:summaryBarItemBg withFinishedUnselectedImage:summaryBarItemBg];
    [item3 setFinishedSelectedImage:summaryBarItemBg withFinishedUnselectedImage:summaryBarItemBg];
    [item4 setFinishedSelectedImage:summaryBarItemBg withFinishedUnselectedImage:summaryBarItemBg];
    //*/
    
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
    [self setTextBoxAssignment1Wegiht:nil];
    [self setTextBoxAssignment2Wegiht:nil];
    [self setTextBoxAssignment3Wegiht:nil];
    [self setTextBoxAssignment4Wegiht:nil];
    [self setTextBoxAssignment5Wegiht:nil];
    [self setTextBoxAssignment6Wegiht:nil];
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
