//
//  IJCPInfo.m
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import "IJCPInfo.h"
#import "IJCPConstantUTF8.h"
#import "IJCPClassInfo.h"
#import "IJCPStringInfo.h"
#import "IJCPMethodRef.h"
#import "IJCPFieldRef.h"
#import "IJCPNameAndTypeInfo.h"

@implementation IJCPInfo

- (int) size {
    return actualSize;
}

- (int) infoSize {
    return 0;
}

- (id) initWithData:(const char *)data {
    self = [self init];
    if(self) {
        bytes = data + 1;
        actualSize = 1 + [self infoSize];
    }
    return self;
}

+ (IJCPInfo *) infoWithBytes: (const char *) bytes {
    
    IJCPInfo *info;
    
    char type = bytes[0];
    
    switch (type) {
        case 1:
            info = [IJCPConstantUTF8 alloc];
            break;
        case 7:
            info = [IJCPClassInfo alloc];
            break;
        case 8:
            info = [IJCPStringInfo alloc];
            break;
        case 9:
            info = [IJCPFieldRef alloc];
            break;
        case 10:
            info = [IJCPMethodRef alloc];
            break;
        case 12:
            info = [IJCPNameAndTypeInfo alloc];
            break;
        default:
            NSLog(@"Type is: %d", type);
            break;
    }
    
    info = [info initWithData:bytes];
    
    return info;
}

@end
