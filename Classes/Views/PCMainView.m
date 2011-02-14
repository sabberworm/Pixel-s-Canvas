//
//  PCMainView.m
//  Pixel’s Canvas
//
//  Created by Raphael Schweikert on 13.02.11.
//  Copyright 2011 Raphael Schweikert. All rights reserved.
//

#import "PCMainView.h"
#import <QuartzCore/QuartzCore.h>

#import "PCRandom.h"

@interface PCMainView()
- (void)renewPath;
- (void)renewBackground;
- (void)strokePath:(NSBezierPath *)path;
- (void)fillPath:(NSBezierPath *)path;
@end

@implementation PCMainView

- (id)initWithFrame:(NSRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self renewPath];
		[self resetBackground];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self renewPath];
		[self resetBackground];
	}
	return self;
}

- (void)dealloc {
	[path release];
	[backgroundColor release];
	[super dealloc];
}

- (void)renewBackground {
	backgroundColor = [[PCRandom randomSolidColor] retain];
}

- (void)resetBackground {
	backgroundColor = [[NSColor whiteColor] retain];
}

- (void)renewPath {
	path = [[PCRandom randomPathWithMinPoints:2 maxPoints:5 withSize:self.frame.size] retain];
}

- (void)drawRect:(NSRect)dirtyRect {
	if(backgroundColor != nil) {
    [backgroundColor setFill];
    NSRectFill(dirtyRect);
	}
	// Drawing code here.
	if(arc4random()%3 != 0) {
		[self strokePath:path];
		if([PCRandom randomBool]) {
			[self fillPath:path];
		}
	} else {
		[self fillPath:path];
	}
}

- (void)strokePath:(NSBezierPath *)aPath {
	[[PCRandom randomColor] setStroke];
	[aPath setLineWidth:[PCRandom randomFloat]*8.0f];
	[aPath stroke];
}

- (void)fillPath:(NSBezierPath *)aPath {
	[[PCRandom randomColor] setFill];
	[aPath fill];
}

- (void)keyDown:(NSEvent *)theEvent {
	if([theEvent isARepeat]) {
		return;
	}
	if([theEvent keyCode] == 53) {
		[self resetBackground];
	} else {
		[self renewPath];
	}
	[self setNeedsDisplay:YES];
}

- (void)mouseUp:(NSEvent *)theEvent {
	[self renewBackground];
	[self setNeedsDisplay:YES];
}

- (BOOL)acceptsFirstResponder {
	return YES;
}

@end
