//
//  QKDownLoadImageController.m
//  ChiCo
//
//  Created by ChiCo on 2017/6/2.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "QKDownLoadImageController.h"

@interface QKDownLoadImageController ()



@end

@implementation QKDownLoadImageController


- (void)viewDidLoad
{
    [super viewDidLoad];

    [self loadImage];
    
}


- (void)loadImage
{
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(QK_PADDING);
        make.right.mas_equalTo(-QK_PADDING);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-2*QK_PADDING, 200) );
        make.bottom.mas_equalTo(0);
        make.top.mas_equalTo(QK_PADDING);
    }];
    [imageView sd_setImageWithURL:[NSURL URLWithString:@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=897795441,1342958893&fm=11&gp=0.jpg"]];
    NSURL *url = imageView.sd_imageURL;
    [imageView setHidden:YES];
    NSLog(@"%@",url);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    NSLog(@"QKDownLoadImageController");
}

@end
