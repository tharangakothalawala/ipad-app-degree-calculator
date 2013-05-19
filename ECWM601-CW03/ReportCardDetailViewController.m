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
- (void)editModuleDetails;
- (void)showModuleDetails;
- (void)editAssignment1;

@end

@implementation ReportCardDetailViewController

@synthesize managedObjectContext = _managedObjectContext;
@synthesize module = _module;
@synthesize levelFourBarItem = _levelFourBarItem;
@synthesize levelFiveBarItem = _levelFiveBarItem;
@synthesize levelSIxBarItem = _levelSIxBarItem;
@synthesize datesBarItem = _datesBarItem;
@synthesize summaryBarItem = _summaryBarItem;
@synthesize levelFourBarItemCollection = _levelFourBarItemCollection;
@synthesize courseTabBar = _courseTabBar;
@synthesize buttonAddAssignment = _buttonAddAssignment;
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
@synthesize bottomModuleView = _bottomModuleView;
@synthesize textBoxAssignment2Wegiht = _textBoxAssignment2Wegiht;
@synthesize textBoxAssignment3Wegiht = _textBoxAssignment3Wegiht;
@synthesize textBoxAssignment4Wegiht = _textBoxAssignment4Wegiht;
@synthesize textBoxAssignment5Wegiht = _textBoxAssignment5Wegiht;
@synthesize textBoxAssignment6Wegiht = _textBoxAssignment6Wegiht;

@synthesize assignment1View = _assignment1View;
@synthesize assignment2View = _assignment2View;
@synthesize assignment3View = _assignment3View;
@synthesize assignment4View = _assignment4View;
@synthesize assignment5View = _assignment5View;
@synthesize assignment6View = _assignment6View;
@synthesize assignmentPointer = _assignmentPointer;

@synthesize assignment1DueDate = _assignment1DueDate;
@synthesize assignment2DueDate = _assignment2DueDate;
@synthesize assignment3DueDate = _assignment3DueDate;
@synthesize assignment4DueDate = _assignment4DueDate;
@synthesize assignment5DueDate = _assignment5DueDate;
@synthesize assignment6DueDate = _assignment6DueDate;

@synthesize graphView = _graphView;
@synthesize scoreList = _scoreList;

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
        self.bottomModuleView.hidden = NO;
        self.title = @" - Level 4";
        [self.masterViewController displayLevel:4];
    } else if ([string isEqualToString:@"Level 5"])
    {
        self.summaryView.hidden = YES;
        self.bottomModuleView.hidden = NO;
        self.title = @" - Level 5";
        [self.masterViewController displayLevel:5];
    } else if ([string isEqualToString:@"Level 6"])
    {
        self.summaryView.hidden = YES;
        self.bottomModuleView.hidden = NO;
        self.title = @" - Level 6";
        [self.masterViewController displayLevel:6];
    } else if ([string isEqualToString:@"Dates"])
    {
        self.summaryView.hidden = YES;
        [self.masterViewController showDaysLeft];
        NSLog(@"Dates");
    } else if ([string isEqualToString:@"Summary"])
    {
        self.summaryView.hidden = NO;
        self.bottomModuleView.hidden = YES;
        self.title = @"Summary";
        
        //self.scoreList = [[NSMutableArray alloc] init];
        NSString *point1 = @"90";
        NSString *point2 = @"100";
        NSString *point3 = @"70";
        NSString *point4 = @"60";
        NSString *point5 = @"80";
        NSString *point6 = @"40";
        [self.scoreList addObject:point1];
        [self.scoreList addObject:point2];
        [self.scoreList addObject:point3];
        [self.scoreList addObject:point4];
        [self.scoreList addObject:point5];
        [self.scoreList addObject:point6];
        
        [self.scoreList addObject:point1];
        [self.scoreList addObject:point2];
        [self.scoreList addObject:point3];
        [self.scoreList addObject:point4];
        [self.scoreList addObject:point5];
        [self.scoreList addObject:point6];//*/
        [self.graphView drawGraph:self.scoreList];
        
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
    [self editModuleDetails];
    
}



- (IBAction)addAssignment:(id)sender
{
    // adding assignment for each module
    if (self.assignmentPointer == 1 &&  !([self.textBoxAssignment1Title.text isEqualToString:@""])) {
        self.assignment2View.hidden = NO;
        self.assignmentPointer = 2;
    } else if (self.assignmentPointer == 1) {
        [self.textBoxAssignment1Title becomeFirstResponder];
    }
    
    if (self.assignmentPointer == 2 &&  !([self.textBoxAssignment2Title.text isEqualToString:@""])) {
        self.assignment3View.hidden = NO;
        self.assignmentPointer = 3;
    } else if (self.assignmentPointer == 2) {
        [self.textBoxAssignment2Title becomeFirstResponder];
    }
    
    if (self.assignmentPointer == 3 &&  !([self.textBoxAssignment3Title.text isEqualToString:@""])) {
        self.assignment4View.hidden = NO;
        self.assignmentPointer = 4;
    } else if (self.assignmentPointer == 3) {
        [self.textBoxAssignment3Title becomeFirstResponder];
    }
    
    if (self.assignmentPointer == 4 &&  !([self.textBoxAssignment4Title.text isEqualToString:@""])) {
        self.assignment5View.hidden = NO;
        self.assignmentPointer = 5;
    } else if (self.assignmentPointer == 4) {
        [self.textBoxAssignment4Title becomeFirstResponder];
    }
    
    if (self.assignmentPointer == 5 &&  !([self.textBoxAssignment5Title.text isEqualToString:@""])) {
        self.assignment6View.hidden = NO;
        self.assignmentPointer = 6;
        [self.buttonAddAssignment setEnabled:NO];
    } else if (self.assignmentPointer == 5) {
        [self.textBoxAssignment5Title becomeFirstResponder];
    }
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
    
    [self showModuleDetails];
}

- (void)showModuleDetails
{
    self.textBoxModuleTitle.text = self.module.moduleName;
    
//    if (self.module.credits == nil) {
        self.textBoxModuleCredit.text = [NSString stringWithFormat:@"%@", self.module.credits];
//    }
    
}

- (void)editAssignment1
{
    Assessment *assessment = (Assessment *)[NSEntityDescription insertNewObjectForEntityForName:@"Assessment" 
                                                                         inManagedObjectContext:self.managedObjectContext];
    [assessment setModule:self.module];
    [assessment setAssesmentName:self.textBoxAssignment1Title.text];
    [assessment setAssesmentWeight:[NSNumber numberWithInt:[self.textBoxAssignment1Wegiht.text intValue]]];
    [assessment setAssignmentMark:[NSNumber numberWithInt:[self.textBoxAssigment1Mark.text intValue]]];
    [assessment setAssesmentDueDate:self.assignment1DueDate];
    [self.managedObjectContext save:nil];
}

- (void)editAssignment2
{
    Assessment *assessment = (Assessment *)[NSEntityDescription insertNewObjectForEntityForName:@"Assessment" 
                                                                         inManagedObjectContext:self.managedObjectContext];
    [assessment setModule:self.module];
    [assessment setAssesmentName:self.textBoxAssignment1Title.text];
    [assessment setAssesmentWeight:[NSNumber numberWithInt:[self.textBoxAssignment2Wegiht.text intValue]]];
    [assessment setAssignmentMark:[NSNumber numberWithInt:[self.textBoxAssigment2Mark.text intValue]]];
    [assessment setAssesmentDueDate:self.assignment2DueDate];
    [self.managedObjectContext save:nil];
}

- (void)editAssignment3
{
    Assessment *assessment = (Assessment *)[NSEntityDescription insertNewObjectForEntityForName:@"Assessment" 
                                                                         inManagedObjectContext:self.managedObjectContext];
    [assessment setModule:self.module];
    [assessment setAssesmentName:self.textBoxAssignment3Title.text];
    [assessment setAssesmentWeight:[NSNumber numberWithInt:[self.textBoxAssignment3Wegiht.text intValue]]];
    [assessment setAssignmentMark:[NSNumber numberWithInt:[self.textBoxAssigment3Mark.text intValue]]];
    [assessment setAssesmentDueDate:self.assignment3DueDate];
    [self.managedObjectContext save:nil];
}
- (void)editAssignment4
{
    Assessment *assessment = (Assessment *)[NSEntityDescription insertNewObjectForEntityForName:@"Assessment" 
                                                                         inManagedObjectContext:self.managedObjectContext];
    [assessment setModule:self.module];
    [assessment setAssesmentName:self.textBoxAssignment4Title.text];
    [assessment setAssesmentWeight:[NSNumber numberWithInt:[self.textBoxAssignment4Wegiht.text intValue]]];
    [assessment setAssignmentMark:[NSNumber numberWithInt:[self.textBoxAssigment4Mark.text intValue]]];
    [assessment setAssesmentDueDate:self.assignment4DueDate];
    [self.managedObjectContext save:nil];
}

- (void)editAssignment5
{
    Assessment *assessment = (Assessment *)[NSEntityDescription insertNewObjectForEntityForName:@"Assessment" 
                                                                         inManagedObjectContext:self.managedObjectContext];
    [assessment setModule:self.module];
    [assessment setAssesmentName:self.textBoxAssignment5Title.text];
    [assessment setAssesmentWeight:[NSNumber numberWithInt:[self.textBoxAssignment5Wegiht.text intValue]]];
    [assessment setAssignmentMark:[NSNumber numberWithInt:[self.textBoxAssigment5Mark.text intValue]]];
    [assessment setAssesmentDueDate:self.assignment5DueDate];
}

- (void)editAssignment6
{
    Assessment *assessment = (Assessment *)[NSEntityDescription insertNewObjectForEntityForName:@"Assessment" 
                                                                         inManagedObjectContext:self.managedObjectContext];
    [assessment setModule:self.module];
    [assessment setAssesmentName:self.textBoxAssignment6Title.text];
    [assessment setAssesmentWeight:[NSNumber numberWithInt:[self.textBoxAssignment6Wegiht.text intValue]]];
    [assessment setAssignmentMark:[NSNumber numberWithInt:[self.textBoxAssigment6Mark.text intValue]]];
    [assessment setAssesmentDueDate:self.assignment6DueDate];
    [self.managedObjectContext save:nil];
}

- (void)editModuleDetails
{
    self.module.moduleName = self.textBoxModuleTitle.text;
    self.module.credits = [NSNumber numberWithInt:[self.textBoxModuleCredit.text intValue]];
    [self.managedObjectContext save:nil];
}

- (void)setDefaultLevel:(int) levelId
{
    // show default level on TabBar
    [self.tabBarController setSelectedIndex:0];
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
    self.assignmentPointer = 1;
    // hiding the assignment areas
    self.assignment2View.hidden = YES;
    self.assignment3View.hidden = YES;
    self.assignment4View.hidden = YES;
    self.assignment5View.hidden = YES;
    self.assignment6View.hidden = YES;
    
    self.masterViewController = (ReportCardMasterViewController *)[[self.splitViewController.viewControllers objectAtIndex:0] topViewController];
    
    /*UIImage *summaryBarItemBg = [[UIImage imageNamed:@"grad.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [[UITabBar appearance] setBackground:summaryBarItemBg];//*/
    
    UIImage *tabBackground = [[UIImage imageNamed:@"grad.jpg"] 
                              resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    // Set background for all UITabBars
    [[UITabBar appearance] setBackgroundImage:tabBackground];
    // Set background for only this UITabBar
    [[self.tabBarController tabBar] setBackgroundImage:tabBackground];
    
    /*UIImage *summaryBarItemBg = [UIImage imageNamed:@"grad.png"];
    UITabBar *tabbar = self.tabBarController.tabBar;
    UITabBarItem *item0 = [tabbar.items objectAtIndex:0];
    UITabBarItem *item1 = [tabbar.items objectAtIndex:1];
    UITabBarItem *item2 = [tabbar.items objectAtIndex:2];
    UITabBarItem *item3 = [tabbar.items objectAtIndex:3];
    UITabBarItem *item4 = [tabbar.items objectAtIndex:4];
    
    summaryBarItemBg = nil;
    
    [item0 setFinishedSelectedImage:summaryBarItemBg withFinishedUnselectedImage:summaryBarItemBg];
    [item1 setFinishedSelectedImage:summaryBarItemBg withFinishedUnselectedImage:summaryBarItemBg];
    [item2 setFinishedSelectedImage:summaryBarItemBg withFinishedUnselectedImage:summaryBarItemBg];
    [item3 setFinishedSelectedImage:summaryBarItemBg withFinishedUnselectedImage:summaryBarItemBg];
    [item4 setFinishedSelectedImage:summaryBarItemBg withFinishedUnselectedImage:summaryBarItemBg];//*/
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
    [self setButtonAddAssignment:nil];
    [self setBottomModuleView:nil];
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
