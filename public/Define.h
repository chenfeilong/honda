//
//  Define.h
//  eBox
//
//  Created by HsiehWangKuei on 14-3-3.
//  Copyright (c) 2014年 谢旺贵. All rights reserved.
//

#ifndef eBox_Define_h
#define eBox_Define_h

//iPhone4、iPhone5判断
#define iPhone4Retina   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5         ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
//屏幕frame
#define SCREEN_HEIGHT  [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width
//判断系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define FOR_SIT_IOS7_HEIGHT   (IOS_VERSION>=7.0 ? 64:44)
//ios7适配
#define IOS7 if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))\
{self.edgesForExtendedLayout=UIRectEdgeNone;\
self.navigationController.navigationBar.translucent = NO;}

#define IsIOS7 ([[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]>=7)
#define CGRECT_NO_NAV(x,y,w,h) CGRectMake((x), (y+(IsIOS7?20:0)), (w), (h))
#define CGRECT_HAVE_NAV(x,y,w,h) CGRectMake((x), (y+(IsIOS7?64:0)), (w), (h))

#pragma mark- 定义网络请求 成功／失败 返回字符串
/********************  网络请求  ****************************/
#define SUCC         @"网络连接请求成功"
#define FAILURE       @"网络连接异常，请稍后再试。"

//是否有更新
#define REFRESH_DESC_NO             @"refresh_desc_no"          //无更新
#define REFRESH_DESC_YES            @"refresh_desc_yes"         //有更新
#define REFRESH_DOWNLOUD_URL        @"refresh_download_url"     //下载地址


/********************  userdefault中的信息key  ****************************/

#define KEY_USER_NAME            @"userName"
#define KEY_ID_NUMBER            @"idNumber"
#define KEY_PASS_WORD            @"passWord"
#define KEY_IS_AUTOLOGIN         @"isAutoLogin"
#define KEY_TOKEN                @"iosToken"
#define KEY_DOWNLOADLIST         @"downloadList"                //保存未未完成下载的应用名称


/***** 输入限制  ********/

#define USERNAME_MAX_LENGTH         20
#define USERNAME_MIN_LENGTH         2

#define EMAIL_MAX_LENGTH            64
#define EMAIL_MIN_LENGTH            3

#define IDCARDNUMBER_MAX_LENGTH     20
#define IDCARDNUMBER_MIN_LENGTH     7

#define PASSWORD_MAX_LENGTH         16
#define PASSWORD_MIN_LENGTH         6

#define PHONENUMBER_LENGTH_LIMIT    11

#pragma mark -基本路径-
#define BASEPATH [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]

#define CITY_FILENAME   @"cityForm.plist"               //省份列表

#pragma mark- 定义网络请求 成功／失败 返回字符串
/********************  网络请求  ****************************/
#define SUCC         @"网络连接请求成功"
#define FAILURE       @"网络连接异常，请稍后再试。"
#define TIMEOUT_TIME   30     //http请求时长

#define GB_REQUEST    @"http://192.168.2.254:8080/PowerMAP/json/"                 //局域网
#define GB_REQUEST_JIAMI    @"http://192.168.2.254:8080/PowerMAP/jsonp/"          //局域网加密接口
//#define GB_REQUEST_JIAMI    @"http://192.168.1.106:8080/PowerMAP/jsons/"          //王红伟加密接口
//#define GB_REQUEST    @"http://192.168.1.104:8080/PowerMAP/json/"                 //王红伟不加密接口

//#define GB_REQUEST    @"http://192.168.1.7:8080/PowerMAP/json/"                   //测试接口1
//#define GB_REQUEST_JIAMI    @"http://192.168.1.7:8080/PowerMAP/jsonp/"            //测试接口1加密

//是否有更新
#define REFRESH_DESC_NO             @"refresh_desc_no"          //无更新
#define REFRESH_DESC_YES            @"refresh_desc_yes"         //有更新
#define REFRESH_DOWNLOUD_URL        @"refresh_download_url"     //下载地址

#define CESHI_TOKEN                 @"10aba80f664820e20f99223995ad00d344b2f616324a742cda9a49bbf417a9c0" //测试用Token

#pragma mark- 后台接口
/********************  后台接口  ****************************/
#define REQCODE_CHUSHISYSTEM            @"REQ_0000"                     //初始化系统
#define REQCODE_LOGIN                   @"REQ_0001"                     //登录
#define REQCODE_REGISTER                @"REQ_0002"                     //注册
#define REQCODE_SEARCH_CARSTOREFORM     @"REQ_0003"                     //查询特约店列表
#define REQCODE_SEARCH_APPFORM          @"REQ_0004"                     //应用列表查询
#define REQCODE_SEARCH_DATADIC          @"REQ_0005"                     //数据字典查询
#define REQCODE_SEARCH_CITY             @"REQ_0006"                     //省市查询
#define REQCODE_UPDATE_DATAPACK         @"REQ_0007"                     //数据包升级
#define REQCODE_ROAD_RESCUE             @"REQ_0008"                     //道路救援
#define REQCODE_AD_CONTROL              @"REQ_0009"                     //省市查询广告管理
#define REQCODE_CITY_CARSTORE           @"REQ_0010"                     //省市查询特约店
#define REQCODE_NEAR_CARSTORE           @"REQ_0011"                     //查询附近特约店
#define REQCODE_KEYCODE_CARSTORE        @"REQ_0012"                     //关键字查询特约店
#define REQCODE_CARTYPE                 @"REQ_0012"                     //获取车型列表
#define REQCODE_EXHAUST                 @"REQ_0013"                     //获取所有排量信息
#define REQCODE_CARFRIEND_ACTIVITY      @"REQ_0014"                     //获取门店的车友会活动列表
#define REQCODE_APPLAY                  @"REQ_0015"                     //车友会或零部件优惠活动报名
#define REQCODE_PRAISE                  @"REQ_0016"                     //车友会或零部件优惠活动点赞
#define REQCODE_SHARE                   @"REQ_0017"                     //车友会或零部件优惠活动分享
#define REQCODE_GET_QUESTIONNAIRE       @"REQ_0018"                     //车友会或零部件优惠活动问卷获取
#define REQCODE_SUBMIT_QUESTIONNAIRE    @"REQ_0019"                     //车友会或零部件优惠活动问卷提交
#define REQCODE_SUBMIT_SORFWEARENOTICE  @"REQ_0020"                     //软件意见反馈提交
#define REQCODE_CONSULT_CARSTORE        @"REQ_0021"                     //门店咨询提交
#define REQCODE_VEHICLE_MAINTENANCE     @"REQ_0022"                     //预约保养
#define REQCODE_ADDORFIX_VEHICLEINFO    @"REQ_0023"                     //添加或修改用户车辆信息
#define REQCODE_VEHICLE_PATHS           @"REQ_0024"                     //软件查询所有零部件和配饰备件信息列表
#define REQCODE_MAINTENANCE_OBJ         @"REQ_0025"                     //查询门店保养项目列表

/*************************/
struct MARGIN{int left;int right;int top; int bottom;};
#define BEGIN_POOL  @autoreleasepool {
#define END_POOL  }
/**************************/

#endif
