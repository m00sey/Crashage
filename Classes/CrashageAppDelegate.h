//
//  CrashageAppDelegate.h
//  Crashage
//
//  Created by Kevin Griffin on 9/10/10.
//  Copyright Chariot Solutions LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewOne.h"

@interface CrashageAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

