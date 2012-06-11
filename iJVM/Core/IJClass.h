//
//  IJClass.h
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IJMethod.h"

@interface IJClass : NSObject

+ (IJClass *) loadClass: (NSString*) name fromData: (NSData *) data;

- (void) initialize;

- (IJMethod *) getMethod: (NSString *) method;

@property (strong) NSString *representation;

@end
