//
//  IJCPInfo.h
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IJCPInfo : NSObject {
    const char * bytes;
    int actualSize;
}

- (int) size;

- (int) infoSize;

- (id) initWithData: (const char *) data;

+ (IJCPInfo *) infoWithBytes: (const char *) bytes;

@end
