//
//  IJCore.m
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import "IJCore.h"
#import "IJClass.h"
#import "IJMethod.h"

@implementation IJCore

- (NSInteger) runJavaClass: (NSString *) className outputStream: (IJStream *) outputStream 
              usingLoaders: (NSArray *) loaders {
    
    NSData* mainClassData = [self getBinaryRepresentationForClass:className 
                                                     usingLoaders:loaders stream:outputStream];
    
    @try {
        IJClass *mainClass = [IJClass loadClass:className fromData:mainClassData];
        
        [mainClass initialize];
        
        NSLog(@"Loaded class %@", [mainClass representation]);
        
        IJMethod *mainMethod = [mainClass getMethod:@"main"];
        
        if(mainMethod == nil) {
            [outputStream appendln:[NSString stringWithFormat:@"No main method!"]];
            return -1;
        } else {
            [mainMethod invoke:nil];
            return 0;
        }
    }
    @catch (NSException *exception) {
        [outputStream appendln:[NSString stringWithFormat:@"Error: %@", exception]];
    } 

}

- (NSData *) getBinaryRepresentationForClass: (NSString*) name usingLoaders: (NSArray *) loaders 
                                      stream: (IJStream*) stream {
    
    NSData *ret = nil;
    NSError *error = nil;
    
    for (id<IJLoader> loader in loaders) {
        ret = [loader tryLoadClass:name withError:&error];
    }
    
    if(ret == nil)
        [stream appendln:[NSString stringWithFormat:@"Error: cannot get binary representation for class %@", name]];
    else 
        [stream appendln:[NSString stringWithFormat:@"Loaded binary representation for class: %@", name]];
    
    return ret;
}

@end
