//
//  AnimationController.m
//  ChiCo
//
//  Created by ChiCo on 2017/7/6.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "AnimationController.h"
#import "QKViewTest.h"

@interface AnimationController ()

@end

@implementation AnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    QKViewTest *view = [[QKViewTest alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    [self.view addSubview:view];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
