//
//  IJRunner.m
//  iJVM
//
//  Created by Joao Pedro Carvalho on 6/11/12.
//  Copyright (c) 2012 IST. All rights reserved.
//

#import "IJRunner.h"
#import "IJStream.h"
#import "IJURLLoader.h"
#import "IJCore.h"

@implementation IJRunner
@synthesize className;
@synthesize run;
@synthesize output;


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [self setRun:nil];
    [self setClassName:nil];
    [self setOutput:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)run:(id)sender {
    
    [self.view endEditing:YES];
    
    [output setText:@"Running Java program...\n"];
    
    NSString *name = [className text];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
        NSString *base = @"http://jcarvalho.drapache.com/java";
    
        IJStream *stream = [IJStream streamWithUITextView:output];
    
        NSArray *loaders = [NSArray arrayWithObject:[[IJURLLoader alloc] initWithBaseURL:base]];
    
        IJCore *core = [[IJCore alloc] init];
    
        [core runJavaClass: name outputStream:stream usingLoaders:loaders];
        
    });
}



@end
