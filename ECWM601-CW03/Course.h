//
//  Course.h
//  ECWM601-CW03
//
//  Created by Rasanga Perera on 18/05/2013.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Module;

@interface Course : NSManagedObject

@property (nonatomic, retain) NSNumber * courseId;
@property (nonatomic, retain) NSString * courseName;
@property (nonatomic, retain) Module *modules;

@end
