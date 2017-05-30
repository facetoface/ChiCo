//
//  QKSwitchParamTopBar.h
//  ChiCo
//
//  Created by 一米阳光 on 2017/5/30.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * 文章筛选列表头部筛选栏
 */
@interface QKSwitchParamTopBar : UIView

- (instancetype)initWithFrame:(CGRect)frame
                    sortItems:(NSArray <NSDictionary *>*)sortItems
                  chosedIndex:(NSUInteger)chosedIndex;

@property (nonatomic,copy)void (^itemAction)(NSDictionary *item);

@end
