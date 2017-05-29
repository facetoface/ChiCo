/************************************************
 * 1.头部导航栏
 * 2.底部bar
 * 3.body 是滚动视图承载3个可以切换的table
 * 4.body 头部是3个表的公共视图，切换栏不可以滚出屏幕
 ***********************************************/

#import "HomeController.h"
#import "QKHomeModel.h"
#import "QKReasouce.h"
#import "QKBaseNavController.h"


@interface HomeController ()

@property (nonatomic,strong)NSArray <QKHomeModel *>*dataSouce;
@property (nonatomic,strong)NSArray *assertArray;

@end



@implementation HomeController


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"首页";
        NSArray *array = [QKReasouce projectJson:@"home"];
        self.dataSouce = [QKHomeModel mj_objectArrayWithKeyValuesArray:array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    UIScrollView *bodyView = [[UIScrollView alloc] init];
    [self.view addSubview:bodyView];
    [bodyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    [self setSubViews:bodyView];
    
}

- (void)setSubViews:(UIView *)bodyView
{
    CGFloat originY = 20;
    CGFloat leftSpace = 10;
    NSUInteger count = [self.dataSouce count];
    CGFloat btnH = 30;
    CGFloat btnW = 90;
    NSUInteger rowCount = (SCREEN_WIDTH-20)/btnW;
    CGFloat ltSpace = (SCREEN_WIDTH-btnW*rowCount-20)/(rowCount-1);
    
    for (NSUInteger index = 0; index < count; index ++)
    {
        NSUInteger row = index/rowCount;
        NSUInteger list = index%rowCount;
        CGFloat btnX = leftSpace + list*(btnW+ltSpace);
        CGFloat btnY = originY + row * (btnH+10);
        QKHomeModel *model = self.dataSouce[index];
        NSString *title = model.title;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(btnX, btnY, btnW, btnH)];
        button.tag = (NSInteger)(2000+index);
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor qk_lightBlueColor] forState:UIControlStateNormal];
        button.layer.borderWidth = 1;
        button.layer.borderColor = [[UIColor qk_lightBlueColor] CGColor];
        [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [button.titleLabel setLineBreakMode:NSLineBreakByTruncatingTail];
        [button addTarget:self
                   action:@selector(buttonClick:)
         forControlEvents:UIControlEventTouchUpInside];
        [bodyView addSubview:button];
      
    }
}
- (void)buttonClick:(UIButton *)button
{
    NSUInteger index = button.tag - 2000;
    QKHomeModel *model = [self.dataSouce objectAtIndex:index];
    
    Class controllerClass = NSClassFromString(model.identifer);
    UIViewController *controller = [[controllerClass alloc] init];
    controller.title = model.title;
    if ([model.pushType isEqualToString:@"1"]) {
        [self.navigationController pushViewController:controller animated:YES];
    }else if([model.pushType isEqualToString:@"2"])
    {
        QKBaseNavController *nav = [[QKBaseNavController alloc] initWithRootViewController:controller];
        [self presentViewController:nav animated:YES completion:NULL];
        
    }else
    {
        [self presentViewController:controller animated:YES completion:NULL];
    }
    
    
    
    
}

#pragma mark - memory
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    
}

@end
