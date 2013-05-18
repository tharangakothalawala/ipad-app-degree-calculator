//
//  Assessment.h
//  ECWM601-CW03
//
//  Created by Rasanga Perera on 18/05/2013.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Module;

@interface Assessment : NSManagedObject

@property (nonatomic, retain) NSDate * assesmentDueDate;
@property (nonatomic, retain) NSString * assesmentName;
@property (nonatomic, retain) NSNumber * assesmentWeight;
@property (nonatomic, retain) NSNumber * assessmentId;
@property (nonatomic, retain) NSNumber * assignmentMark;
@property (nonatomic, retain) Module *moduleId;

@end
