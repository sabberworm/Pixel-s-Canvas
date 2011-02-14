//
//  PCRandom.h
//  Pixel’s Canvas
//
//  Created by Raphael Schweikert on 14.02.11.
//  Copyright 2011 Raphael Schweikert. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface PCRandom : NSObject {

}

+ (u_int32_t) randomInt;
+ (NSColor *) randomColor;
+ (NSColor *) randomSolidColor;
+ (CGFloat) randomFloat;
+ (BOOL) randomBool;
+ (CGPoint) randomPointWithSize:(CGSize)size;
+ (NSBezierPath *)randomPathWithMinPoints:(NSUInteger)minPoints maxPoints: (NSUInteger)maxPoints withSize:(CGSize)size;

@end
