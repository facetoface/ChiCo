//
//  QKHomeNavBar.m
//  EasyIOS
//
//  Created by ChiCo on 16/9/13.
//  Copyright © 2016年 EasyIOS. All rights reserved.
//

#import "QKHomeNavBar.h"

@interface QKHomeNavBar ()

@property (nonatomic,strong)UIButton *leftButton;


@end

@implementation QKHomeNavBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setBackgroundColor:[UIColor orangeColor]];
        [self setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        
        UIView *body = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 44)];
        [self addSubview:body];
        
        self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [body addSubview:self.leftButton];
        [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.left.mas_equalTo(0);
            make.width.mas_equalTo(120);
        }];
        [self.leftButton addTarget:self
                            action:@selector(cityAction)
                  forControlEvents:UIControlEventTouchUpInside];
        
        
        UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [body addSubview:searchBtn];
        [searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.width.mas_equalTo(120);
            
        }];
        [searchBtn setTitle:@"客服" forState:UIControlStateNormal];
        [searchBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        
        
        UITextField *textField = [[UITextField alloc] init];
        textField.layer.cornerRadius = 2;
        textField.clipsToBounds = YES;
        [body addSubview:textField];
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-240, 30));
            make.center.mas_equalTo(0);
        }];
        textField.placeholder = @"搜索酒店，演出名称等";
        textField.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
        [imageView setImage:[UIImage imageNamed:@"首页-搜索按钮"]];
        textField.leftView = imageView;
        textField.leftViewMode = UITextFieldViewModeAlways;
        
    }
    return self;
}

- (void)cityAction
{
    
}


@end
