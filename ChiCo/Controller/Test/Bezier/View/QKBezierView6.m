//
//  QKBezierView6.m
//  ChiCo
//
//  Created by ChiCo on 2017/6/26.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "QKBezierView6.h"

@interface QKView6Layer : CALayer

@end

@implementation QKView6Layer

- (void)drawInContext:(CGContextRef)ctx
{
    
    //边框颜色
    CGContextSetRGBStrokeColor(ctx, 1.0, 0, 0, 1.0);
   //设置填充颜色
   CGContextSetRGBFillColor(ctx, 0.5, 1.0, 0.5, 1.0);

    //画线的宽度
    CGContextSetLineWidth(ctx, 0.5);
    /**********************************
     *     10,10---------100,10       *
     *      /               \         *
     *     /                 \        *
     *    0,100------------110,100    *
     **********************************/
    //设置起点
    CGContextMoveToPoint(ctx, 10, 10);
    CGContextAddLineToPoint(ctx, 100, 10);
    CGContextAddLineToPoint(ctx, 110, 100);
    CGContextAddLineToPoint(ctx, 0, 100);
    CGContextAddLineToPoint(ctx, 10, 10);
   
    /************************************
     画边框
     CGContextStrokePath(ctx);
     填充包裹区域
     CGContextFillPath(ctx);
     kCGPathEOFillStroke = CGContextStrokePath + CGContextFillPath
     但是 CGContextStrokePath 和 CGContextFillPath 不可以同时使用
     如果同时使用,写在前边的会生效
     ************************************/
     CGContextDrawPath(ctx, kCGPathEOFillStroke);

    
}


@end

@implementation QKBezierView6

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor whiteColor]];
        
        QKView6Layer *layer = [QKView6Layer layer];
        frame.origin = CGPointZero;
        [layer setFrame:frame];
        [layer display];
        [self.layer addSublayer:layer];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
  
}


@end
