//
//  UIColor+YZColor.h
//  ChiCo
//
//  Created by ChiCo on 2017/6/19.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YZColor)

/**
 * hexString:  000000 - FFFFFF
 * alpha: 1.0
 */
+ (instancetype)colorWithHexString:(NSString *)hexString;

/**
 * hexString:  000000 - FFFFFF
 * alpha: 0.0 -- 1.0
 */
+ (instancetype)colorWithHexString:(NSString *)hexString
                             alpha:(CGFloat)alpha;

@end
