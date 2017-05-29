//
//  QKHomeModel.h
//  EasyIOS
//
//  Created by EasyIOS on 16/5/19.
//  Copyright © 2016年 EasyIOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QKHomeModel : NSObject 

@property (nonatomic,copy)NSString *identifer;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,strong)NSDictionary *pushParam;
@property (nonatomic,copy)NSString *pushType;


@end
