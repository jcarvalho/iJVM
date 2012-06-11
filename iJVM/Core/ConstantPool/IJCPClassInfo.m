//
//  IJCPClassInfo.m
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import "IJCPClassInfo.h"

@implementation IJCPClassInfo

- (int) infoSize {
    return 2;
}

- (int) nameIndex {
    return CFSwapInt16BigToHost(*(short *)bytes);
}

@end
