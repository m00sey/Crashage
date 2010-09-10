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
		//[self performSelectorOnMainThread:@selector(updateImage:) withObject:photo waitUntilDone:YES];	
		[self updateImage:photo];
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
