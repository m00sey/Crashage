//
//  ViewOne.m
//  Crashage
//
//  Created by Kevin Griffin on 9/10/10.
//  Copyright 2010 Chariot Solutions LLC. All rights reserved.
//

#import "ViewOne.h"


@implementation ViewOne

-(void) viewDidLoad {
	[self makeMeCrash];
}

-(void) makeMeCrash {
	[self performSelectorInBackground:@selector(loadImage) withObject:nil];
}

- (void) loadImage {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	NSLog(@"loading");
	[NSThread sleepForTimeInterval:7.0];
	image = [UIImage imageNamed:@"snowy.jpg"];
	[self performSelectorOnMainThread:@selector(updateImage) withObject:nil waitUntilDone:YES];
	[pool release];
}

- (void) updateImage {
	NSLog(@"updating");
	[imageView setImage:image];
}

- (void) leave:(id)sender {
	NSLog(@"leave");
	ViewTwo *viewTwo = [[ViewTwo alloc] init];
	[[self navigationController] pushViewController:viewTwo animated:YES];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
	NSLog(@"unloading");
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
