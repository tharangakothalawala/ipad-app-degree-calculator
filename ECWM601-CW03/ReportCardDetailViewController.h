//
//  ReportCardDetailViewController.h
//  ECWM601-CW03
//
//  Created by Rasanga Pathirage Perera on 14/05/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatePickerPopoverViewController.h"

@interface ReportCardDetailViewController : UIViewController <UISplitViewControllerDelegate, UITabBarDelegate, DatePickerPopOverDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UITabBarItem *levelFourBarItem;
@property (weak, nonatomic) IBOutlet UITabBarItem *levelFiveBarItem;
@property (weak, nonatomic) IBOutlet UITabBarItem *levelSIxBarItem;
@property (weak, nonatomic) IBOutlet UITabBarItem *datesBarItem;
@property (weak, nonatomic) IBOutlet UITabBarItem *summaryBarItem;
@property (strong, nonatomic) IBOutletCollection(UITabBarItem) NSArray *levelFourBarItemCollection;
@property (weak, nonatomic) IBOutlet UITabBar *courseTabBar;

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

@property (assign, nonatomic) int dueDateIdentifier;

// Summary View
@property (weak, nonatomic) IBOutlet UIView *summaryView;
@end
