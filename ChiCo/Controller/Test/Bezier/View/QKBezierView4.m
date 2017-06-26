//
//  QKBezierView4.m
//  ChiCo
//
//  Created by ChiCo on 2017/6/23.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "QKBezierView4.h"

@implementation QKBezierView4

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      
        CGPoint startP = CGPointMake(20, 30);
        CGSize  bodyS = CGSizeMake(frame.size.width-40, frame.size.height-60);
        CGRect bodyR;
        bodyR.origin = startP;
        bodyR.size = bodyS;
        
        UIView *bodyView = [[UIView alloc] initWithFrame:bodyR];
        [self addSubview:bodyView];
        [bodyView setBackgroundColor:[UIColor lightTextColor]];
        
        bodyR.origin.x = 5;
        bodyR.origin.y =  5;
        bodyR.size.width = bodyR.size.width - 10;
        bodyR.size.height = bodyR.size.height - 10;
        UIView *contentView = [[UIView alloc] initWithFrame:bodyR];
        [contentView setBackgroundColor:[UIColor whiteColor]];
        [bodyView addSubview:contentView];
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(-10, 0)];
        [path addQuadCurveToPoint:CGPointMake(20, bodyS.height/2)
                     controlPoint:CGPointMake(10, bodyS.height/5)];
          [path addLineToPoint:CGPointMake(-2, bodyS.height/2)];
        [path addQuadCurveToPoint:CGPointMake(0, bodyS.height)
                     controlPoint:CGPointMake(10, bodyS.height/3)];
        [path addLineToPoint:CGPointMake(-2, bodyS.height)];
        [path addLineToPoint:CGPointMake(bodyS.width, bodyS.height)];
        [path addLineToPoint:CGPointMake(bodyS.width, 0)];
        [path addLineToPoint:CGPointMake(0, 0)];
        
        
        bodyView.layer.shadowPath = [path CGPath];
        bodyView.layer.shadowColor = [UIColor blackColor].CGColor;
        bodyView.layer.shadowRadius = 3;
        bodyView.layer.shadowOffset = CGSizeMake(-10,0);
        bodyView.layer.shadowOpacity = 0.5;
      
    }
    return self;
}



@end
