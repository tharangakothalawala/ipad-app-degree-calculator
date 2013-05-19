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
    double result = 0;
    
    int assessmentCount = [moduleAssessmentDetailArray count];
    double eachAssessmentOverall = 0;
    for (int i = 0; i < assessmentCount; i++) {
        NSArray *moduleAssessmentWeightMark = [[moduleAssessmentDetailArray objectAtIndex:0] componentsSeparatedByString:@":"];

        int weight = [[moduleAssessmentWeightMark objectAtIndex:0] floatValue];
        int mark = [[moduleAssessmentWeightMark objectAtIndex:1] floatValue];
        
        eachAssessmentOverall += (mark / 100) * weight;
    }
    
    return result;
}

- (double)getLevelOverall:(NSMutableArray *)moduleDetailArray {
    double result = 0;
    
    int moduleCount = [moduleDetailArray count];
    
    for (int i = 0; i < moduleCount; i++) {
        int eachModuleOverallResult = (int) [moduleDetailArray objectAtIndex:i];
        result += eachModuleOverallResult;
    }
    
    return result;
}

- (double)getdegreeOverall:(NSMutableArray *)levelDetailArray {
    double result = 0;
    
    int levelCount = [levelDetailArray count];
    
    for (int i = 0; i < levelCount; i++) {
        int eachLevelOverall = (int) [levelDetailArray objectAtIndex:i];
        result += eachLevelOverall;
    }
    
    
    return result;
}

@end
