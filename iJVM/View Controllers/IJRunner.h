//
//  IJRunner.h
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IJRunner : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *className;
@property (weak, nonatomic) IBOutlet UIButton *run;
@property (weak, nonatomic) IBOutlet UITextView *output;

- (IBAction)run:(id)sender;

@end
