//
//  Calculations.h
//  ECWM601-CW03
//
//  Created by Tharanga S Kothalawala on 19/05/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculations : NSObject

- (double) getModuleOverall: (NSMutableArray*) moduleAssessmentDetailArray;
- (double) getLevelOverall: (NSMutableArray*) moduleDetailArray;
- (NSString*)getdegreePrediction:(double)levelOverall;

@end