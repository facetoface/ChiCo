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
    
    NSUInteger index = 1;
    BOOL jump = YES;
    do {
        rect.origin.x = SCREEN_WIDTH * (index-1);
        NSString *className = [NSString stringWithFormat:@"QKBezierView%d",(int)index];
        Class viewClass = NSClassFromString(className);
        if (viewClass) {
            UIView *view = ((UIView *(*)(id, SEL, CGRect))objc_msgSend)([viewClass alloc], @selector(initWithFrame:), rect);
            [scrollView addSubview:view];
             index ++;
        } else {
            
            jump = NO;
        }
       
    } while (jump);
    


    [scrollView setContentSize:CGSizeMake(SCREEN_WIDTH*(index-1), SCREEN_HEIGHT-64)];
    [scrollView  setContentOffset:CGPointMake(SCREEN_WIDTH*(index-2), 0)];
    [scrollView setPagingEnabled:YES];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
