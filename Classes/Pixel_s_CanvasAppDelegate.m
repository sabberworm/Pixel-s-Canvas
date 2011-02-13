//
//  Pixel_s_CanvasAppDelegate.m
//  Pixel’s Canvas
//
//  Created by Raphael Schweikert on 13.02.11.
//  Copyright 2011 Raphael Schweikert. All rights reserved.
//

#import "Pixel_s_CanvasAppDelegate.h"

@implementation Pixel_s_CanvasAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	CGCaptureAllDisplays();
	CGDisplayHideCursor(kCGDirectMainDisplay);
	NSView *contentView = [window contentView];
	[contentView enterFullScreenMode:[NSScreen mainScreen] withOptions:nil];
}

@end
