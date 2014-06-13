//
//  AppDelegate.h
//  honda
//
//  Created by apple on 14-6-12.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHTabBar.h"
@class IndexController;
#define APPDELEGATE  ((AppDelegate *)[[UIApplication sharedApplication] delegate])
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) IndexController *viewController;
@property (strong, nonatomic) CHTabBar *tabbar;
@end
