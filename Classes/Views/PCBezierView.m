//
//  PCBezierView.m
//  Pixel’s Canvas
//
//  Created by Raphael Schweikert on 13.02.11.
//  Copyright 2011 Raphael Schweikert. All rights reserved.
//

#import "PCBezierView.h"

@implementation PCBezierView

@synthesize path;

- (id)initWithFrame:(NSRect)frame andPath:(NSBezierPath *)aPath {
	self = [super initWithFrame:frame];
	if (self) {
		self.path = aPath;
		[self setWantsLayer:YES];
	}
	return self;
}

- (void)dealloc {
	self.path = nil;
	[super dealloc];
}

- (void)drawRect:(NSRect)dirtyRect {
	[self.path stroke];
}

@end
