//
//  QKBeZierController.m
//  ChiCo
//
//  Created by ChiCo on 2017/6/22.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "QKBeZierController.h"
#import "QKBezierView1.h"
#import "QKBezierView2.h"
#import <objc/message.h>
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
    
    NSUInteger testCount = 2;
    for (NSUInteger index = 1; index <= testCount; index++) {
        rect.origin.x = SCREEN_WIDTH * (index-1);
        NSString *className = [NSString stringWithFormat:@"QKBezierView%d",(int)index];
        Class viewClass = NSClassFromString(className);
        UIView *view = ((UIView *(*)(id, SEL, CGRect))objc_msgSend)([viewClass alloc], @selector(initWithFrame:), rect);
        [scrollView addSubview:view];
    }

    [scrollView setContentSize:CGSizeMake(SCREEN_WIDTH*testCount, SCREEN_HEIGHT-64)];
    [scrollView setPagingEnabled:YES];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
