//
//  IJStream.h
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IJStream : NSObject

+ (IJStream *) streamWithUITextView: (UITextView *) view;

- (void) append: (NSString *) text;

- (void) appendln: (NSString *) text;

@end
