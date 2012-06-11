//
//  IJAccessFlags.h
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IJAccessFlags : NSObject

- (id) initWithFlags: (int) flags;

- (NSString*) stringRepresentation;

- (BOOL) maskHolds: (int) mask flags: (int) flags;

@property BOOL isPublic;
@property BOOL isFinal;
@property BOOL isSuper;
@property BOOL isInterface;
@property BOOL isAbstract;
@property BOOL isSynthetic;
@property BOOL isAnnotation;
@property BOOL isEnum;
@property int flags;

@end
