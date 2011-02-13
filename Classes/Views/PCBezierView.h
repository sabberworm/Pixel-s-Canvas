//
//  PCBezierView.h
//  Pixel’s Canvas
//
//  Created by Raphael Schweikert on 13.02.11.
//  Copyright 2011 Raphael Schweikert. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface PCBezierView : NSView {
	NSBezierPath *path;
}

@property(nonatomic,retain) NSBezierPath *path;

@end
