//
//
//
//  Created by QK
//  Copyright (c) 2014 QK. All rights reserved.
//

#import "UIColor+QKColor.h"

@implementation UIColor (QKColor)


#pragma mark - 文本常用颜色
+ (instancetype)qk_blackColor
{
    return [UIColor colorWithHexString:@"#333333"];
}

+ (instancetype)qk_darkGrayColor
{
    return [UIColor colorWithHexString:@"#666666"];
}

+ (instancetype)qk_lightGrayColor
{
    return [UIColor colorWithHexString:@"#999999"];
}

+ (instancetype)qk_gray1{
    return [self qk_blackColor];
}
+ (instancetype)qk_gray2{
    return [self qk_darkGrayColor];
}
+ (instancetype)qk_gray3{
    return [self qk_lightGrayColor];
}

#pragma mark - 金额常用颜色
+ (instancetype)qk_orangeRedColor
{
    return [UIColor colorWithHexString:@"#ff6600"];
}


#pragma mark - 页面风格常用色【导航栏 底层视图】
/**
 *  淡粉红色
 *
 *  @return 色值 ＝ #f1e6e4
 */
+ (instancetype)qk_lightPinckColor
{
    return  [UIColor colorWithHexString:@"#f1e6e4"];
}
/**
 *  粉红色
 *
 *  @return 色值 ＝ #ff7f80
 */
+ (instancetype)qk_pinckColor
{
    return  [UIColor colorWithHexString:@"#ff7f80"];
}

#pragma mark - 分割线颜色
+ (instancetype)qk_borderGrayColor
{
    return [UIColor colorWithHexString:@"#cccccc"];
}

+ (instancetype)qk_divideLineGrayColor
{
    return [UIColor colorWithHexString:@"#e9e9e9"];
}
#pragma mark - table 颜色
/**
 *  table 底层颜色
 *
 *  @return 色值 = f2f2f2
 */
+ (instancetype)qk_lightTableBackGrayColor
{
    
    return [UIColor colorWithHexString:@"#f2f2f2"];
}
#pragma mark  - 其他十六进制颜色
/**
 * hexString eg. #ff0000
 */
+ (instancetype)colorWithHexString:(NSString *)hexString
{
    return [UIColor colorWithHexString:hexString alpha:1.0];
}

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
#pragma mark -
+ (instancetype)qk_orangeColor
{
    return [UIColor colorWithHexString:@"#ff9933"];
}

+ (instancetype)qk_lightBlueColor
{
    return [UIColor colorWithHexString:@"#5BB7DE"];
}

+ (instancetype)qk_darkBlueColor
{
    return [UIColor colorWithHexString:@"0080b1"];
}






+ (CGColorRef)createRGBValue:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue
                       alpha:(CGFloat)alpha
{
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[4] = {red, green, blue, alpha};
    CGColorRef color = CGColorCreate(colorspace, components);
    CGColorSpaceRelease(colorspace);
    return color;
}

+ (instancetype)colorFromRGB:(NSInteger)rgbValue
                   withAlpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) /(float) 255.0
                           green:((float)((rgbValue & 0xFF00) >> 8)) /(float) 255.0
                            blue:((float)(rgbValue & 0xFF)) /(float) 255.0 alpha:alpha];
    
}

+ (instancetype)colorFromRGB:(NSInteger)rgbValue
{
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) /(float) 255.0
                           green:((float)((rgbValue & 0xFF00) >> 8)) /(float)255.0
                            blue:((float)(rgbValue & 0xFF)) /(float)255.0 alpha:1.0];
    
}


/**
 * hexString eg. #ffffffff
 */
+ (instancetype)colorWithHexStringWithAlpha:(NSString*)hexString
{
    if ([hexString hasPrefix:@"0x"] || [hexString hasPrefix:@"0X"])
    {
        hexString = [hexString substringFromIndex:2];
    } else if ([hexString hasPrefix:@"#"]) {
        hexString = [hexString substringFromIndex:1];
    }
    
    unsigned int value = 0;
    BOOL flag = [[NSScanner scannerWithString:hexString] scanHexInt:&value];
    if(NO == flag)
        return [UIColor clearColor];
    float r, g, b, a;
    a = (value & 0x000000FF) / (float)255.0;
    value = value >> 8;
    b = value & 0x000000FF;
    value = value >> 8;
    g = value & 0x000000FF;
    value = value >> 8;
    r = value;
    
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a];
}



@end
