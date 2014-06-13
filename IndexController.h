//
//  IndexController.h
//  my_weibo
//
//  Created by apple on 13-8-15.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHTabBar.h"
#import "AppDelegate.h"

@interface IndexController : UIViewController <CHTabBarDelegate>{

    UIView *_contentView;
    CHTabBar *_tabbar;
}

//设置容器的选中位置
@property (nonatomic, assign)int selectedIndex;


@end
