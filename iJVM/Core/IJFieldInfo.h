//
//  IJFieldInfo.h
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/13/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IJFieldInfo : NSObject

+ (IJFieldInfo *) extractFieldFromData: (NSData *) data atOffset: (int) offset;

- (int) bitSize;

@end
