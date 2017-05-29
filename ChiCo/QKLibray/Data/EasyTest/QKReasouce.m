//
//  QKReasouce.m
//  EasyIOS
//
//  Created by EasyIOS on 16/5/17.
//  Copyright © 2016年 EasyIOS. All rights reserved.
//

#import "QKReasouce.h"

/**
 *  获取项目中的资源
 */
@implementation QKReasouce

/**
 *  获取测试的json文件
 *
 *  @param jsonName 文件名
 *
 *  @return json
 */
+ (id)projectJson:(NSString *)jsonName
{
    
    NSError *error = nil;
   
    NSString *Json_path = [[NSBundle mainBundle] pathForResource:jsonName
                                    ofType:@"json"];
   
 
    NSData *data=[NSData dataWithContentsOfFile:Json_path];
   
    
    id jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                  options:NSJSONReadingAllowFragments
                                                    error:&error];
    
    return jsonObject;
}


@end
