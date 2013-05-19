//
//  SummaryView.h
//  ECWM601-CW03
//
//  Created by Tharanga S Kothalawala on 16/05/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SummaryView : UIView

// draws the initial line graph, X and Y Axis
- (void) drawGrid;

// draws the lines - the data
- (void) drawLines;

// scoreList to hold the module scores
@property (nonatomic, strong) NSMutableArray* scoreList;

- (void) drawGraph:(NSMutableArray*) scoreArray;

@end
