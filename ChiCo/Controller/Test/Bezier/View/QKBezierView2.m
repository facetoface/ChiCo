//
//  QKBezierView2.m
//  ChiCo
//
//  Created by ChiCo on 2017/6/22.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "QKBezierView2.h"

@implementation QKBezierView2

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGSize size = frame.size;
        CGSize bodySize = CGSizeMake(size.width-60, size.height-60);
        CGRect bodyR;
        bodyR.origin = CGPointMake(30, 30);
        bodyR.size = bodySize;
        UIView *bodyView = [[UIView alloc] init];
        [self addSubview:bodyView];
        [bodyView setFrame:bodyR];
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(-0, -15)];
        [path addCurveToPoint:CGPointMake(-20, bodySize.height+10)
                controlPoint1:CGPointMake(-5, bodySize.height/3)
                controlPoint2:CGPointMake(0, 2*bodySize.height/3)];
        
        
        [path addLineToPoint:CGPointMake(bodySize.width, bodySize.height)];
        [path addLineToPoint:CGPointMake(bodySize.width, 0)];
        [path addLineToPoint:CGPointMake(0, 0)];
        [path closePath];
        bodyView.layer.shadowPath =  path.CGPath;;
        
        
        [bodyView setBackgroundColor:[UIColor cyanColor]];
        bodyView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        bodyView.layer.shadowRadius = 1;
        bodyView.layer.shadowOffset = CGSizeMake(0,0);
        bodyView.layer.shadowOpacity = 0.8;
    }
    return self;
}

@end
