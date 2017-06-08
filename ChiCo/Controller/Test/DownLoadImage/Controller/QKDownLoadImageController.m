//
//  QKDownLoadImageController.m
//  ChiCo
//
//  Created by ChiCo on 2017/6/2.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "QKDownLoadImageController.h"

@interface QKDownLoadImageController ()

@property (nonatomic,strong)UIScrollView *bodyView;
@property (nonatomic,copy)NSString *test;

@end

@implementation QKDownLoadImageController
{
    NSString *str;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupSubViews];
    
    [self testPureInt];
    
}

- (void)testPureInt
{
   
    NSArray *array = @[@"",@"1",@"112",@"3afs",@"daf",@"990i1"];
    for (NSUInteger index = 0; index < [array count]; index++) {
        [self isPureInt:array[index]];
    }
    
}

- (void)isPureInt:(NSString*)string
{
    
    NSScanner* scan = [NSScanner scannerWithString:string];
    
    int val;
    
    if ([scan scanInt:&val] && [scan isAtEnd]) {
        NSLog(@"%@ 是纯数字",string);
    } else
    {
        NSLog(@"%@ 不是是纯数字",string);
    }
    
}


- (void)setupSubViews
{
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.bodyView = ({
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        [self.view addSubview:scrollView];
        scrollView;
    });
    [self loadImage];
}

- (void)loadImage
{
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.bodyView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(QK_PADDING);
        make.right.mas_equalTo(-QK_PADDING);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-2*QK_PADDING, 200) );
        make.bottom.mas_equalTo(0);
        make.top.mas_equalTo(QK_PADDING);
    }];
    [imageView sd_setImageWithURL:[NSURL URLWithString:@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=897795441,1342958893&fm=11&gp=0.jpg"]];
    NSURL *url = imageView.sd_imageURL;
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
