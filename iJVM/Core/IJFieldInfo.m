//
//  IJFieldInfo.m
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/13/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import "IJFieldInfo.h"
#import "NSData+ByteArrayUtils.h"

@implementation IJFieldInfo

+ (IJFieldInfo *) extractFieldFromData: (NSData *) data atOffset: (int) offset {
    
    int accessFlags = [data extractInt16FromOffset:offset];
    offset += 2;
    
    NSLog(@"Access flags: %d", accessFlags);
    
    int nameIndex = [data extractInt16FromOffset:offset];
    offset += 2;
    
    NSLog(@"Name index: %d", nameIndex);
    
    int fieldDescriptor = [data extractInt16FromOffset:offset];
    offset += 2;
    
    NSLog(@"Field descriptor: %d", fieldDescriptor);
    
    int attributeCount = [data extractInt16FromOffset:offset];
    offset += 2;
    
    NSLog(@"Attribute count: %d", attributeCount);

    
    return [[IJFieldInfo alloc] init];
    
}

- (int) bitSize {
    return 0;
}

@end
