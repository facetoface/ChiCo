//
//  QKBezierView6.m
//  ChiCo
//
//  Created by ChiCo on 2017/6/26.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "QKBezierView6.h"

@implementation QKBezierView6

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CALayer *layer1 = [CALayer layer];
        [self.layer addSublayer:layer1];
        
        CGContextRef contextRef = UIGraphicsGetCurrentContext();
        CGContextSetRGBFillColor (contextRef,  1, 0, 0, 1.0);
        CGContextAddArc(contextRef, 100, 20, 15, 0, 2*M_PI, 0);
        [layer1 drawInContext:contextRef];
        
    }
    return self;
}

@end
