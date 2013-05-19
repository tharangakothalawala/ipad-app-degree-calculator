//
//  ReportCardMasterViewController.h
//  ECWM601-CW03
//
//  Created by Rasanga Pathirage Perera on 14/05/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourseNamePopoverVIewController.h"

@class ReportCardDetailViewController;

#import <CoreData/CoreData.h>

@interface ReportCardMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate, CourseNamePopOverDelegate>

@property (strong, nonatomic) ReportCardDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet UILabel *levelNameLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonModuleAdd;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonCourseAdd;
@property (weak, nonatomic) IBOutlet UITextField *textBoxModuleCode;
@property (weak, nonatomic) IBOutlet UITextField *textBoxModuleName;
@property (weak, nonatomic) IBOutlet UILabel *labelModuleCode;
@property (weak, nonatomic) IBOutlet UILabel *labelModuleName;

@property (nonatomic, strong) NSMutableArray *moduleList;
@property (nonatomic, assign) int courseLevelId;

-(void) displayLevel:(int) levelId;
-(void) hideLevelDetails;
-(void) showDaysLeft;
 
@end
