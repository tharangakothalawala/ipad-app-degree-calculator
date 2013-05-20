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
#import "Assessment.h"
#import "Module.h"
#import "SummaryView.h"
#import "Calculations.h"

@interface ReportCardDetailViewController : UIViewController <UISplitViewControllerDelegate, UITabBarDelegate, DatePickerPopOverDelegate>

@property (strong, nonatomic) ReportCardMasterViewController *masterViewController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) Module *module;
@property (strong, nonatomic) IBOutlet SummaryView *graphView;
@property (nonatomic, strong) NSMutableArray *scoreList;

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
@property (weak, nonatomic) IBOutlet UIView *bottomModuleView;

@property (weak, nonatomic) IBOutlet UIView *assignment1View;
@property (weak, nonatomic) IBOutlet UIView *assignment2View;
@property (weak, nonatomic) IBOutlet UIView *assignment3View;
@property (weak, nonatomic) IBOutlet UIView *assignment4View;
@property (weak, nonatomic) IBOutlet UIView *assignment5View;
@property (weak, nonatomic) IBOutlet UIView *assignment6View;
@property (assign, nonatomic) int assignmentPointer;

// Summary View
@property (weak, nonatomic) IBOutlet UIView *summaryView;
@property (strong, nonatomic) NSDate *assignment1DueDate;
@property (strong, nonatomic) NSDate *assignment2DueDate;
@property (strong, nonatomic) NSDate *assignment3DueDate;
@property (strong, nonatomic) NSDate *assignment4DueDate;
@property (strong, nonatomic) NSDate *assignment5DueDate;
@property (strong, nonatomic) NSDate *assignment6DueDate;
@property (strong, nonatomic) NSMutableArray *assessments;

@property (weak, nonatomic) IBOutlet UILabel *labelLevel4Average;
@property (weak, nonatomic) IBOutlet UILabel *labelLevel5Average;
@property (weak, nonatomic) IBOutlet UILabel *labelLevel6Average;
@property (weak, nonatomic) IBOutlet UILabel *labelAwardPredictionResult;
@property (weak, nonatomic) IBOutlet UILabel *labelBest7FromLevel6;
@property (weak, nonatomic) IBOutlet UILabel *labelBest7FromLevel5And6;


- (void)setDefaultLevel:(int) levelId;
- (NSMutableArray *)fetchAssignments;
- (void)showDaysLeft;
- (int) calculateDaysLeft:(NSDate *) dueDate;
- (void)showAssessment1:(Assessment *)assessment;
- (void)showAssessment2:(Assessment *)assessment;
- (void)showAssessment3:(Assessment *)assessment;
- (void)showAssessment4:(Assessment *)assessment;
- (void)showAssessment5:(Assessment *)assessment;
- (void)showAssessment6:(Assessment *)assessment;
- (void)editAssignments;
- (void)hideAssessments;
- (void)showAssesments;

- (void)editAssignment1;
- (void)editAssignment2;
- (void)editAssignment3;
- (void)editAssignment4;
- (void)editAssignment5;
- (void)editAssignment6;

@end
