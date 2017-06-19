//
//  YZStartController.m
//  ChiCo
//
//  Created by ChiCo on 2017/6/19.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "YZStartController.h"
#import "YZGuideController.h"
#import "YZMainController.h"

@interface YZStartController ()

@end

@implementation YZStartController

- (instancetype)init
{

    self = [super init];
    if (self) {
        
        YZMainController *main = [[YZMainController alloc] init];
        YZGuideController *guide = [[YZGuideController alloc] init];
        [self setViewControllers:@[main,guide]];
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
