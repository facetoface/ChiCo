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

//    CGContextAddRect(ctx, CGRectMake(120, 120, 60, 60));
    CGContextMoveToPoint(ctx, 180, 280-70);  // 开始坐标右边开始
    CGContextAddArcToPoint(ctx, 180, 280, 180-20, 280, 10);  // 右下角角度
    CGContextAddArcToPoint(ctx, 120, 280, 120, 280-10, 10); // 左下角角度
    CGContextAddArcToPoint(ctx, 120, 200, 180-20, 200, 10); // 左上角
    CGContextAddArcToPoint(ctx, 180, 200, 180, 280-70, 10); // 右上角
    CGContextStrokePath(ctx);
    
//    CGFloat arcLenth = 10;
//    CGFloat arcRadio = 60;
//    //从左上角开始
//    CGContextMoveToPoint(ctx, 120+arcRadio, 120);
//    //画右上角的拐角
//    CGContextAddArcToPoint(ctx, 180, 120, 180, 120+arcLenth, arcRadio);
//    CGContextAddArcToPoint(ctx, 180, 180, 180-arcLenth, 180, arcRadio);
//    CGContextAddArcToPoint(ctx, 120, 180, 120, 180-arcLenth, arcRadio);
//    CGContextAddArcToPoint(ctx, 120, 120, 180, 120, arcRadio);
//    CGContextFillPath(ctx);
//    CGContextClosePath(ctx);
    

    CGContextAddArc(ctx, 150, 40, 30, 0, 2*M_PI, 0);
    CGContextFillPath(ctx);
    CGContextAddArc(ctx, 210, 40, 30, 0, 2*M_PI, 0);
    CGContextFillPath(ctx);
    CGContextAddArc(ctx, 210, 100, 30, 0, 2*M_PI, 0);
    CGContextFillPath(ctx);
    CGContextAddArc(ctx, 150, 100, 30, 0, 2*M_PI, 0);
    CGContextAddRect(ctx, CGRectMake(150, 40, 60, 60));
    CGContextFillPath(ctx);
  

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
