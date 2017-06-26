//
//  QKBezierView5.m
//  ChiCo
//
//  Created by ChiCo on 2017/6/26.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "QKBezierView5.h"

@implementation QKBezierView5

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor lightGrayColor]];
        [self setClipsToBounds:YES];
        
        CALayer *layer1 = [CALayer layer];
        [layer1 setFrame:CGRectMake(10, 10, 50, 50)];
        layer1.cornerRadius = 5;
        [layer1 setBackgroundColor:[UIColor cyanColor].CGColor];
        [self.layer addSublayer:layer1];
        
        CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
        [emitterLayer setFrame:CGRectMake(70, 10, 150, 150)];
        [emitterLayer setBackgroundColor:[UIColor lightTextColor].CGColor];
        [self.layer addSublayer:emitterLayer];
        emitterLayer.emitterShape = kCAEmitterLayerPoint;
        emitterLayer.position = CGPointMake(200, 200);
        CAEmitterCell *cell = [CAEmitterCell emitterCell];
        [cell setBirthRate:30];
        cell.emissionLatitude = M_PI_2 + M_PI;
        cell.emissionRange = M_PI_2;

        cell.contents = CFBridgingRelease([UIImage imageNamed:@"fish_highlight"].CGImage);
        cell.lifetime = 4;
        cell.velocity = 100;
        cell.velocityRange = 80;
        cell.scale = 0.2;
        cell.velocityRange = M_PI_2;
       
    
        
        emitterLayer.emitterCells = @[cell];
        
        
    }
    return self;
}

@end
