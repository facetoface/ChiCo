//
//  QKSwitchParamTopBar.h
//  ChiCo
//
//  Created by 一米阳光 on 2017/5/30.
//  Copyright © 2017年 一米阳光. All rights reserved.
//


#import "QKSwitchParamTopBar.h"

@interface QKSwitchParamTopBar ()

@property (nonatomic,strong)UIButton *chosedButton;
@property (nonatomic,assign)CGFloat btnW;
@property (nonatomic,strong)NSArray <NSDictionary *>*sortItems;
@property (nonatomic,strong)UIView *redLine;
@property (nonatomic,strong)UIScrollView *scrollView;
@end

@implementation QKSwitchParamTopBar

- (instancetype)initWithFrame:(CGRect)frame
                    sortItems:(NSArray <NSDictionary *>*)sortItems
                  chosedIndex:(NSUInteger)chosedIndex
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat row = SCREEN_WIDTH/83.0;
        if (row - (int)row >= 0.5) {
            row = (int)row + 0.5;
        } else {
            row = (int)row - 0.5;
        }
        CGFloat btnW = SCREEN_WIDTH/row;
        self.btnW = btnW;
        
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        [scrollView setShowsHorizontalScrollIndicator:NO];
        [self addSubview:scrollView];
        
        self.sortItems = sortItems;
        NSUInteger count = [sortItems count];
        for (NSUInteger index = 0; index < count; index++) {
            NSString *title = [sortItems[index] objectForKey:@"cate_name"];
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
            [button setFrame:CGRectMake(index*btnW, 0, btnW, 40)];
            [button setTitleColor:[UIColor qk_blackColor] forState:UIControlStateNormal];
            [button setTitle:title forState:UIControlStateNormal];
            button.tag = 1000 + (NSInteger)index;
            [button addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            [scrollView addSubview:button];
           
            
        }
        
        [scrollView setContentSize:CGSizeMake(btnW*count, 0)];
        self.scrollView = scrollView;
        
        NSUInteger tag = 1000 + chosedIndex;
        UIButton *firstBtn = [scrollView viewWithTag:(NSInteger)tag];
        [firstBtn setTitleColor:[UIColor qk_orangeRedColor] forState:UIControlStateNormal];
        self.chosedButton = firstBtn;
        
       
        
        UIView *line = [[UIView alloc] init];
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(ONEPIX);
            
        }];
        [line setBackgroundColor:[UIColor colorWithHexString:@"#e5e5e5"]];
        
        self.redLine = ({
            CGFloat lineX = firstBtn.frame.origin.x + (self.btnW-43)/2;
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(lineX, 38, 43, 2)];
            [scrollView addSubview:view];
            [view setBackgroundColor:[UIColor qk_orangeRedColor]];
            CGFloat start = firstBtn.frame.origin.x + firstBtn.frame.size.width - SCREEN_WIDTH;
            if (start > 0) {
                 [scrollView setContentOffset:CGPointMake(start, 0)];
            }
            
            view;
        });
        
    }
    return self;
}

- (void)clickItem:(UIButton *)button
{
    if (button == self.chosedButton) {
        return;
    }
    
    
    [self.chosedButton setTitleColor:[UIColor qk_blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor qk_orangeRedColor] forState:UIControlStateNormal];
    self.chosedButton = button;
    
   
    NSUInteger index = (NSUInteger)(button.tag - 1000);
    CGFloat lineX = index * self.btnW + (self.btnW-43)/2;
    
    CGFloat start = button.frame.origin.x + button.frame.size.width - SCREEN_WIDTH;
    if (start > 0) {
        [self.scrollView setContentOffset:CGPointMake(start, 0)];
    }
    CGFloat leftX = button.frame.origin.x - self.scrollView.contentOffset.x;
    if (leftX < 0) {
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x-leftX-self.btnW, 0)];
    }
    
    [self.redLine  setFrame:CGRectMake(lineX, 38, 43, 2)];
    
    if (self.itemAction) {
        self.itemAction(self.sortItems[index]);
    }
    
}


@end


