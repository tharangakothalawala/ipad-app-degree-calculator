//
//  Calculations.m
//  ECWM601-CW03
//
//  Created by Tharanga S Kothalawala on 19/05/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Calculations.h"

@implementation Calculations

- (double)getModuleOverall:(NSMutableArray *)moduleAssessmentDetailArray {
    double moduleOverall = 0;
    
    //NSLog(@"getModuleOverall:moduleAssessmentDetailArray : %@", moduleAssessmentDetailArray);
    int assessmentCount = [moduleAssessmentDetailArray count];
    double eachAssessmentOverall = 0;
    for (int i = 0; i < assessmentCount; i++) {
        NSArray *moduleAssessmentWeightMark = [[moduleAssessmentDetailArray objectAtIndex:i] componentsSeparatedByString:@":"];

        double weight = [[moduleAssessmentWeightMark objectAtIndex:0] floatValue];
        double mark = [[moduleAssessmentWeightMark objectAtIndex:1] floatValue];

        eachAssessmentOverall += (mark / 100) * weight;
    }
    NSLog(@"moduleOverall : %g", eachAssessmentOverall);
    moduleOverall = eachAssessmentOverall;
    
    return moduleOverall;
}

- (double)getLevelOverall:(NSMutableArray *)moduleDetailArray {
    //NSLog(@"getModuleOverall:moduleDetailArray : %@", moduleDetailArray);
    int moduleCount = [moduleDetailArray count];
    
    double eachModuleOverallResult = 0.0;
    for (int i = 0; i < moduleCount; i++) {
        eachModuleOverallResult += [[moduleDetailArray objectAtIndex:i] doubleValue];
    }
    eachModuleOverallResult = eachModuleOverallResult / moduleCount;
    
    return eachModuleOverallResult;
}

- (NSString*)getdegreePrediction:(double)levelOverall {
    NSString *result = @"";
    
    if (levelOverall > 70.0) {
        return @"First";
    } else if (levelOverall > 60.0) {
        return @"Upper Second";
    } else if (levelOverall > 50.0) {
        return @"Lower Second";
    } else if (levelOverall > 40.0) {
        return @"Third";
    }
    
    return result;
}

@end
