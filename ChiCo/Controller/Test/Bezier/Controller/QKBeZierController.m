//
//  QKBeZierController.m
//  ChiCo
//
//  Created by ChiCo on 2017/6/22.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "QKBeZierController.h"
#import "QKBezierView1.h"


@interface QKBeZierController ()
@property (nonatomic,weak)UIScrollView *bodyView;
@end

@implementation QKBeZierController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"贝赛尔曲线"];
    
    CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64);
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:rect];
    [self.view addSubview:scrollView];
    self.bodyView = scrollView;
    
    QKBezierView1 *view1 = [[QKBezierView1 alloc] initWithFrame:rect];
    [scrollView addSubview:view1];
    
    [scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    [scrollView setPagingEnabled:YES];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
