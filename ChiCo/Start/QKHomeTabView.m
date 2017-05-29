//
//  QKHomeTabView.m
//  EasyIOS
//
//  Created by ChiCo on 16/9/13.
//  Copyright © 2016年 EasyIOS. All rights reserved.
//

#import "QKHomeTabView.h"

@interface QKHomeTabView()

@property (nonatomic,strong)NSArray <UIButton *>*tapArr;
@property (nonatomic,assign)NSUInteger chosedTap;
@property (nonatomic,strong)UIView *line;

@end

@implementation QKHomeTabView
+ (QKHomeTabView *)tab:(NSArray <NSString *>*)tabs
{
    QKHomeTabView *tab = [[QKHomeTabView alloc] initWithTab:tabs];
    
    return tab;
}

- (instancetype)initWithTab:(NSArray <NSString *>*)tabs
{
    self = [super init];
    if (self) {
        
        NSUInteger count = [tabs count];
        CGFloat width = SCREEN_WIDTH/count;
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:count];
        for (NSUInteger index = 0; index < count; index++)
        {
            NSString *title = tabs[index];
            UIButton *tapItem = [UIButton buttonWithType:UIButtonTypeCustom];
            [tapItem setTitle:title forState:UIControlStateNormal];
            [tapItem setTitleColor:[UIColor qk_blackColor]
                          forState:UIControlStateNormal];
            [tapItem setTitleColor:[UIColor qk_orangeRedColor]
                          forState:UIControlStateSelected];
            [tapItem.titleLabel setFont:[UIFont systemFontOfSize:15]];
            [self addSubview:tapItem];
            [arr addObject:tapItem];
            [tapItem mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(width*index);
                make.top.centerY.mas_equalTo(0);
                make.size.width.mas_equalTo(width);
            }];
            [tapItem addTarget:self
                        action:@selector(tapAction:)
              forControlEvents:UIControlEventTouchUpInside];
            tapItem.tag = 1000 + index;
        }
        
        self.tapArr = [NSArray arrayWithArray:arr];
        UIButton *firstItem = [self.tapArr firstObject];
        self.line = [[UIView alloc] init];
        [self addSubview:self.line];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(firstItem.mas_centerX);
            make.bottom.mas_equalTo(-1);
            make.size.mas_equalTo(CGSizeMake(50, 1));
            
        }];
        [self.line setBackgroundColor:[UIColor qk_orangeRedColor]];
        
        UIView *line = [[UIView alloc] init];
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(ONEPIX);
            
        }];
        [line setBackgroundColor:[UIColor qk_divideLineGrayColor]];
    }
    return self;
}

- (void)tapAction:(UIButton *)btn
{
    
}
@end
