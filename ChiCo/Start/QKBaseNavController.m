//
//  QKBaseNavController.m
//  EasyIOS
//
//  Created by ChiCo on 16/9/7.
//  Copyright © 2016年 EasyIOS. All rights reserved.
//

#import "QKBaseNavController.h"

@implementation QKBaseNavController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
        //        self.edgesForExtendedLayout=UIRectEdgeNone;
        self.navigationController.navigationBar.translucent = NO;
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSUInteger count = [self.viewControllers count];
    if (count >= 1)
        viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}
@end
