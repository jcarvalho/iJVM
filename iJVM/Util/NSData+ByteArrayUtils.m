//
//  NSData+ByteArrayUtils.m
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import "NSData+ByteArrayUtils.h"

@implementation NSData (ByteArrayUtils)

- (int) extractInt16FromOffset: (int) offset {
    NSData *data4 = [self subdataWithRange:NSMakeRange(offset, 2)];
    return CFSwapInt16BigToHost(*(int*)([data4 bytes]));
}

- (int) extractInt32FromOffset: (int) offset {
    NSData *data4 = [self subdataWithRange:NSMakeRange(offset, 4)];
    return CFSwapInt32BigToHost(*(int*)([data4 bytes]));
}

- (char) byteAt:(int)offset {
    int *ptr;
    [self getBytes:ptr range:NSMakeRange(offset, 1)];
    return *ptr;
}

@end
