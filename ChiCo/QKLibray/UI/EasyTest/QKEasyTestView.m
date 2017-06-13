//
//  QKEasyTestView.m
//  ChiCo
//
//  Created by ChiCo on 2017/6/13.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "QKEasyTestView.h"

@interface QKEasyTestView ()

@property (nonatomic,assign)CGFloat lrSpace;
@property (nonatomic,assign)CGFloat topSpace;
@property (nonatomic,weak)UIScrollView *scrollView;
@property (nonatomic,strong)NSArray <NSString *>*dataSouce;

@end

@implementation QKEasyTestView

- (instancetype)initWithFrame:(CGRect)frame
                     topSpace:(CGFloat)topSpace
                      lrSpace:(CGFloat)lrSpace
                   titleArray:(NSArray <NSString *>*)titleArray
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataSouce = titleArray;
        frame.origin = CGPointZero;
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
        [self addSubview:scrollView];
        self.scrollView = scrollView;
        self.topSpace = topSpace;
        self.lrSpace = lrSpace;
        [self setSubViews:self.scrollView];
    }
    return self;
}

- (void)setSubViews:(UIScrollView *)bodyView
{
    CGFloat width = self.frame.size.width;
    CGFloat originY = self.topSpace;
    CGFloat leftSpace = self.lrSpace;
    NSUInteger count = [self.dataSouce count];
    CGFloat btnH = 30;
    CGFloat btnW = 90;
    NSUInteger rowCount = (width-self.lrSpace*2)/btnW;
    CGFloat ltSpace = (width-btnW*rowCount-self.lrSpace*2)/(rowCount-1);
    
    for (NSUInteger index = 0; index < count; index ++)
    {
        NSString *title = [self.dataSouce objectAtIndex:index];
        NSUInteger row = index/rowCount;
        NSUInteger list = index%rowCount;
        CGFloat btnX = leftSpace + list*(btnW+ltSpace);
        CGFloat btnY = originY + row * (btnH+self.lrSpace);
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
    
    CGFloat height = originY + btnH;
    [bodyView setContentSize:CGSizeMake(width, height)];

}

- (void)buttonClick:(UIButton *)button
{
    NSUInteger tag = (NSUInteger)button.tag - 2000;
    if ([self.delegate respondsToSelector:@selector(clickEasyTestView:title:)]) {
        [self.delegate clickEasyTestView:tag title:self.dataSouce[tag]];
    }
}

@end
