//
//  DatePickerPopoverViewController.m
//  ECWM601-CW03
//
//  Created by Tharanga Kothalawala on 17/05/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "DatePickerPopoverViewController.h"

@implementation DatePickerPopoverViewController

@synthesize delegate = _delegate;
@synthesize datePickerDueDate = _datePickerDueDate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setDatePickerDate:(NSDate *) dueDate;
{
    self.datePickerDueDate.date = dueDate;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewWillDisappear:(BOOL)animated
{
    [self.delegate setDueDate:self.datePickerDueDate.date];
}

- (void)viewDidUnload
{
    [self setDatePickerDueDate:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
