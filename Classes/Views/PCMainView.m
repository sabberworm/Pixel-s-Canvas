//
//  PCMainView.m
//  Pixel’s Canvas
//
//  Created by Raphael Schweikert on 13.02.11.
//  Copyright 2011 Raphael Schweikert. All rights reserved.
//

#import "PCMainView.h"
#import <QuartzCore/QuartzCore.h>

@interface PCMainView()
- (CGPoint)randomPointInWindow;
- (NSColor *)randomColor;
- (void)strokePath:(NSBezierPath *)path;
- (void)fillPath:(NSBezierPath *)path;
- (float)randomFloat;
@end

@implementation PCMainView

- (id)initWithFrame:(NSRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		srandom(500);
	}
	return self;
}

- (void)drawRect:(NSRect)dirtyRect {
	// Drawing code here.
	NSBezierPath *path = [NSBezierPath new];
	[[NSColor blackColor] setStroke];
	[path setLineJoinStyle:NSRoundLineJoinStyle];
	[path moveToPoint:[self randomPointInWindow]];
	for(NSInteger i=0;i-1<arc4random()%5;i++) {
		if(arc4random()%2 == 0) {
			[path lineToPoint:NSPointFromCGPoint([self randomPointInWindow])];
		} else {
			[path curveToPoint:[self randomPointInWindow] controlPoint1:[self randomPointInWindow] controlPoint2:[self randomPointInWindow]];
		}
	}
	[path closePath];
	if(arc4random()%3 != 0) {
		[self strokePath:path];
		if(arc4random()%2 == 0) {
			[self fillPath:path];
		}
	} else {
		[self fillPath:path];
	}
	[path release];
}

- (void)strokePath:(NSBezierPath *)path {
	[[self randomColor] setStroke];
	[path setLineWidth:[self randomFloat]*8.0f];
	[path stroke];
}

- (void)fillPath:(NSBezierPath *)path {
	[[self randomColor] setFill];
	[path fill];
}

- (NSColor *)randomColor {
	return [NSColor colorWithDeviceRed:[self randomFloat] green:[self randomFloat] blue:[self randomFloat] alpha:[self randomFloat]];
}

- (float)randomFloat {
	return ((float)arc4random())/((float)UINT32_MAX);
}

- (void)keyDown:(NSEvent *)theEvent {
	[self setNeedsDisplay:YES];
}

- (CGPoint)randomPointInWindow {
	CGRect frame = [self bounds];
	return CGPointMake((CGFloat)(arc4random()%((int)frame.size.width)), (CGFloat)(arc4random()%((int)frame.size.height)));
}

- (BOOL)acceptsFirstResponder {
	return YES;
}

@end
