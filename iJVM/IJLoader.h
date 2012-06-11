//
//  IJLoader.h
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IJLoader <NSObject>

- (NSData *) tryLoadClass: (NSString *) className withError: (NSError **) error;

@end
