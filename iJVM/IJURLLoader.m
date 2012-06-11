//
//  IJURLLoader.m
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import "IJURLLoader.h"

@implementation IJURLLoader

- (id) initWithBaseURL: (NSString *) url {
    self = [super init];
    if(self) {
        base = url;
    }
    return self;
}

- (NSData *) tryLoadClass: (NSString *) className withError:(NSError **)error {
    NSString *realURL = [[className 
                          stringByReplacingOccurrencesOfString:@"." withString:@"/"] 
                         stringByAppendingFormat:@".class"];
    
    NSURLRequest *request = [NSURLRequest 
                             requestWithURL:[NSURL URLWithString:[base stringByAppendingFormat:@"/%@", realURL]]];
    
    NSHTTPURLResponse *response = nil;
    
    NSData *result = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:error];
    
    if([response statusCode] != 200)
        return nil;
    else 
        return result;
}

@end
