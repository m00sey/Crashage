//
//  ViewOne.h
//  Crashage
//
//  Created by Kevin Griffin on 9/10/10.
//  Copyright 2010 Chariot Solutions LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewTwo.h"

@interface ViewOne : UIViewController {
	IBOutlet UIImageView *imageView;
	IBOutlet UIButton *btnLeave;
	UIImage *image;
}
- (void) leave:(id) sender;
- (void) updateImage:(UIImage *) img;
@end
