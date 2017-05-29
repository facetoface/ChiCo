//
//  QKMainTableBarController.m
//  EasyIOS
//
//  Created by ChiCo on 16/9/7.
//  Copyright © 2016年 EasyIOS. All rights reserved.
//

#import "QKMainTableBarController.h"
#import "QKBaseNavController.h"
#import "HomeController.h"
#import "QKRecommandController.h"
#import "QKMessageController.h"
#import "QKMyCenterController.h"
#import "QKTableBar.h"

@interface QKMainTableBarController ()

@property (nonatomic,weak)QKTableBar *bar;

@end

@implementation QKMainTableBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    

    
    [self setUpControllers];
    [self setUpBar];
    
}


- (void)setUpBar
{
    QKTableBar *tabbar = [[QKTableBar alloc] initWithPaoPao:YES];
    [self setValue:tabbar forKeyPath:@"tabBar"];
//    @weakify(self);
    [tabbar setClickCenterBar:^{
//        @strongify(self);
//        QKExcelController *controller = [[QKExcelController alloc] init];
//        QKBaseNavController *nav = [[QKBaseNavController alloc] initWithRootViewController:controller];
//        [self presentViewController:nav animated:YES completion:nil];

    }];
    self.bar = tabbar;
    
}
- (void)showPaoPao
{
    if(!self.bar.havePaoPao)
    {
        self.bar.havePaoPao = YES;
        CGRect rect = self.bar.frame;
        rect.size.height = 49;
        [self.bar setFrame:rect];
    }
  
}

- (void)hidenPaoPao
{
    if(self.bar.havePaoPao)
    {
        self.bar.havePaoPao = NO;
        CGRect rect = self.bar.frame;
        rect.size.height = 50;
        [self.bar setFrame:rect];
    }
   
}


- (void)setUpControllers
{
    HomeController *home = [[HomeController alloc] init];
    home.tabBarItem.image = [UIImage imageNamed:@"home_normal"];
    home.tabBarItem.selectedImage = [UIImage imageNamed:@"home_highlight"];
    QKBaseNavController *nav1 = [[QKBaseNavController alloc] initWithRootViewController:home];
    
    QKRecommandController *recomand = [[QKRecommandController alloc] init];
    recomand.tabBarItem.image = [UIImage imageNamed:@"fish_normal"];
    recomand.tabBarItem.selectedImage = [UIImage imageNamed:@"fish_highlight"];
    QKBaseNavController *nav2 = [[QKBaseNavController alloc] initWithRootViewController:recomand];
    
    QKMessageController *message = [[QKMessageController alloc] init];
    message.tabBarItem.image = [UIImage imageNamed:@"message_normal"];
    message.tabBarItem.selectedImage = [UIImage imageNamed:@"message_highlight"];
    QKBaseNavController *nav3 = [[QKBaseNavController alloc] initWithRootViewController:message];
    
    
    QKMyCenterController *myCenter = [[QKMyCenterController alloc] init];
    myCenter.tabBarItem.image = [UIImage imageNamed:@"account_normal"];
    myCenter.tabBarItem.selectedImage = [UIImage imageNamed:@"account_normal"];
    QKBaseNavController *nav4 = [[QKBaseNavController alloc] initWithRootViewController:myCenter];

    
    [self setViewControllers:@[nav1,nav2,nav3,nav4]];
}





@end
