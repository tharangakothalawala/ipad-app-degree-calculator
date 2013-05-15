//
//  ReportCardCourseDetailViewController.h
//  ECWM601-CW03
//
//  Created by Rasanga Pathirage Perera on 14/05/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CourseDetailsDelegate <NSObject>

@required
-(void) showModuleNavigation;
@end

@interface ReportCardCourseDetailViewController : UIViewController

@property  (nonatomic,weak) IBOutlet id <CourseDetailsDelegate> delegate;

@end
