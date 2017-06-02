//
//  QKBlockController.m
//  ChiCo
//
//  Created by ChiCo on 2017/6/2.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "QKBlockController.h"
#import "QKBlockOne.h"

@interface QKBlockController ()

@property (nonatomic,copy)NSString *blockString;
@property (nonatomic,strong)QKBlockOne *one;

@end

@implementation QKBlockController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.blockString = @"dfasd";
    [self blockRelease];
}


- (void)blockRelease
{
    self.one = [[QKBlockOne alloc] init];
    
    @weakify(self);
    [self.one setEasyBlock:^{
        @strongify(self);
        NSLog(@"blockString : %@",self.blockString);
    
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    
}

@end
