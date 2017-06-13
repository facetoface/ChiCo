//
//  QKEasyTestView.h
//  ChiCo
//
//  Created by ChiCo on 2017/6/13.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  QKEasyTestViewDelegate <NSObject>

- (void)clickEasyTestView:(NSUInteger)index
                    title:(NSString *)title;

@end

@interface QKEasyTestView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                     topSpace:(CGFloat)topSpace
                      lrSpace:(CGFloat)lrSpace
                   titleArray:(NSArray <NSString *>*)titleArray;

@property (nonatomic,assign) id <QKEasyTestViewDelegate> delegate;

@end
