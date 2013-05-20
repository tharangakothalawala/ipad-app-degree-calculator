//
//  DatePickerPopoverViewController.h
//  ECWM601-CW03
//
//  Created by Tharanga Kothalawala on 17/05/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePickerPopOverDelegate <NSObject>

@required
- (void) setDueDate:(NSDate *) date;
@end


@interface DatePickerPopoverViewController : UIViewController

@property (nonatomic, weak) IBOutlet id <DatePickerPopOverDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerDueDate;

- (void)setDatePickerDate:(NSDate *) dueDate;

@end
