//
//  CourseNamePopoverVIewController.h
//  ECWM601-CW03
//
//  Created by Tharanga Kothalawala on 17/05/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CourseNamePopOverDelegate <NSObject>

@required
- (void) setCourseName:(NSString *) value;
@end

@interface CourseNamePopoverVIewController : UIViewController

@property (nonatomic, weak) IBOutlet id <CourseNamePopOverDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *textboxCourseName;

@end
