//
//  IJClass.m
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import "IJClass.h"
#import "NSData+ByteArrayUtils.h"
#import "IJCPInfo.h"
#import "IJAccessFlags.h"
#import "IJCPClassInfo.h"
#import "IJCPConstantUTF8.h"

@implementation IJClass

@synthesize representation;

+ (IJClass *) loadClass: (NSString*) name fromData: (NSData *) data {
    
    NSMutableString *repr = [[NSMutableString alloc] init];
    
    NSData *magicBytes = [data subdataWithRange:NSMakeRange(0, 4)];
    const char cafebabe[] = { 0xCA, 0xFE, 0xBA, 0xBE };
    if(![magicBytes isEqualToData:[NSData dataWithBytes:cafebabe length:4]]) {
        [NSException raise:@"" format:@"Not a java ClassFile!"];
    }
    
    [repr appendFormat:@"MagicBytes: %@\n", magicBytes];

    int minorVersion = [data extractInt16FromOffset:4];
    int majorVersion = [data extractInt16FromOffset:6];
    [repr appendFormat:@"Minor version: %d. Major version: %d\n", minorVersion, majorVersion];
    
    int constantPoolCount = [data extractInt16FromOffset:8];
    
    NSMutableArray *constantPool = [NSMutableArray arrayWithCapacity:constantPoolCount];
    
    [constantPool addObject:[NSObject alloc]];
    
    [repr appendFormat:@"Constant pool count: %d\n", constantPoolCount];
    
    const char * constantPoolBytes = [data bytes] + 10;
    
    int offset = 10;
    
    for(int i = 1; i < constantPoolCount; i++) {
        IJCPInfo *info = [IJCPInfo infoWithBytes:constantPoolBytes];
        [constantPool addObject:info];
        offset += [info size];
        constantPoolBytes += [info size];
    }
    
    [repr appendFormat:@"Constant Pool contents: %@\n", constantPool];
    
    IJAccessFlags *accessFlags = [[IJAccessFlags alloc] initWithFlags:[data extractInt16FromOffset:offset]];
    
    [repr appendFormat:@"Access Flags: %@\n", [accessFlags stringRepresentation]];
    
    offset += 2;
    
    IJCPClassInfo *thisClass = [constantPool objectAtIndex:[data extractInt16FromOffset:offset]];
    
    IJCPConstantUTF8 *thisClassName = [constantPool objectAtIndex:[thisClass nameIndex]];    
    
    [repr appendFormat:@"This class:%@ : %@\n", thisClass, [thisClassName value]];
    
    offset += 2;
    
    IJCPClassInfo *superClass = [constantPool objectAtIndex:[data extractInt16FromOffset:offset]];
    
    IJCPConstantUTF8 *superClassName = [constantPool objectAtIndex:[superClass nameIndex]];    
    
    [repr appendFormat:@"This class:%@ : %@\n", superClass, [superClassName value]];
    
    IJClass * newClass = [[IJClass alloc] init];
    
    [newClass setRepresentation:repr];
    
    return newClass;
}

- (void) initialize {
    
}

- (IJMethod *) getMethod: (NSString *) method {
    return nil;
}

@end
