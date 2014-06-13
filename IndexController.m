//
//  IndexController.m
//  my_weibo
//
//  Created by apple on 13-8-15.
//  Copyright (c) 2013年 apple. All rights reserved.
// 主页面

#import "IndexController.h"
#import "CHTabBar.h"
#import "CHTabBarItem.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImage+Addition.h"
#import "HomeViewController.h"
#import "BrandViewController.h"
#import "MoreViewController.h"


#define  kTabbarHeight 44
@interface IndexController (){
   
}

@end

@implementation IndexController

#pragma mark -私有方法
#pragma mark 初始化选项卡
-(void)initTabbar{
    CGSize viewSize = self.view.bounds.size;
    //1.初始化所有的标签信息
    CHTabBarItemDesc *item1 = [[[CHTabBarItemDesc alloc]init]autorelease];
    item1.title = NSLocalizedString(@"品牌", nil);
    item1.normal = @"底部2.png";
    item1.highlighted = @"底部2副本.png";
    
    CHTabBarItemDesc *item2 = [[[CHTabBarItemDesc alloc]init]autorelease];
    item2.title = NSLocalizedString(@"", nil);
    item2.normal = @"底部3.png";
    item2.highlighted = @"底部3副本.png";
    
    CHTabBarItemDesc *item3 = [[[CHTabBarItemDesc alloc]init]autorelease];
    item3.title = NSLocalizedString(@"更多", nil);
    item3.normal = @"底部4.png";
    item3.highlighted = @"底部4副本.png";
    
    NSArray *items = [NSArray arrayWithObjects:item1,item2,item3, nil];
    
    //2.添加Tabbar
    CGRect tabbarFrame = CGRectMake(0, viewSize.height-kTabbarHeight, viewSize.width, kTabbarHeight);
    
    //TabBar初始化
    
    _tabbar = [[[CHTabBar alloc]initWithFrame:tabbarFrame items:items] autorelease];
    
    _tabbar.delegate = self;
    [self.view addSubview:_tabbar];

}

#pragma mark 添加一个子控制器
-(void)addController:(UIViewController *)vc title:(NSString *)title{
    vc.title = NSLocalizedString(title, nil);
     UINavigationController *nav = [[[UINavigationController alloc]initWithRootViewController:vc]autorelease];
    
    
    
    //添加子控制器 通过self.childViewControllers来访问
    [self addChildViewController:nav];

}

#pragma mark 初始化所有的子控制器
-(void)initControllers
{
    BrandViewController *vc1 = [[[BrandViewController alloc]init]autorelease];
    [self addController:vc1 title:@"应用"];
   
    HomeViewController *vc2 = [[[HomeViewController alloc]init]autorelease];
    [self addController:vc2 title:@"首页"];
    
    MoreViewController *vc3 = [[[MoreViewController alloc]init]autorelease];
    [self addController:vc3 title:@"更多"];

    
}

#pragma mark 初始化中间的View
-(void)initContenView{
    _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-kTabbarHeight)];
                           
    [self.view addSubview:_contentView];
    [_contentView release];
}

#pragma mark 根据索引显示对应的子控制器
-(void)displayControllerWithIndex:(int)index{
    //如果tabbar不存在, 直接返回
    if (!_tabbar) return;
    //如果下标越界
    if (index <0||index>=_tabbar.subviews.count) return;
    //如果当前选中的索引跟参数一样
    if (self.selectedIndex ==index) return;
    
    CATransition *anim = nil;
    
    if (self.selectedIndex >=0) {
        //跳转动画
        anim = [CATransition animation];
        anim.duration = 0.1;
        anim.type = @"push";
        anim.subtype = index<self.selectedIndex?@"fromLeft":@"fromRight";
        
        //取得当前显示的控制器
        UIViewController *old = [self.childViewControllers objectAtIndex:self.selectedIndex];
        //移除旧的view
        [old.view removeFromSuperview];
    }
    
    //取得新的控制器
    UIViewController *new = [self.childViewControllers objectAtIndex:index];
   
    
    //添加新的view
    new.view.frame = _contentView.bounds;
    [_contentView addSubview:new.view];
    //是否需要跳转动画
//    if (anim) {
//    [_contentView.layer addAnimation:anim forKey:nil];
//    }
}

#pragma mark 设置主题
-(void)initTheme{
    //更换导航栏的背景
//    UIImage *bg = [UIImage stretchImage:@"navigationbar_background.png"];
//    [[UINavigationBar appearance]setBackgroundImage:bg forBarMetrics:UIBarMetricsDefault];
    //设置导航栏的文字
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //文字颜色
    [dict setObject:[UIColor colorWithRed:0 green:0 blue:0 alpha:1] forKey:UITextAttributeTextColor];
    //阴影
//    [dict setObject:[UIColor colorWithRed:240 green:240 blue:210 alpha:.5] forKey:UITextAttributeTextShadowColor];
//    [dict setObject:[NSValue valueWithUIOffset:UIOffsetMake(0, 5)] forKey:UITextAttributeTextShadowOffset];
    //字体
//    [dict setObject:[UIFont fontWithName:@"Arial" size:0.0] forKey:UITextAttributeFont];
    [[UINavigationBar appearance]setTitleTextAttributes:dict];
    
}

#pragma mark - 生命周期方法
#pragma mark view被加载完毕
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    //设置整个应用导航栏的主题
    [self initTheme];
    
    //初始化选项卡
    [self initTabbar];
    
    //初始化中间的view,也就是用来显示子控制器view的视图
    [self initContenView];
    
    //初始化所有的子控制器
    [self initControllers];
    
    //设置默认选中的第0个位置
     [self setSelectedIndex:1];
}

#pragma mark 当self.view 被添加到view hierarch中就会调用
-(void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    
//    NSArray *accounts = [WeiboAccountManager shared].accounts;
//    if (accounts.count ==0) {
//    //跳到新浪的授权页面
//    OAuthController *oauth = [[[OAuthController alloc]init]autorelease];
//    UINavigationController *navi = [[[UINavigationController alloc]initWithRootViewController:oauth]autorelease];
//    [self presentViewController:navi animated:YES completion:nil];
//    }else{
//        [self setSelectedIndex:0];
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tabChangeFrom:(NSUInteger)from to:(NSUInteger)to{
//    NSLog(@"从%i切换到%i",from,to);
    [self displayControllerWithIndex:to];
}
#pragma mark - 公共方法
#pragma mark selectedIndex的属性访问方法
-(void)setSelectedIndex:(int)selectedIndex{
    //如果tabbar不存在, 直接返回
    if (!_tabbar) return;
    
    //如果下标越界
    if (selectedIndex <0||selectedIndex>=_tabbar.subviews.count) return;
    
    //如果当前选中的索引跟参数一样
    if (self.selectedIndex == selectedIndex) return;
    
    //1.设置要显示的子控制器
    [self displayControllerWithIndex:selectedIndex];
    
    //2.设置tabbar的选中
    _tabbar.selectedIndex = selectedIndex;
}

-(int)selectedIndex{
    if (!_tabbar) {
        return -1;
    }
    return _tabbar.selectedIndex;
}

@end
