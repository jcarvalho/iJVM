//
//  IJAccessFlags.m
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import "IJAccessFlags.h"

@implementation IJAccessFlags

@synthesize isPublic;
@synthesize isFinal;
@synthesize isSuper;
@synthesize isInterface;
@synthesize isAbstract;
@synthesize isSynthetic;
@synthesize isAnnotation;
@synthesize isEnum;
@synthesize flags;

- (id) initWithFlags:(int)flag {
    self = [super init];
    if(self) {
        [self setFlags:flag];
        [self setIsPublic:[self maskHolds:0x0001 flags: flag]];
        [self setIsFinal:[self maskHolds:0x0010 flags: flag]];
        [self setIsSuper:[self maskHolds:0x0020 flags: flag]];
        [self setIsInterface:[self maskHolds:0x0200 flags: flag]];
        [self setIsAbstract:[self maskHolds:0x0400 flags: flag]];
        [self setIsSynthetic:[self maskHolds:0x1000 flags: flag]];
        [self setIsAnnotation:[self maskHolds:0x2000 flags: flag]];
        [self setIsEnum:[self maskHolds:0x4000 flags: flag]];

    }
    return self;
}

- (BOOL) maskHolds: (int) mask flags: (int) flag {
    return (flag & mask) != 0;
}

- (NSString*) stringRepresentation {
    NSMutableArray *res = [[NSMutableArray alloc] init];
    
    if(isPublic)
        [res addObject:@"ACC_PUBLIC"];
    if(isFinal)
        [res addObject:@"ACC_FINAL"];
    if(isSuper)
        [res addObject:@"ACC_SUPER"];
    if(isInterface)
        [res addObject:@"ACC_INTERFACE"];
    if(isAbstract)
        [res addObject:@"ACC_ABSTRACT"];
    if(isSynthetic)
        [res addObject:@"ACC_SYNTHETIC"];
    if(isAnnotation)
        [res addObject:@"ACC_ANNOTATION"];
    if(isEnum)
        [res addObject:@"ACC_ENUM"];
    
    return [NSString stringWithFormat:@"%@", res];
}


@end
