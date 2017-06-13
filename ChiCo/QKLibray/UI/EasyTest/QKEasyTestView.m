//
//  QKEasyTestView.m
//  ChiCo
//
//  Created by ChiCo on 2017/6/13.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "QKEasyTestView.h"

@interface QKEasyTestView ()

@property (nonatomic,weak)UIScrollView *scrollView;
@property (nonatomic,strong)NSArray <NSString *>*dataSouce;

@end

@implementation QKEasyTestView

- (instancetype)initWithFrame:(CGRect)frame
                   titleArray:(NSArray <NSString *>*)titleArray
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataSouce = titleArray;
        frame.origin = CGPointZero;
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
        [self addSubview:scrollView];
        self.scrollView = scrollView;
        [self setSubViews:self.scrollView];
    }
    return self;
}

- (void)setSubViews:(UIView *)bodyView
{
    CGFloat originY = 20;
    CGFloat leftSpace = 10;
    NSUInteger count = [self.dataSouce count];
    CGFloat btnH = 30;
    CGFloat btnW = 90;
    NSUInteger rowCount = (SCREEN_WIDTH-20)/btnW;
    CGFloat ltSpace = (SCREEN_WIDTH-btnW*rowCount-20)/(rowCount-1);
    
    for (NSUInteger index = 0; index < count; index ++)
    {
        NSString *title = [self.dataSouce objectAtIndex:index];
        NSUInteger row = index/rowCount;
        NSUInteger list = index%rowCount;
        CGFloat btnX = leftSpace + list*(btnW+ltSpace);
        CGFloat btnY = originY + row * (btnH+10);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(btnX, btnY, btnW, btnH)];
        button.tag = (NSInteger)(2000+index);
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor qk_lightBlueColor] forState:UIControlStateNormal];
        button.layer.borderWidth = 1;
        button.layer.borderColor = [[UIColor qk_lightBlueColor] CGColor];
        [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [button.titleLabel setLineBreakMode:NSLineBreakByTruncatingTail];
        [button addTarget:self
                   action:@selector(buttonClick:)
         forControlEvents:UIControlEventTouchUpInside];
        [bodyView addSubview:button];
        
    }
}

- (void)buttonClick:(NSString *)button
{
    
}

@end
