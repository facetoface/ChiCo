//
//  QKStringScanner.h
//  ChiCo
//
//  Created by ChiCo on 2017/6/13.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 字符串匹配
 */
@interface QKStringScanner : NSObject

/**
 * 字符串是不是纯数字
 */
+ (BOOL)isPureInt:(NSString *)string;

/**
 *  检查是不是中文字符串
 *
 *  @param chineseStr 待检测的字符串
 *
 *  @return YES:全部为中文字符串
 */
+ (BOOL)isValidChinese:(NSString *)chineseStr;

@end


