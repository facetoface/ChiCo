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
      
        CGPoint startP = CGPointMake(20, 10);
        CGSize  bodyS = CGSizeMake(frame.size.width-40, frame.size.height-60);
        CGRect bodyR;
        bodyR.origin = startP;
        bodyR.size = bodyS;
        
        UIView *bodyView = [[UIView alloc] initWithFrame:bodyR];
        [self addSubview:bodyView];
        [bodyView setBackgroundColor:[UIColor whiteColor]];
        
        bodyR.origin.x = bodyR.origin.x + 2;
        bodyR.origin.y = bodyR.origin.y + 2;
        bodyR.size.width = bodyR.size.width - 4;
        bodyR.size.height = bodyR.size.height - 4;
        UIView *contentView = [[UIView alloc] initWithFrame:bodyR];
        [contentView setBackgroundColor:[UIColor redColor]];
        [bodyView addSubview:contentView];
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, 0)];
        [path addQuadCurveToPoint:CGPointMake(0, bodyS.height)
                     controlPoint:CGPointMake(-5, bodyS.height/2)];
        [path addLineToPoint:CGPointMake(bodyS.width, bodyS.height)];
        [path addLineToPoint:CGPointMake(bodyS.width, 0)];
        [path addLineToPoint:CGPointMake(0, 0)];
        
        
        bodyView.layer.shadowPath = [path CGPath];
        bodyView.layer.shadowColor = [UIColor blackColor].CGColor;
        bodyView.layer.shadowRadius = 5;
        bodyView.layer.shadowOffset = CGSizeMake(0,0);
        bodyView.layer.shadowOpacity = 0.8;
      
    }
    return self;
}



@end
