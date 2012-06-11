//
//  IJMethod.h
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IJHandle.h"

@interface IJMethod : NSObject

- (void) invoke: (IJHandle *) handles, ...;

@end
