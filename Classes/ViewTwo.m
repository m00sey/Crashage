//
//  ViewTwo.m
//  Crashage
//
//  Created by Kevin Griffin on 9/10/10.
//  Copyright 2010 Chariot Solutions LLC. All rights reserved.
//

#import "ViewTwo.h"


@implementation ViewTwo

-(void) viewDidLoad {
	[[self navigationController] setTitle:@"Hello Issue"];
	@try {
		[self performSelectorInBackground:@selector(loadImage) withObject:nil];
	}
	@catch (NSException * e) {
		NSLog(@"Caught %@: %@", [e name], [e reason]);
	}
}

- (void) loadImage {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	NSLog(@"loading");
	
	NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://www.wv838.com/Memorabilia/snowy.jpg"]];
	UIImage *photo = [UIImage imageWithData:imageData];
	[imageData release];
	@try {
		[self performSelectorOnMainThread:@selector(updateImage:) withObject:photo waitUntilDone:YES];	
	}
	@catch (NSException * e) {
		NSLog(@"loadImage Caught %@: %@", [e name], [e reason]);
		return;
	}
	[pool release];
}

- (void) updateImage:(UIImage *) img {
	NSLog(@"updating");
	[imageView setImage:img];
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[imageView dealloc];
    [super dealloc];
}


@end
