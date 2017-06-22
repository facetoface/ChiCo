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
    
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    
//    [self test];
    [self setUpSubViews];
    // Do any additional setup after loading the view.
}

- (void)test
{
    UIView *bodyView1 = [[UIView alloc] initWithFrame:CGRectMake(80, 80, 100, 100)];
    [bodyView1 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:bodyView1];
    
    UIView *bodyView2 = [[UIView alloc] initWithFrame:CGRectMake(220, 80, 100, 100)];
    [bodyView2 setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:bodyView2];
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    [blueView setBackgroundColor:[UIColor blueColor]];
    [bodyView2 addSubview:blueView];
    [bodyView1 addSubview:blueView];
    
    
    
//    [self.view addSubview:blueView];

}

- (void)setUpSubViews
{

    UIView *bigView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_HEIGHT-100)];
    [self.view addSubview:bigView];
    
    UIView *bodyView = [[UIView alloc] init];
    [bigView addSubview:bodyView];
    [bodyView setFrame:CGRectMake(120, 120, 200, 200)];
 
   
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(-0, -5)];
    [path addCurveToPoint:CGPointMake(-20, 210)
            controlPoint1:CGPointMake(-5, 100)
            controlPoint2:CGPointMake(0, 150)];
    
//    [path addCurveToPoint:CGPointMake(230, 220)
//            controlPoint1:CGPointMake(50, 200)
//            controlPoint2:CGPointMake(150, 200)];
//    
//    [path addCurveToPoint:CGPointMake(230, 0)
//            controlPoint1:CGPointMake(200, 150)
//            controlPoint2:CGPointMake(200, 50)];
//    
    
    [path addLineToPoint:CGPointMake(200, 200)];
    [path addLineToPoint:CGPointMake(200, 0)];
    [path addLineToPoint:CGPointMake(0, 0)];
    [path closePath];
    bodyView.layer.shadowPath =  path.CGPath;;
    
    
    [bodyView setBackgroundColor:[UIColor cyanColor]];
    bodyView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    bodyView.layer.shadowRadius = 1;
    bodyView.layer.shadowOffset = CGSizeMake(0,0);
    bodyView.layer.shadowOpacity = 0.8;
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
