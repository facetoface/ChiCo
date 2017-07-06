//
//  QKBezierView7.m
//  ChiCo
//
//  Created by ChiCo on 2017/7/4.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "QKBezierView7.h"



@implementation QKBezierView7

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor whiteColor]];
        
        UIView *bodyView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH-40, SCREEN_HEIGHT-120)];
        [bodyView setBackgroundColor:[UIColor lightGrayColor]];
        [self addSubview:bodyView];
     
    }
    return self;
}

@end
