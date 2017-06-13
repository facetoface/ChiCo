//
//  QKStringScannerController.m
//  ChiCo
//
//  Created by ChiCo on 2017/6/13.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "QKStringScannerController.h"
#import "QKEasyTestView.h"
#import "QKStringScanner.h"

@interface QKStringScannerController ()<QKEasyTestViewDelegate>

@end

@implementation QKStringScannerController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:@"字符串检测"];
    QKEasyTestView *easyTestView = [[QKEasyTestView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) topSpace:20 lrSpace:10 titleArray:@[@"纯数字"]];
    [self.view addSubview:easyTestView];
    [easyTestView setDelegate:self];
}

- (void)clickEasyTestView:(NSUInteger)index
                    title:(NSString *)title
{
    switch (index) {
        case 0:
        {
            NSArray *array = @[@"",@"1",@"112",@"3afs",@"daf",@"990i1"];
            for (NSUInteger index = 0; index < [array count]; index++) {
                NSString *scanString = [array objectAtIndex:index];
                if ([QKStringScanner isPureInt:scanString]) {
                    NSLog(@"\"%@\" 是纯数字",scanString);
                } else {
                     NSLog(@"\"%@\" 不是纯数字",scanString);
                }
            }
        }
            break;
            
        default:
            break;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
