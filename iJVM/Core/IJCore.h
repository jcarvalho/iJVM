//
//  IJCore.h
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IJStream.h"
#import "../IJLoader.h"


@interface IJCore : NSObject

- (NSInteger) runJavaClass: (NSString *) className outputStream: (IJStream *) outputStream 
              usingLoaders: (NSArray *) loaders;

- (NSData *) getBinaryRepresentationForClass: (NSString*) name usingLoaders: (NSArray *) loaders 
                                      stream: (IJStream*) stream;

@end
