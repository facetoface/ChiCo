//
//  YZMainController.m
//  ChiCo
//
//  Created by ChiCo on 2017/6/19.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "YZMainController.h"

@interface YZMainController ()

@end

@implementation YZMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self setUpSubViews];
    // Do any additional setup after loading the view.
}

- (void)setUpSubViews
{

    UIView *bodyView = [[UIView alloc] init];
    [self.view addSubview:bodyView];
    [bodyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(80);
        make.bottom.mas_equalTo(-50);
    }];
    
//    [bodyView setClipsToBounds:YES];
    bodyView.layer.cornerRadius = 20;
    [bodyView setBackgroundColor:[UIColor yellowColor]];
    bodyView.layer.borderColor = [[UIColor colorWithHexString:@"#eaeaea"] CGColor];
    bodyView.layer.shadowColor = [UIColor blueColor].CGColor;
    bodyView.layer.shadowRadius = 18;
    bodyView.layer.shadowOffset = CGSizeMake(15, 5);
    bodyView.layer.borderWidth = 1;
    
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
