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


/**********************************************
 绘画步骤
 1.设置线宽 线颜色 填充色
 2.设置路径
 3.画到画板上，结束本次设置。
 4.CGContextFillPath和GContextStrokePath属于结束语句
 **********************************************/
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
    CGContextDrawPath(ctx, kCGPathEOFillStroke);
    /************************************
     画边框
     CGContextStrokePath(ctx);
     填充包裹区域
     CGContextFillPath(ctx);
     kCGPathEOFillStroke = CGContextStrokePath + CGContextFillPath
     但是 CGContextStrokePath 和 CGContextFillPath 不可以同时使用
     如果同时使用,写在前边的会生效
     ************************************/
    CGFloat arcLenth = 10;
    CGFloat arcRadio = 15;
    CGPoint startPoint = CGPointMake(250, 10);
    
    //从左上角开始
    CGContextMoveToPoint(ctx, startPoint.x+arcRadio, startPoint.y);
    CGFloat arcWH = 60;
    
    //画右上角的拐角
    CGContextAddArcToPoint(ctx, startPoint.x+arcWH, startPoint.y, startPoint.x+arcWH, startPoint.y+arcLenth, arcRadio);
    CGContextAddArcToPoint(ctx, startPoint.x+arcWH, 70, startPoint.x+arcWH-arcLenth, 70, arcRadio);
    CGContextAddArcToPoint(ctx, startPoint.x, 70, startPoint.x, 70-arcLenth, arcRadio);
    CGContextAddArcToPoint(ctx, startPoint.x, 10, startPoint.x+arcLenth, 10, arcRadio);
    CGContextFillPath(ctx);
    CGContextClosePath(ctx);
    

    //画个4叶草
    CGContextAddArc(ctx, 150, 40, 30, 0, 2*M_PI, 0);
    CGContextFillPath(ctx);
    CGContextAddArc(ctx, 210, 40, 30, 0, 2*M_PI, 0);
    CGContextFillPath(ctx);
    CGContextAddArc(ctx, 210, 100, 30, 0, 2*M_PI, 0);
    CGContextFillPath(ctx);
    CGContextAddArc(ctx, 150, 100, 30, 0, 2*M_PI, 0);
    CGContextAddRect(ctx, CGRectMake(150, 40, 60, 60));
    CGContextFillPath(ctx);
    
    //CGContextAddArcToPoint 研究
    CGContextAddRect(ctx, CGRectMake(10, 150, 80, 80));
    CGContextStrokePath(ctx);
    CGContextAddArc(ctx, 50, 190, 40, 0, 2*M_PI, 40);
    CGContextStrokePath(ctx);
    //画1个圆角
    CGContextAddRect(ctx, CGRectMake(100, 150, 80, 80));
    CGContextMoveToPoint(ctx, 100, 150);
    CGContextAddArcToPoint(ctx, 180, 150, 180, 160, 40);
    CGContextStrokePath(ctx);
    //画2个圆角
    CGContextAddRect(ctx, CGRectMake(190, 150, 80, 80));
    CGContextMoveToPoint(ctx, 190, 150);
    CGContextAddArcToPoint(ctx, 270, 150, 270, 160, 40);
    CGContextAddArcToPoint(ctx, 270, 230, 260, 230, 40);
    CGContextStrokePath(ctx);
    //画3个圆角
    CGContextAddRect(ctx, CGRectMake(280, 150, 80, 80));
    CGContextMoveToPoint(ctx, 280, 150);
    CGContextAddArcToPoint(ctx, 360, 150, 360, 160, 40);
    CGContextAddArcToPoint(ctx, 360, 230, 350, 230, 40);
    CGContextAddArcToPoint(ctx, 280, 230, 280, 210, 40);
    CGContextStrokePath(ctx);
    
    //画4个圆角
    CGContextAddRect(ctx, CGRectMake(10, 240, 80, 80));
    CGContextMoveToPoint(ctx, 10+40, 240);
    CGContextAddArcToPoint(ctx, 90, 240, 90, 250, 40);
    CGContextAddArcToPoint(ctx, 90, 320, 80, 320, 40);
    CGContextAddArcToPoint(ctx, 10, 320, 10, 310, 40);
    CGContextAddArcToPoint(ctx, 10, 240, 20, 240, 40);
    CGContextStrokePath(ctx);
    
    /**************************************************
     CGContextAddArcToPoint
     1.当前点、第一点、第二点如果可以组成一个角
     2.以radius为半径画圆,圆和两边相切，两个切点之间的弧为所得
    **************************************************/
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


@end
