//
//  NSData+ByteArrayUtils.h
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (ByteArrayUtils)

- (int) extractInt16FromOffset: (int) offset;
- (int) extractInt32FromOffset: (int) offset;
- (char) byteAt: (int) offset;

@end
