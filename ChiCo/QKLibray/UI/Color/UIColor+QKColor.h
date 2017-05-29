//
//
//
//  Created by QK
//  Copyright (c) 2014 QK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (QKColor)

#pragma mark - 文本常用颜色
/**
 *  黑色 【常用于字体】
 *
 *  @return 色值 ＝ #333333
 */
+ (instancetype)qk_blackColor;
/**
 *  深灰色 【常用于字体】
 *
 *  @return 色值 = #666666
 */
+ (instancetype)qk_darkGrayColor;
/**
 *  浅灰色
 *
 *  @return 色值 = #999999
 */
+ (instancetype)qk_lightGrayColor;


#pragma mark - 金额常用颜色
/**
 *  血红色
 *
 *  @return 色值 ＝ #ff6600
 */
+ (instancetype)qk_orangeRedColor;

+ (instancetype)qk_gray1;
+ (instancetype)qk_gray2;
+ (instancetype)qk_gray3;


#pragma mark - 分割线颜色
/**
 *  分割线颜色
 *
 *  @return 色值 = #cccccc
 */
+ (instancetype)qk_borderGrayColor;
/**
 *  分割线颜色
 *
 *  @return 色值 = #e9e9e9
 */
+ (instancetype)qk_divideLineGrayColor;

#pragma mark - table 颜色
/**
 *  table 底层颜色
 *
 *  @return 色值 = f2f2f2
 */
+ (instancetype)qk_lightTableBackGrayColor;

#pragma mark - 页面风格常用色【导航栏 底层视图】
/**
 *  粉红色
 *
 *  @return 色值 ＝ #ff7f80
 */
+ (instancetype)qk_pinckColor;
/**
 *  淡粉红色
 *
 *  @return 色值 ＝ #f1e6e4
 */
+ (instancetype)qk_lightPinckColor;


#pragma mark  - 其他十六进制颜色
/**
 *  16进制颜色
 *
 *  @param hexString 6位16进制数据
 *
 *  @return 颜色
 */
+ (instancetype)colorWithHexString:(NSString *)hexString;

/**
 *  带透明度的16进制颜色
 *
 *  @param hexString 6位16进制数据
 *  @param alpha     透明度
 *
 *  @return 颜色
 */
+ (instancetype)colorWithHexString:(NSString *)hexString
                             alpha:(CGFloat)alpha;


#pragma mark -
/**
 *  橙色
 *
 *  @return 色值 ＝ #ff9933
 */
+ (instancetype)qk_orangeColor;


/**
 *  淡蓝色
 *
 *  @return 色值 = #5BB7DE
 */
+ (instancetype)qk_lightBlueColor;
/**
 *  深蓝色
 *
 *  @return 色值 = #0080b1
 */
+ (instancetype)qk_darkBlueColor;



@end
