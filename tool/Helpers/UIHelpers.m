//
//  UIHelpers.m
//  eBox
//
//  Created by HsiehWangKuei on 14-3-3.
//  Copyright (c) 2014年 谢旺贵. All rights reserved.
//

#import "UIHelpers.h"
#import "JSBadgeView.h"

@implementation UIHelpers

/**************************************************************
 ** 功能:     弹出alert提示
 ** 参数:     nsstring
 ** 返回:     无
 **************************************************************/
+ (void)alertWithTitle:(NSString*)title{
    UIAlertView *view = [[UIAlertView alloc] init];
    view.title = @"温馨提示";
    view.message=title;
    [view addButtonWithTitle:@"确定"];
    [view show];
    [view release];
}

/**************************************************************
 ** 功能:     弹出alert提示
 ** 参数:     nsstring（标题）、nsstring（内容）
 ** 返回:     无
 **************************************************************/
+ (void)alertWithTitle:(NSString*)title andMSG:(NSString*)msg{
    UIAlertView *view = [[UIAlertView alloc] init];
    view.title = title;
    view.message = msg;
    [view addButtonWithTitle:@"确定"];
    [view show];
    [view release];
}
/**************************************************************
 ** 功能:     弹出alert提示
 ** 参数:     nsstring（标题）、nsstring（内容）
 ** 返回:     无
 **************************************************************/
+ (void)alertWithTitle:(NSString*)title andMSG:(NSString*)msg delegate:(id)sender andTag:(NSInteger)tag{
    UIAlertView *view = [[UIAlertView alloc] init];
    view.title = title;
    view.message = msg;
    view.tag=tag;
    view.delegate=sender;
    [view addButtonWithTitle:@"取消"];
    [view addButtonWithTitle:@"确定"];
    [view show];
    [view release];
}

/**************************************************************
 ** 功能:     弹出alert提示
 ** 参数:     nsstring（标题）、nsstring（输入框内容）、代理对象
 ** 返回:     无
 **************************************************************/
//+ (void)alertWithTitle:(NSString*)title textFContent:(NSString*)text delegate:(id)sender andTag:(NSInteger)tag{
//    UIAlertView *view = [[UIAlertView alloc] init];
//    view.alertViewStyle = UIAlertViewStylePlainTextInput;
//    [[view textFieldAtIndex:0] setText:text];
//    [[view textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeNumberPad];
//    [[view textFieldAtIndex:0] setTag:TAG_TEXT_FIELD_PHONE_NUM];
//    [[view textFieldAtIndex:0] setDelegate:sender];
//    view.title = title;
//    [view addButtonWithTitle:@"取消"];
//    [view addButtonWithTitle:@"拨打"];
//    view.delegate = sender;
//    view.tag = tag;
//    [view show];
//    [view release];
//}

/**************************************************************
 ** 功能:     弹出拨打电话前的alert提示
 ** 参数:     nsstring（提示内容内容）、代理对象
 ** 返回:     无
 **************************************************************/
+ (void)alertWithMsg:(NSString*)msg delegate:(id)sender andTag:(NSInteger)tag{
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:msg delegate:sender cancelButtonTitle:@"取消" otherButtonTitles:@"拨打", nil];
    view.tag = tag;
    [view show];
    [view release];
}


/**************************************************************
 ** 功能:     加loading view
 ** 参数:     cgrect(loadingview的frame)、id（加在此对象上）
 ** 返回:     无
 **************************************************************/
//+ (void)addLoadingViewTo:(UIView*)targetV withFrame:(CGRect)frame andText:(NSString*)text{
//    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithFrame:frame];
//    [targetV addSubview:hud];
//    [hud release];
//    hud.labelText = text;
//    hud.removeFromSuperViewOnHide = YES;
//    [hud show:YES];
//}


/**************************************************************
 ** 功能:     定制navigation bar 二级页面
 ** 参数:     uiimage（背景图片）、nsstring（标题）、id（目标对象）、ButtonHidden(返回按钮隐藏)
 ** 返回:     uiview
 **************************************************************/
+ (UIView*)headerViewWithImage:(UIImage*)img title:(NSString*)title target:(id)sender{
    UIImageView *view = [[[UIImageView alloc] initWithFrame:CGRECT_NO_NAV(0, 0, 320, 44)] autorelease];
    view.userInteractionEnabled = YES;
    [view setImage:img];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(5, 5, 40, 33);
    [button setImage:[UIImage imageNamed:@"1_03.png"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"1_03.png"] forState:UIControlStateSelected];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:sender action:@selector(backBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    UILabel *label = [[[UILabel alloc] init] autorelease];
    CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:20]];
    [label setFrame:CGRectMake((320 - size.width)/2, 5, size.width, (44 - 10))];
    
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:20];
    label.text = title;
    label.textColor = [UIColor blackColor];
    [view addSubview:label];
    
    return view;
}
/**************************************************************
 ** 功能:     定制navigation bar 一级页面
 ** 参数:     uiimage（背景图片）、nsstring（标题)
 ** 返回:     uiview
 **************************************************************/
+ (UIView *)headerViewWithImage:(UIImage *)img title:(NSString *)title;
{
    UIImageView *view = [[[UIImageView alloc] initWithFrame:CGRECT_NO_NAV(0, 0, 320, 44)] autorelease];
    view.userInteractionEnabled = YES;
    [view setImage:img];
    
    UILabel *label = [[[UILabel alloc] init] autorelease];
    CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:20]];
    [label setFrame:CGRectMake((320 - size.width)/2, 5, size.width, (44 - 10))];
    
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:20];
    label.text = title;
    label.textColor = [UIColor blackColor];
    [view addSubview:label];
    
    return view;
}

/**************************************************************
 ** 功能:     定制navigation bar  一级页面
 ** 参数:     uiimage（背景图片）、nsstring（标题）、id（目标对象
 ** 返回:     uiview
 **************************************************************/
+ (UIView *)homeViewHeaderWithImage:(UIImage *)img title:(NSString *)title target:(id)sender
{
    UIImageView *view = [[[UIImageView alloc] initWithFrame:CGRECT_NO_NAV(0, 0, 320, 44)] autorelease];
    view.userInteractionEnabled = YES;
    [view setImage:img];
//    //定位按钮
//    UIButton *item1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    item1.frame = CGRectMake(5, 5, 33, 33);
//    [item1 setImage:[UIImage imageNamed:@"顶部1.png"] forState:UIControlStateNormal];
//    [item1 addTarget:sender action:@selector(locationAction:) forControlEvents:UIControlEventTouchUpInside];
//    [view addSubview:item1];
//    UILabel *label = [[[UILabel alloc] init] autorelease];
//    CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:20]];
//    [label setFrame:CGRectMake((320 - size.width)/2, 5, size.width, (44 - 10))];
//    UIImageView *logo = [[[UIImageView alloc] initWithFrame:CGRectMake(38 + 8, 7, 222, 30)] autorelease];
//    logo.image = [UIImage imageNamed:@"logo.png"];
//    [view addSubview:logo];
    //个人中心
//    UIButton *item2 = [UIButton buttonWithType:UIButtonTypeCustom];
//    item2.frame = CGRectMake(277, 5, 33, 33);
//    [item2 setImage:[UIImage imageNamed:@"顶部2.png"] forState:UIControlStateNormal];
//    [item2 addTarget:sender action:@selector(loginPersonalCenter:) forControlEvents:UIControlEventTouchUpInside];
//    [view addSubview:item2];
    
//    JSBadgeView *jsBadgeView = [[JSBadgeView alloc] initWithParentView:item2 alignment:JSBadgeViewAlignmentTopRight];
//    jsBadgeView.badgeText = [NSString stringWithFormat:@"%d",[UIApplication sharedApplication].applicationIconBadgeNumber];
//    [jsBadgeView release];
    
//    label.backgroundColor = [UIColor clearColor];
//    label.font = [UIFont systemFontOfSize:20];
//    label.text = title;
//    label.textColor = [UIColor blackColor];
//    [view addSubview:label];
    
    return view;
}

@end
