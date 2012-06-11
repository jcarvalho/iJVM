//
//  IJTextViewStream.m
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import "IJTextViewStream.h"

@implementation IJTextViewStream

- (id) initWithTextView: (UITextView *) textView {
    view = textView;
    return self;
}

- (void) append: (NSString *) text {
    dispatch_sync(dispatch_get_main_queue(), ^{
        [view setText:[[view text] stringByAppendingFormat:@"%@", text]];
        [view scrollRangeToVisible:NSMakeRange([view.text length], 0)];
    });
}

- (void) appendln: (NSString *) text {
    dispatch_sync(dispatch_get_main_queue(), ^{
        [view setText:[[view text] stringByAppendingFormat:@"%@\n", text]];
        [view scrollRangeToVisible:NSMakeRange([view.text length], 0)];
    });
}

@end
