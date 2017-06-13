//
//  QKStringScanner.m
//  ChiCo
//
//  Created by ChiCo on 2017/6/13.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "QKStringScanner.h"

@implementation QKStringScanner

/**
 * 字符串是不是纯数字
 */
+ (BOOL)isPureInt:(NSString *)string
{
    NSScanner *scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

/**
 *  检查是不是中文字符串
 *
 *  @param chineseStr 待检测的字符串
 *
 *  @return YES:全部为中文字符串
 */
+ (BOOL)isValidChinese:(NSString *)chineseStr
{
    NSString *str = @"^[\u4e00-\u9fa5]{1,}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",str];
    
    return [predicate evaluateWithObject:chineseStr];
}

@end

