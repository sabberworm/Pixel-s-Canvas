//
//  PCRandom.m
//  Pixel’s Canvas
//
//  Created by Raphael Schweikert on 14.02.11.
//  Copyright 2011 Raphael Schweikert. All rights reserved.
//

#import "PCRandom.h"


@implementation PCRandom

+ (u_int32_t) randomInt {
	return arc4random();
}

+ (NSColor *) randomColor {
	return [NSColor colorWithDeviceRed:[PCRandom randomFloat] green:[PCRandom randomFloat] blue:[PCRandom randomFloat] alpha:[PCRandom randomFloat]];
}

+ (NSColor *) randomSolidColor {
	return [NSColor colorWithDeviceRed:[PCRandom randomFloat] green:[PCRandom randomFloat] blue:[PCRandom randomFloat] alpha:1.0f];
}

+ (CGFloat) randomFloat {
	return ((CGFloat)[PCRandom randomInt])/((CGFloat)UINT32_MAX);
}

+ (BOOL) randomBool {
	return ([PCRandom randomInt]%2) == 0;
}

+ (CGPoint) randomPointWithSize:(CGSize)size {
	return CGPointMake((CGFloat)([PCRandom randomInt]%((int)size.width)), (CGFloat)([PCRandom randomInt]%((int)size.height)));
}

+ (NSBezierPath *)randomPathWithMinPoints:(NSUInteger)minPoints maxPoints: (NSUInteger)maxPoints withSize:(CGSize)size {
	NSBezierPath *path = [NSBezierPath new];
	[[NSColor blackColor] setStroke];
	[path setLineJoinStyle:NSRoundLineJoinStyle];
	[path moveToPoint:[PCRandom randomPointWithSize:size]];
	for(NSInteger i=0;i<(arc4random()%(maxPoints-minPoints))+minPoints;i++) {
		if([PCRandom randomBool]) {
			[path lineToPoint:NSPointFromCGPoint([PCRandom randomPointWithSize:size])];
		} else {
			[path curveToPoint:[PCRandom randomPointWithSize:size] controlPoint1:[PCRandom randomPointWithSize:size] controlPoint2:[PCRandom randomPointWithSize:size]];
		}
	}
	[path closePath];
	return [path autorelease];
}

@end
