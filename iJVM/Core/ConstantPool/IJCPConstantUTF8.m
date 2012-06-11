//
//  IJCPConstantUTF8.m
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import "IJCPConstantUTF8.h"

@implementation IJCPConstantUTF8

- (int) infoSize {
    return CFSwapInt16BigToHost(*(short *)bytes) + 2;
}

- (NSString *) value {
    
    int size = [self infoSize];
    
    NSLog(@"Size: %d", size);
    
    const char * data = bytes + 2;
    return [[NSString alloc] initWithBytes:data length:size-2 encoding:NSUTF8StringEncoding];
}

@end
