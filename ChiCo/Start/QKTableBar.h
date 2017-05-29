//
//  QKTableBar.h
//  EasyIOS
//
//  Created by ChiCo on 16/9/8.
//  Copyright © 2016年 EasyIOS. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  有时候会显示5个 有时候只有4个
 */
@interface QKTableBar : UITabBar

/**
 * 中间是否有飘着的按钮
 */
- (instancetype)initWithPaoPao:(BOOL)havePaoPao;

@property (nonatomic,assign)BOOL havePaoPao;

@property (nonatomic,strong)NSArray *paopaoArr;

@property (nonatomic,copy)void (^clickCenterBar)();

@end

