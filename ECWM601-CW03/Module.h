//
//  Module.h
//  ECWM601-CW03
//
//  Created by Rasanga Perera on 15/05/2013.
//
//

#import <Foundation/Foundation.h>

@interface Module : NSObject

@property (nonatomic, strong) NSString *moduleName;
@property (nonatomic, strong) NSString *moduleCode;
@property (nonatomic, assign) int credits;
@property (nonatomic, strong) NSMutableDictionary *assementsList;

@end
