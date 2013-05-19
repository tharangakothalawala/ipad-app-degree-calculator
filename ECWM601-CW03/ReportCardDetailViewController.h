//
//  ReportCardDetailViewController.h
//  ECWM601-CW03
//
//  Created by Rasanga Pathirage Perera on 14/05/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatePickerPopoverViewController.h"
#import "ReportCardMasterViewController.h"
#import "Module.h"

@interface ReportCardDetailViewController : UIViewController <UISplitViewControllerDelegate, UITabBarDelegate, DatePickerPopOverDelegate>

@property (strong, nonatomic) ReportCardMasterViewController *masterViewController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) Module *module;

@property (weak, nonatomic) IBOutlet UITabBarItem *levelFourBarItem;
@property (weak, nonatomic) IBOutlet UITabBarItem *levelFiveBarItem;
@property (weak, nonatomic) IBOutlet UITabBarItem *levelSIxBarItem;
@property (weak, nonatomic) IBOutlet UITabBarItem *datesBarItem;
@property (weak, nonatomic) IBOutlet UITabBarItem *summaryBarItem;
@property (strong, nonatomic) IBOutletCollection(UITabBarItem) NSArray *levelFourBarItemCollection;
@property (weak, nonatomic) IBOutlet UITabBar *courseTabBar;
@property (weak, nonatomic) IBOutlet UIButton *buttonAddAssignment;

// UI Elements
@property (weak, nonatomic) IBOutlet UITextField *textBoxModuleTitle;
@property (weak, nonatomic) IBOutlet UITextField *textBoxModuleCredit;

@property (weak, nonatomic) IBOutlet UITextField *textBoxAssignment1Title;
@property (weak, nonatomic) IBOutlet UITextField *textBoxAssignment2Title;
@property (weak, nonatomic) IBOutlet UITextField *textBoxAssignment3Title;
@property (weak, nonatomic) IBOutlet UITextField *textBoxAssignment4Title;
@property (weak, nonatomic) IBOutlet UITextField *textBoxAssignment5Title;
@property (weak, nonatomic) IBOutlet UITextField *textBoxAssignment6Title;
@property (weak, nonatomic) IBOutlet UITextField *textBoxAssigment1Mark;
@property (weak, nonatomic) IBOutlet UITextField *textBoxAssigment2Mark;
@property (weak, nonatomic) IBOutlet UITextField *textBoxAssigment3Mark;
@property (weak, nonatomic) IBOutlet UITextField *textBoxAssigment4Mark;
@property (weak, nonatomic) IBOutlet UITextField *textBoxAssigment5Mark;
@property (weak, nonatomic) IBOutlet UITextField *textBoxAssigment6Mark;
@property (weak, nonatomic) IBOutlet UILabel *textBoxAssigment1Dates;
@property (weak, nonatomic) IBOutlet UILabel *textBoxAssigment2Dates;
@property (weak, nonatomic) IBOutlet UILabel *textBoxAssigment3Dates;
@property (weak, nonatomic) IBOutlet UILabel *textBoxAssigment4Dates;
@property (weak, nonatomic) IBOutlet UILabel *textBoxAssigment5Dates;
@property (weak, nonatomic) IBOutlet UILabel *textBoxAssigment6Dates;
@property (weak, nonatomic) IBOutlet UILabel *labelFinalModuleMark;
@property (weak, nonatomic) IBOutlet UITextField *textBoxAssignment1Wegiht;
@property (weak, nonatomic) IBOutlet UITextField *textBoxAssignment2Wegiht;
@property (weak, nonatomic) IBOutlet UITextField *textBoxAssignment3Wegiht;
@property (weak, nonatomic) IBOutlet UITextField *textBoxAssignment4Wegiht;
@property (weak, nonatomic) IBOutlet UITextField *textBoxAssignment5Wegiht;
@property (weak, nonatomic) IBOutlet UITextField *textBoxAssignment6Wegiht;

@property (assign, nonatomic) int dueDateIdentifier;

@property (weak, nonatomic) IBOutlet UIView *assignment1View;
@property (weak, nonatomic) IBOutlet UIView *assignment2View;
@property (weak, nonatomic) IBOutlet UIView *assignment3View;
@property (weak, nonatomic) IBOutlet UIView *assignment4View;
@property (weak, nonatomic) IBOutlet UIView *assignment5View;
@property (weak, nonatomic) IBOutlet UIView *assignment6View;
@property (assign, nonatomic) int assignmentPointer;

// Summary View
@property (weak, nonatomic) IBOutlet UIView *summaryView;

- (void)setDefaultLevel:(int) levelId;

@end
