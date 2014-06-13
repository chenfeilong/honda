/******************************************************
 *标题:         类别类
 *创建人:        mzq
 *创建日期:      13-12-29
 *功能及说明:    各系统类的类别，实现系统类方法的拓展
 *
 *修改记录列表:
 *修改记录:
 *修改日期:
 *修改者:
 *修改内容简述:
 *********************************************************/

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import "sys/utsname.h"

//#import "CameraView.h"


//#define SQUARE_WIDTH                145
//#define SQUARE_HEITHG               135
//#define SQUARE_X_SPACE              10
//#define SQUARE_Y_SPACE_NOMAL        2.5
//
//#define SQUARE_Y_SPACE_IPHONE5      25

//#define SQUARE_WIDTH                130
//#define SQUARE_HEITHG               130
//#define SQUARE_X_SPACE              20
//#define SQUARE_Y_SPACE_NOMAL        6.5
//
//#define SQUARE_Y_SPACE_IPHONE5      28.5

#define SQUARE_WIDTH                80
#define SQUARE_HEITHG               90
#define SQUARE_X_SPACE              20
#define SQUARE_Y_SPACE_NOMAL        10

#define SQUARE_HEITHG_IPHONE5       154

#define IPHONE_5S          @"iPhone 5S"
#define IPHONE_5           @"iPhone 5"
#define IPHONE_4           @"iPhone 4"
#define IPHONE_4S          @"iPhone 4S"
#define IPHONE_3G          @"iPhone 3G"
#define IPHONE_3GS         @"iPhone 3GS"

@interface ExtendClass : NSObject

@end


@interface NSString (Extend)

/**************************************************************
 ** 功能:     温度前后位置调换
 ** 参数:     nil
 ** 返回:     NSString
 **************************************************************/
-(NSString*)DislocationTemperature;

//////解析thml
/**************************************************************
 ** 功能:     温馨提示thml解析
 ** 参数:     nssgring
 ** 返回:     NSString
 **************************************************************/
-(NSString*)GetThmlOfString:(NSString*)sender;

/**************************************************************
 ** 功能:     电话号码正则
 ** 参数:     无
 ** 返回:     bool
 **************************************************************/
- (BOOL)validatePhoneNumber;

/**************************************************************
 ** 功能:     报案号码正则
 ** 参数:     无
 ** 返回:     bool
 **************************************************************/
- (BOOL)validateReportNumber;

/**************************************************************
 ** 功能:     车牌号码正则
 ** 参数:     无
 ** 返回:     bool
 **************************************************************/
- (BOOL)validateCarLicense;

/**************************************************************
 ** 功能:     email正则
 ** 参数:     无
 ** 返回:     bool
 **************************************************************/
-(BOOL)validateEmail;

/**************************************************************
 ** 功能:     新浪微薄正则
 ** 参数:     无
 ** 返回:     bool
 **************************************************************/
- (BOOL)sinaWeibo;

/**************************************************************
 ** 功能:     md5加密
 ** 参数:     无
 ** 返回:     nsstring（加密后字符串）
 **************************************************************/
-(NSString *) md5HexDigest;


/**************************************************************
 ** 功能:     获取当前设备型号
 ** 参数:     无
 ** 返回:     字符串
 **************************************************************/
+ (NSString*)deviceString;






- (NSString *)escapeHTML;
- (NSString *)unescapeHTML;

@end




@interface NSDictionary (Extend)
/**************************************************************
 ** 功能:     从字典中获取节点字符串，如果该节点不存在，返回nil
 ** 参数:     节点array
 ** 返回:     nsstring
 **************************************************************/
- (NSString*)findStringWithNodeArray:(NSArray*)nodeArray;

@end



@interface UIImageView (Extend)
/**************************************************************
 ** 功能:     二级界面构成－－方形背景
 ** 参数:     整型数（界面第几个view，从0开始,横向数）
 ** 返回:     imageview
 **************************************************************/
+ (UIImageView*)squareBackgroundViewWithNum:(NSInteger)num;


/**************************************************************
 ** 功能:     二级界面构成－－中间图
 ** 参数:     字符串（图片名）
 ** 返回:     imageview
 **************************************************************/
+ (UIImageView*)squareCenterViewWithImage:(UIImage*)img;

/**************************************************************
 ** 功能:     二级界面构成－－新的图形
 ** 参数:     字符串（图片名）   //// min an by mzq
 ** 返回:     imageview
 **************************************************************/
+ (UIImageView*)squareNewGourdWithImage:(UIImage*)img Title:(NSString*)title Message:(NSString*)message Subimage:(UIImage*)subimage ;
/**************************************************************
 ** 功能:     主界面构成－－新的图形     //// min an by mzq
 ** 参数:     字符串（图片名）
 ** 返回:     imageview
 **************************************************************/
+ (UIImageView*)squareNewGourdWithImage:(UIImage*)img AndTitle:(NSString*)str AndColor:(UIImage*)colorwithimg frame:(CGRect)frame;

@end


@interface UILabel (Extend)

/**************************************************************
 ** 功能:     二级界面构成－－方形图上的lable
 ** 参数:     字符串（lable上的text）
 ** 返回:     uilable
 **************************************************************/
+ (UILabel*)squareCenterLableWithText:(NSString*)text;
@end


@interface UIButton (Extend)

/**************************************************************
 ** 功能:     二级界面构成－－方形图上最外层button
 ** 参数:     整型数（界面第几个view，从0开始,横向数）
 ** 返回:     uibutton
 **************************************************************/
+ (UIButton*)squareCenterButtonWithNum:(NSInteger)num;

/**************************************************************
 ** 功能:     增加删除效果
 ** 参数:     UIView（加在此view上），CGRect（frame）
 ** 返回:     无
 **************************************************************/
//- (void)addDeleteCoverViewWithBtnTaget:(id)sender andBtnTag:(NSInteger)tag;

@end


@interface UIView (Extend)
/**************************************************************
 ** 功能:     下载的progerssview
 ** 参数:     frame，背景颜色，透明度
 ** 返回:     uiview
 **************************************************************/
+ (UIView*)progressViewWithFrame:(CGRect)frame color:(UIColor*)color alpha:(CGFloat)alpha andText:(NSString*)text;

/**************************************************************
 ** 功能:     查勘案件信息展示背景view
 ** 参数:     无
 ** 返回:     无
 **************************************************************/
+ (UIView*)checkBgViewWithNum:(NSInteger)num;
@end



@interface NSObject (Extend)

/**************************************************************
 ** 功能:     协助解析 将object对象转成数组
 ** 参数:     无
 ** 返回:     数组
 **************************************************************/
- (NSArray*)convertToArray;

/**************************************************************
 ** 功能:     协助解析 将object对象转成字典
 ** 参数:     无
 ** 返回:     数组
 **************************************************************/
- (NSDictionary*)convertToDict;
@end


@interface UIImage (Extend)

//非缓存
+ (UIImage *)imageNamedNoCache:(NSString *)imageName;

- (UIImage *)fixOrientation:(UIImage *)aImage;




@end
