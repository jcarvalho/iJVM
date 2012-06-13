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
#import "IJFieldInfo.h"

@implementation IJClass

@synthesize representation;

+ (IJClass *) loadClass: (NSString*) name fromData: (NSData *) data {
    
    NSMutableString *repr = [[NSMutableString alloc] initWithString:name];
    
    NSData *magicBytes = [data subdataWithRange:NSMakeRange(0, 4)];
    const char cafebabe[] = { 0xCA, 0xFE, 0xBA, 0xBE };
    if(![magicBytes isEqualToData:[NSData dataWithBytes:cafebabe length:4]]) {
        [NSException raise:@"" format:@"Not a java ClassFile!"];
    }
    
    [repr appendFormat:@"\nMagicBytes: %@\n", magicBytes];

    int minorVersion = [data extractInt16FromOffset:4];
    int majorVersion = [data extractInt16FromOffset:6];
    
    if(majorVersion != 51)
        [NSException raise:@"" format:@"Error: iJVM only supports Java 7 classes with 51 major version"];
    
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
    offset += 2;

    IJCPConstantUTF8 *thisClassName = [constantPool objectAtIndex:[thisClass nameIndex]];    
    
    [repr appendFormat:@"This class:%@ : %@\n", thisClass, [thisClassName value]];
    
    
    IJCPClassInfo *superClass = [constantPool objectAtIndex:[data extractInt16FromOffset:offset]];
    offset += 2;
    
    IJCPConstantUTF8 *superClassName = [constantPool objectAtIndex:[superClass nameIndex]];    
    
    [repr appendFormat:@"Super class:%@ : %@\n", superClass, [superClassName value]];
    
    
    int interfacesCount = [data extractInt16FromOffset:offset];
    offset += 2;
    
    [repr appendFormat:@"Interface count: %d\n", interfacesCount];
    
    NSMutableArray *interfaces = [[NSMutableArray alloc] initWithCapacity:interfacesCount];
    
    for(int i = 0; i  < interfacesCount; i++) {
        int index = [data extractInt16FromOffset:offset];
        offset += 2;
        
        [interfaces addObject:[constantPool objectAtIndex:index]];
    }
    
    [repr appendFormat:@"Implemented interfaces: "];
    
    for (IJCPClassInfo *interface in interfaces) {
        IJCPConstantUTF8 *className = [constantPool objectAtIndex:[interface nameIndex]];
        [repr appendFormat:@"%@\n", [className value]];
    }
    
    
    int fieldsCount = [data extractInt16FromOffset:offset];
    offset += 2;
    
    [repr appendFormat:@"Field count: %d\n", fieldsCount];
    
    NSMutableArray *fields = [[NSMutableArray alloc] initWithCapacity:fieldsCount];
    
    for(int i = 0; i < fieldsCount; i++) {
        IJFieldInfo *field = [IJFieldInfo extractFieldFromData:data atOffset:offset];
        offset += [field bitSize];
        [fields addObject:field];
    }
    
    
    
    
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
