//
//  IJTextViewStream.h
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import "IJStream.h"

@interface IJTextViewStream : IJStream {
    __weak UITextView *view;
}

- (id) initWithTextView: (UITextView *) textView;

@end
