//
//  QKTableBar.m
//  EasyIOS
//
//  Created by ChiCo on 16/9/8.
//  Copyright © 2016年 EasyIOS. All rights reserved.
//

#import "QKTableBar.h"
#import "UIButton+AFNetworking.h"

@interface QKTableBar ()

/**
 * pao pao
 */
@property (nonatomic,strong)UIButton *paoPao;

/**
 * 新文章的数量
 */
@property (nonatomic,strong)UILabel *articleNumberLabel;

/**
 * 大礼包
 */
@property (nonatomic,strong)UIView *redRound;

@end

@implementation QKTableBar

- (instancetype)initWithPaoPao:(BOOL)havePaoPao
{
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
    if (self)
    {
        [self setUpPaoPao:havePaoPao];
        [self setUpRound];
        [self addListener];
    }
    return self;
}

- (void)setUpPaoPao:(BOOL)havePaoPao
{
    self.paoPao = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.paoPao addTarget:self
                    action:@selector(paopaoAction)
          forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.paoPao];
    //  CGFloat btnW = SCREEN_WIDTH/5;
    [self.paoPao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(49, 49));
    }];
    [self.paoPao setImage:[UIImage imageNamed:@"post_normal"]
                 forState:UIControlStateNormal];
    [self.paoPao setHidden:YES];
    self.havePaoPao = havePaoPao;
    self.paoPao.userInteractionEnabled = NO;
      [self.paoPao.imageView setContentMode:UIViewContentModeScaleAspectFit];
}

#pragma mark - 更新图标
- (void)setUpRound
{
    self.articleNumberLabel = [[UILabel alloc] init];
    [self.articleNumberLabel setBackgroundColor:[UIColor qk_orangeRedColor]];
    [self.articleNumberLabel setTextColor:[UIColor whiteColor]];
    [self.articleNumberLabel setTextAlignment:NSTextAlignmentCenter];
    [self.articleNumberLabel setFont:[UIFont systemFontOfSize:10]];
    [self.articleNumberLabel setHidden:YES];
    self.articleNumberLabel.layer.cornerRadius = 8;
    [self.articleNumberLabel setClipsToBounds:YES];
    [self addSubview:self.articleNumberLabel];
    
    self.redRound = [[UIView alloc] init];
    [self.redRound setBackgroundColor:[UIColor redColor]];
    self.redRound.layer.cornerRadius = 4;
    [self.redRound setClipsToBounds:YES];
    [self.redRound setHidden:YES];
    [self addSubview:self.redRound];
}

#pragma mark - pao pao
- (void)paopaoAction
{
    if (self.clickCenterBar)
    {
        self.clickCenterBar();
    }
}
- (void)setPaopaoArr:(NSArray *)paopaoArr
{
    _paopaoArr = paopaoArr;
    self.havePaoPao = (_paopaoArr &&
                       [_paopaoArr count] > 0);
    if (self.havePaoPao)
    {
        NSDictionary *dict = [self.paopaoArr firstObject];
        [self.paoPao setImage:[UIImage imageNamed:@"post_normal"]
                     forState:UIControlStateNormal];
    }
}

- (void)setHavePaoPao:(BOOL)havePaoPao
{
    if (havePaoPao != _havePaoPao)
    {
        if (havePaoPao)
        {
            _havePaoPao = havePaoPao;
            [self.paoPao setHidden:NO];
            [self.paoPao setUserInteractionEnabled:YES];
            [self setFrame:CGRectMake(0, SCREEN_HEIGHT-49, SCREEN_WIDTH,(CGFloat)49.1)];
            
            
        }
        else
        {
            //隐藏
            _havePaoPao = havePaoPao;
            [self.paoPao setHidden:YES];
            [self.paoPao setUserInteractionEnabled:NO];
            [self setFrame:CGRectMake(0, SCREEN_HEIGHT-49, SCREEN_WIDTH,49)];
            
        }
    }
}

#pragma mark - subViews frame
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat width;
    NSUInteger btnCount;
    if (self.havePaoPao)
    {
        width = SCREEN_WIDTH / 5;
        btnCount = 5;
        Class class = NSClassFromString(@"UITabBarButton");
        int btnIndex = 0;
        
        for (UIView *btn in self.subviews) {//遍历tabbar的子控件
            if ([btn isKindOfClass:class]) {//如果是系统的UITabBarButton，那么就调整子控件位置，空出中间位置
                //每一个按钮的宽度==tabbar的五分之一
                CGRect frame = btn.frame;
                CGSize size = frame.size;
                CGPoint point = frame.origin;
                size.width = width;
                point.x = size.width * btnIndex;
                frame.origin = point;
                frame.size =  size;
                [btn setFrame:frame];
                
                btnIndex++;
                //如果是索引是2(从0开始的)，直接让索引++，目的就是让消息按钮的位置向右移动，空出来发布按钮的位置
                if (btnIndex == 2)
                {
                    btnIndex++;
                    
                }
                
            }
            
            
        }
        
        
        [self bringSubviewToFront:self.paoPao];
        
    }else
    {
        width = SCREEN_WIDTH / 4;
        btnCount = 4;
    }
    
    CGFloat articleLeft = width+(width+16)/2;
    [self.articleNumberLabel setFrame:CGRectMake(articleLeft, 1, 16, 16)];
    
    CGFloat redLeft = width*(btnCount-1) + (width+8)/2;
    [self.redRound setFrame:CGRectMake(redLeft, 1, 8, 8)];
    
}

#pragma mark - listener
- (void)addListener
{
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(showArticleNumber:)
//                                                 name:KPushNewRecommend
//                                               object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(showBigGift)
//                                                 name:KSHOWBIGGIFTNOTIFICATION object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(hidenBigGift)
//                                                 name:KHIDENBIGGIFTNOTIFICATION
//                                               object:nil];
}

- (void)showBigGift
{
    [self.redRound setHidden:NO];
}
- (void)hidenBigGift
{
    [self.redRound setHidden:YES];
}
- (void)showArticleNumber:(NSNotification *)noti
{
    NSString *number = noti.object;
    if ([@"0" isEqualToString:number] )
    {
        [self.articleNumberLabel setHidden:YES];
    }
    else
    {
        if ([number integerValue] > 99)
        {
            [self.articleNumberLabel setText:[NSString stringWithFormat:@"99"]];
            
        }else
        {
            [self.articleNumberLabel setText:number];
        }
        
        [self.articleNumberLabel setHidden:NO];
        
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
