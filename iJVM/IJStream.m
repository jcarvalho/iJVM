//
//  IJStream.m
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import "IJStream.h"
#import "IJTextViewStream.h"

@implementation IJStream

- (id) init {
    return nil;
}

+ (IJStream *) streamWithUITextView: (UITextView *) view {
    return [[IJTextViewStream alloc] initWithTextView: view];
}

- (void) append: (NSString *) text {
    
}

- (void) appendln: (NSString *) text {
    
}

@end
