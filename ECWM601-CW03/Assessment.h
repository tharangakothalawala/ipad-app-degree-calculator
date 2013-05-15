//
//  Assessment.h
//  ECWM601-CW03
//
//  Created by Rasanga Perera on 15/05/2013.
//
//

#import <Foundation/Foundation.h>

@interface Assessment : NSObject

@property (nonatomic, strong) NSString *assesmentName;
@property (nonatomic, strong) NSDate *assesmentDueDate;
@property (nonatomic, assign) int *assesmentWeight;
@property (nonatomic, assign) int assignmentMark;

@end
