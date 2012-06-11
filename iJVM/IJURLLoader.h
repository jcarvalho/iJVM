//
//  IJURLLoader.h
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IJLoader.h"

@interface IJURLLoader : NSObject<IJLoader> {
    NSString *base;
}

- (id) initWithBaseURL: (NSString *) url;

@end
