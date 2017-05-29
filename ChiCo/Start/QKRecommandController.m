//
//  QKRecommandController.m
//  EasyIOS
//
//  Created by ChiCo on 16/9/7.
//  Copyright © 2016年 EasyIOS. All rights reserved.
//

#import "QKRecommandController.h"

@implementation QKRecommandController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"推荐";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
   
}


@end
