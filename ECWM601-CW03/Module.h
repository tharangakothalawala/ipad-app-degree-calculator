//
//  Module.h
//  ECWM601-CW03
//
//  Created by Rasanga Perera on 18/05/2013.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Assessment, Course;

@interface Module : NSManagedObject

@property (nonatomic, retain) NSNumber * credits;
@property (nonatomic, retain) NSNumber * levelId;
@property (nonatomic, retain) NSString * moduleCode;
@property (nonatomic, retain) NSNumber * moduleId;
@property (nonatomic, retain) NSString * moduleName;
@property (nonatomic, retain) NSSet *assignments;
@property (nonatomic, retain) Course *courseId;
@end

@interface Module (CoreDataGeneratedAccessors)

- (void)addAssignmentsObject:(Assessment *)value;
- (void)removeAssignmentsObject:(Assessment *)value;
- (void)addAssignments:(NSSet *)values;
- (void)removeAssignments:(NSSet *)values;

@end
