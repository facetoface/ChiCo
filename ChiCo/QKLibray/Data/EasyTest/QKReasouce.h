//
//  QKReasouce.h
//  EasyIOS
//
//  Created by EasyIOS on 16/5/17.
//  Copyright © 2016年 EasyIOS. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  获取项目中的资源
 */
@interface QKReasouce : NSObject

/**
 *  获取测试的json文件
 *
 *  @param jsonName 文件名
 *
 *  @return json
 */
+ (id )projectJson:(NSString *)jsonName;

@end
