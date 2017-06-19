//
//  UIColor+YZColor.m
//  ChiCo
//
//  Created by ChiCo on 2017/6/19.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "UIColor+YZColor.h"

@implementation UIColor (YZColor)

/**
 * hexString:  000000 - FFFFFF
 * alpha: 0.0 -- 1.0
 */
+ (instancetype)colorWithHexString:(NSString *)hexString
                             alpha:(CGFloat)alpha
{
    if ([hexString hasPrefix:@"0x"] || [hexString hasPrefix:@"0X"]) {
        hexString = [hexString substringFromIndex:2];
    } else if ([hexString hasPrefix:@"#"]) {
        hexString = [hexString substringFromIndex:1];
    }
    
    unsigned int value = 0;
    BOOL flag = [[NSScanner scannerWithString:hexString] scanHexInt:&value];
    if(NO == flag)
        return [UIColor clearColor];
    CGFloat r, g, b, a;
    a = alpha;
    b = value & 0x0000FF;
    value = value >> 8;
    g = value & 0x0000FF;
    value = value >> 8;
    r = value;
    
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a];
}

/**
 * hexString:  000000 - FFFFFF
 * alpha: 1.0
 */
+ (instancetype)colorWithHexString:(NSString *)hexString
{
    return [UIColor colorWithHexString:hexString alpha:1.0];
}

@end
