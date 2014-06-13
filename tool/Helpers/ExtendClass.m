//
//  ExtendClass.m
//  tp_self_help
//
//  Created by cloudpower on 13-7-31.
//  Copyright (c) 2013年 cloudpower. All rights reserved.
//

#import "ExtendClass.h"
#import "Define.h"

@implementation ExtendClass

@end

#pragma mark-   NSString

@implementation NSString (Extend)

/**************************************************************
 ** 功能:     温度前后位置调换
 ** 参数:     nil
 ** 返回:     NSString
 **************************************************************/
-(NSString*)DislocationTemperature{
    NSArray *arr=[[[NSArray alloc]init] autorelease];
    arr=[self componentsSeparatedByString: @"~"];
    NSString*  string=@"";
//    if ([arr count]>1) {
//        string=[NSString stringWithFormat:@"%@~%@",[arr objectAtIndex:1],[arr objectAtIndex:0]];
//
//    }
    return string;
}


/**************************************************************
 ** 功能:     温馨提示thml解析
 ** 参数:     nssgring
 ** 返回:     NSString
 **************************************************************/
-(NSString*)GetThmlOfString:(NSString*)sender{
    
  /*NSString *responseStr=[sender stringByReplacingOccurrencesOfString:@"1." withString:@"\n  1."];
    
    NSString *responseStr2=[responseStr stringByReplacingOccurrencesOfString:@"<br />2." withString:@"\n  2."];
    
    NSString *responseStr3=[responseStr2 stringByReplacingOccurrencesOfString:@"<br />3." withString:@"\n  3."];
    */
     NSString *responseStr1=[sender stringByReplacingOccurrencesOfString:@"<br />" withString:@"\n\n"];
     NSString *responseStr3=[responseStr1 stringByReplacingOccurrencesOfString:@"<br/>" withString:@"\n\n"];
    NSString *responseStr4=[responseStr3 stringByReplacingOccurrencesOfString:@"太平" withString:@"民安"];

    return responseStr4;
}

/**************************************************************
 ** 功能:     电话号码正则
 ** 参数:     无
 ** 返回:     bool
 **************************************************************/
- (BOOL)validatePhoneNumber{
    if (self.length != 11) {
        return false;
    }else if(![[self substringToIndex:1] isEqualToString:@"1"]){
        return false;
    }else{
        return true;
    }
}

/**************************************************************
 ** 功能:     报案号码正则
 ** 参数:     无
 ** 返回:     bool
 **************************************************************/
- (BOOL)validateReportNumber{
    if (!(self.length >= 14 && self.length <= 25)) {
        return false;
    }else{
        return true;
    }
}

/**************************************************************
 ** 功能:     车牌号码正则
 ** 参数:     无
 ** 返回:     bool
 **************************************************************/
- (BOOL)validateCarLicense{
    if (self.length != 7) {
        return false;
    }else{
        return true;
    }
}

/**************************************************************
 ** 功能:     email正则
 ** 参数:     无
 ** 返回:     bool
 **************************************************************/
-(BOOL)validateEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

/**************************************************************
 ** 功能:     新浪微薄正则
 ** 参数:     无
 ** 返回:     bool
 **************************************************************/
- (BOOL)sinaWeibo{
    if (self.length > 140) {
        return false;
    }else{
        return true;
    }
}

/**************************************************************
 ** 功能:     md5加密
 ** 参数:     无
 ** 返回:     nsstring（加密后字符串）
 **************************************************************/
-(NSString *) md5HexDigest
{
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
     
}


/**************************************************************
 ** 功能:     获取当前设备型号
 ** 参数:     无
 ** 返回:     字符串
 **************************************************************/


+ (NSString*)deviceString
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSLog(@"当前设备型号:%@,%f",deviceString,IOS_VERSION);
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return IPHONE_3G;
    if ([deviceString isEqualToString:@"iPhone2,1"])    return IPHONE_3GS;
    if ([deviceString isEqualToString:@"iPhone3,1"])    return IPHONE_4;
    if ([deviceString isEqualToString:@"iPhone4,1"])    return IPHONE_4S;
    if ([deviceString isEqualToString:@"iPhone5,2"])    return IPHONE_5;
    if ([deviceString isEqualToString:@"iPhone5S,2"])    return IPHONE_5S;
    if ([deviceString isEqualToString:@"iPhone5S,3"])    return IPHONE_5S;
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    NSLog(@"NOTE: Unknown device type: %@", deviceString);
    return deviceString;
}



#pragma mark - HTML Methods

- (NSString *)escapeHTML {
	NSMutableString *s = [NSMutableString string];
	
	NSUInteger start = 0;
	NSUInteger len = [self length];
	NSCharacterSet *chs = [NSCharacterSet characterSetWithCharactersInString:@"<>&\""];
	
	while (start < len) {
		NSRange r = [self rangeOfCharacterFromSet:chs options:0 range:NSMakeRange(start, len-start)];
		if (r.location == NSNotFound) {
			[s appendString:[self substringFromIndex:start]];
			break;
		}
		
		if (start < r.location) {
			[s appendString:[self substringWithRange:NSMakeRange(start, r.location-start)]];
		}
		
		switch ([self characterAtIndex:r.location]) {
			case '<':
				[s appendString:@"&lt;"];
				break;
			case '>':
				[s appendString:@"&gt;"];
				break;
			case '"':
				[s appendString:@"&quot;"];
				break;
                //			case '…':
                //				[s appendString:@"&hellip;"];
                //				break;
			case '&':
				[s appendString:@"&amp;"];
				break;
		}
		
		start = r.location + 1;
	}
	
	return s;
}


- (NSString *)unescapeHTML {
	NSMutableString *s = [NSMutableString string];
	NSMutableString *target = [self mutableCopy];
	NSCharacterSet *chs = [NSCharacterSet characterSetWithCharactersInString:@"&"];
	
	while ([target length] > 0) {
		NSRange r = [target rangeOfCharacterFromSet:chs];
		if (r.location == NSNotFound) {
			[s appendString:target];
			break;
		}
		
		if (r.location > 0) {
			[s appendString:[target substringToIndex:r.location]];
			[target deleteCharactersInRange:NSMakeRange(0, r.location)];
		}
		
		if ([target hasPrefix:@"&lt;"]) {
			[s appendString:@"<"];
			[target deleteCharactersInRange:NSMakeRange(0, 4)];
		} else if ([target hasPrefix:@"&gt;"]) {
			[s appendString:@">"];
			[target deleteCharactersInRange:NSMakeRange(0, 4)];
		} else if ([target hasPrefix:@"&quot;"]) {
			[s appendString:@"\""];
			[target deleteCharactersInRange:NSMakeRange(0, 6)];
		} else if ([target hasPrefix:@"&#39;"]) {
			[s appendString:@"'"];
			[target deleteCharactersInRange:NSMakeRange(0, 5)];
		} else if ([target hasPrefix:@"&amp;"]) {
			[s appendString:@"&"];
			[target deleteCharactersInRange:NSMakeRange(0, 5)];
		} else if ([target hasPrefix:@"&hellip;"]) {
			[s appendString:@"…"];
			[target deleteCharactersInRange:NSMakeRange(0, 8)];
		} else {
			[s appendString:@"&"];
			[target deleteCharactersInRange:NSMakeRange(0, 1)];
		}
	}
    [target release];      ///之前mutableCopy过 需要手动释放内存
	
	return s;
}

@end

#pragma mark-   NSDictionary

@implementation NSDictionary (Extend)

/**************************************************************
 ** 功能:     从字典中获取节点字符串，如果该节点不存在，返回nil
 ** 参数:     节点array
 ** 返回:     nsstring
 **************************************************************/
- (NSString*)findStringWithNodeArray:(NSArray*)nodeArray{
    NSObject *obj = self;
    for (int i = 0; i < [nodeArray count];i ++) {
        NSString *node = [nodeArray objectAtIndex:i];//获取节点
        if ([obj isKindOfClass:[NSDictionary class]]) {//当前对象是字典，取出节点对应的字符串
            NSDictionary *dict = (NSDictionary*)obj;
            obj = [dict objectForKey:node];
        }else{//当前对象不是字典，无法取出节点对应字符串，返回空
            return nil;
        }
    }
    //节点全部取完后，判断获得到的对象是否为字符串
    if ([obj isKindOfClass:[NSString class]]) {//是字符串，返回
        return (NSString*)obj;
    }else{//最终取出的不是字符串返回空
        return nil;
    }

}

@end

#pragma mark-   UIImageView

@implementation UIImageView (Extend)

/**************************************************************
 ** 功能:     二级界面构成－－方形背景
 ** 参数:     整型数（界面第几个view，从0开始,横向数）
 ** 返回:     imageview
 **************************************************************/
+ (UIImageView*)squareBackgroundViewWithNum:(NSInteger)num{
    
    CGFloat xSpace = SQUARE_X_SPACE;
    CGFloat ySpace = SQUARE_Y_SPACE_NOMAL;
    
    CGFloat height;
    if ([[NSString deviceString] isEqualToString:IPHONE_5]) {
        height = SQUARE_HEITHG_IPHONE5;
    }else{
        height = SQUARE_HEITHG;
    }
    
    CGFloat width = SQUARE_WIDTH;
    UIImageView *imgView = [[[UIImageView alloc] init] autorelease];
    CGFloat x; CGFloat y;
    if (num % 3 == 0) {
        x = xSpace;
        y = ySpace + num/3*(height + ySpace);
    }
    else if (num < 3)
    {
        x = xSpace + num * (width + xSpace);
        y = ySpace + num/3*(height + ySpace);;
    }
    else if (num > 3 && num < 6)
    {
        x = xSpace + (num-3) * (width + xSpace);
        y = ySpace + num/3*(height + ySpace);;
    }
    else if (num > 6 && num < 9){
        x = xSpace + (num-6) * (width + xSpace);
        y = ySpace + num/3*(height + ySpace);
    }
    CGRect frame = CGRectMake(x, y, width, height);
    [imgView setFrame:frame];
//    [imgView setImage:[UIImage imageNamed:@"white_frame.png"]];
    [imgView setUserInteractionEnabled:YES];
    return imgView;
}

/**************************************************************
 ** 功能:     二级界面构成－－中间图
 ** 参数:     字符串（图片名）
 ** 返回:     imageview
 **************************************************************/
+ (UIImageView*)squareCenterViewWithImage:(UIImage*)img{
    UIImageView *imgView = [[[UIImageView alloc] init] autorelease];
    imgView.userInteractionEnabled = YES;
    CGFloat bgHeight = SQUARE_HEITHG;
    CGFloat bgWidth = SQUARE_WIDTH;
    CGFloat width = 60;
    CGFloat height = 60;
    //[imgView setCenter:CGPointMake(bgWidth/2, bgHeight/3)];
    [imgView setFrame:CGRectMake((bgWidth - width)/2, bgHeight/3 - height/2, width, height)];
    [imgView setImage:img];
    return imgView;
}

/**************************************************************
 ** 功能:     二级界面构成－－新的图形
 ** 参数:     字符串（图片名）
 ** 返回:     imageview
 **************************************************************/
+ (UIImageView*)squareNewGourdWithImage:(UIImage*)img Title:(NSString*)title Message:(NSString*)message Subimage:(UIImage*)subimage {
    UIImageView *imgView = [[[UIImageView alloc] init] autorelease];
//    imgView.image=img;
    NSLog(@"-----%@",img);
    [imgView setImage:img];
    NSLog(@"----======-%@",imgView.image);

    UIImageView*subImage=[[[UIImageView alloc]initWithFrame:CGRectMake(42, 5, 60, 60)] autorelease];
    [subImage setImage:subimage];
    
    UILabel*titlelabel=[[[UILabel alloc]initWithFrame:CGRectMake(10, 65, 120, 30)] autorelease];
    titlelabel.text=title;
    titlelabel.textAlignment=NSTextAlignmentCenter;
    titlelabel.backgroundColor=[UIColor clearColor];
    titlelabel.font=[UIFont systemFontOfSize:16];
    titlelabel.textColor=[UIColor whiteColor];
    
//    UILabel*sublabel=[[UILabel alloc]initWithFrame:CGRectMake(110, 0  , 180  , 100)];
//    sublabel.numberOfLines=6;
//    sublabel.font=[UIFont systemFontOfSize:13];
//    sublabel.text=message;
//    sublabel.textColor=[UIColor whiteColor];
//    sublabel.backgroundColor=[UIColor clearColor];

//
//    [imgView addSubview:sublabel];
    [imgView addSubview:titlelabel];
    [imgView addSubview:subImage];
    
    return imgView;
}

/**************************************************************
 ** 功能:     主界面构成－－新的图形
 ** 参数:     字符串（图片名）
 ** 返回:     imageview
 **************************************************************/
+ (UIImageView*)squareNewGourdWithImage:(UIImage*)img AndTitle:(NSString*)str AndColor:(UIImage*)backwithimg frame:(CGRect)frame{
    
    UIImageView *imgView = [[[UIImageView alloc] init] autorelease];
    [imgView setImage:backwithimg];
    
    float sub_higth=frame.size.height/2+10;
    
    UIImageView*subImage=[[[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width/2-20, 5, sub_higth, sub_higth)] autorelease];
    subImage.image=img;
    
    UILabel*titlelabel=[[[UILabel alloc]initWithFrame:CGRectMake(frame.size.width/2-60, sub_higth, 120, 25)] autorelease];
    titlelabel.text=str;
    titlelabel.textAlignment=NSTextAlignmentCenter;
    titlelabel.backgroundColor=[UIColor clearColor];
    titlelabel.font=[UIFont systemFontOfSize:18];
    titlelabel.textColor=[UIColor whiteColor];
    
   
    
    //
    [imgView addSubview:titlelabel];
    [imgView addSubview:subImage];
    
    return imgView;
}



@end



#pragma mark-   UILabel


@implementation UILabel (Extend)

/**************************************************************
 ** 功能:     二级界面构成－－方形图上的lable
 ** 参数:     字符串（lable上的text）
 ** 返回:     uilable
 **************************************************************/
+ (UILabel*)squareCenterLableWithText:(NSString*)text{
    UILabel *lable = [[[UILabel alloc] init] autorelease];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.numberOfLines = 0;
    
    CGSize size = [text sizeWithFont:[UIFont boldSystemFontOfSize:18]];
    CGFloat bgHeight = SQUARE_HEITHG;
    CGFloat bgWidth = SQUARE_WIDTH;
    if (size.width > bgWidth - 2) {//两行
        size = CGSizeMake(bgWidth - 2, size.height * 2);
    }
    CGFloat x = (bgWidth - size.width)/2;
    CGFloat y = (bgHeight - size.height)/2 + 30;
    [lable setFrame:CGRectMake(x, y, size.width, size.height)];    
    [lable setText:text];
    [lable  setFont:[UIFont systemFontOfSize:15.f]];
    return lable;
}

@end


#pragma mark-   UIButton

@implementation UIButton (Extend)

/**************************************************************
 ** 功能:     二级界面构成－－方形图上最外层button
 ** 参数:     整型数（界面第几个view，从0开始,横向数）
 ** 返回:     uibutton
 **************************************************************/
+ (UIButton*)squareCenterButtonWithNum:(NSInteger)num{
    CGFloat xSpace = SQUARE_X_SPACE;
    CGFloat ySpace = SQUARE_Y_SPACE_NOMAL;
    
    CGFloat height;
    if ([[NSString deviceString] isEqualToString:IPHONE_5]) {
        height = SQUARE_HEITHG_IPHONE5;
    }else{
        height = SQUARE_HEITHG;
    }
    
    CGFloat width = SQUARE_WIDTH;
    //CGFloat height = SQUARE_HEITHG;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];

    CGFloat x; CGFloat y;
    if (num % 3 == 0) {
        x = xSpace;
        y = ySpace + num/3*(height + ySpace);
    }
    else if (num < 3)
    {
        x = xSpace + num * (width + xSpace);
        y = ySpace + num/3*(height + ySpace);;
    }
    else if (num > 3 && num < 6)
    {
        x = xSpace + (num-3) * (width + xSpace);
        y = ySpace + num/3*(height + ySpace);;
    }
    else if (num > 6 && num < 9){
        x = xSpace + (num-6) * (width + xSpace);
        y = ySpace + num/3*(height + ySpace);
    }
    CGRect frame = CGRectMake(x, y, width, height);
    [btn setFrame:frame];
    [btn showsTouchWhenHighlighted];
    [btn setAdjustsImageWhenHighlighted:YES];
    return btn;
}

/**************************************************************
 ** 功能:     增加删除效果
 ** 参数:     UIView（加在此view上），CGRect（frame）
 ** 返回:     无
 **************************************************************/
//- (void)addDeleteCoverViewWithBtnTaget:(id)sender andBtnTag:(NSInteger)tag{
//    UIView *view = [[UIView alloc] initWithFrame:self.frame];
//    view.backgroundColor = [UIColor whiteColor];
//    view.alpha = 0.4;
//    
//    CGFloat deleteLogoWidth = 40;
//    CGFloat deleteLogoHeight = 40;
//    UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - deleteLogoWidth, self.frame.size.height - deleteLogoHeight, deleteLogoWidth, deleteLogoHeight)];
//    [logoView setImage:[UIImage imageNamed:@"Icon.png"]];
//    [view addSubview:logoView];
//    [logoView release];
//    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn addTarget:sender action:@selector(coverViewClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [btn setTag:tag];
//    [btn setFrame:view.bounds];
//    [view addSubview:btn];
//    
//    [self addSubview:view];
//    [view release];
//}


@end




@implementation UIView (Extend)
/**************************************************************
 ** 功能:     下载的progerssview
 ** 参数:     frame，背景颜色，透明度
 ** 返回:     uiview
 **************************************************************/
+ (UIView*)progressViewWithFrame:(CGRect)frame color:(UIColor*)color alpha:(CGFloat)alpha andText:(NSString*)text{
    UIView *view = [[[UIView alloc] initWithFrame:frame] autorelease];
    view.backgroundColor = color;
    view.alpha = alpha;
    
    CGFloat proWidth = frame.size.width*3/4;
    CGFloat proHeight = 10;
    //add progress  0
    UIProgressView *prov = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    [prov setFrame:CGRectMake((frame.size.width - proWidth)/2, (frame.size.height - proHeight)/3, proWidth, proHeight)];
    [view addSubview:prov];
    [prov release];
    
    CGFloat lableWidth = frame.size.width*3/4;
    CGFloat lableHeight = 20;
    //add lable    1
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake((frame.size.width - lableWidth)/2, prov.frame.origin.y + prov.frame.size.height + 10, lableWidth, lableHeight)];//(frame.size.height - lableHeight)
    lable.text = text;
    lable.backgroundColor = [UIColor clearColor];
    lable.textAlignment = NSTextAlignmentCenter;
    [view addSubview:lable];
    [lable release];
    
    return view;
}

/**************************************************************
 ** 功能:     查勘案件信息展示背景view
 ** 参数:     无
 ** 返回:     无
 **************************************************************/
+ (UIView*)checkBgViewWithNum:(NSInteger)num{
    CGFloat space;
    CGFloat yStart;
    if ([[NSString deviceString] isEqualToString:IPHONE_5]) {
        space = 8;
    yStart = 55;
    }else{
        space = 1;
        yStart = 47;
    }
    CGFloat width = 290;
    CGFloat height = 60;
    UIImageView *imgView = [[[UIImageView alloc] initWithFrame:CGRectMake(15, yStart + num*(space + height), width, height)] autorelease];
    [imgView setImage:[UIImage imageNamed:@"check_info_list_bg_frame.png"]];
    //0
    UILabel *labLine0 = [[UILabel alloc] initWithFrame:CGRectMake(1, 0, 80, 21)];
    labLine0.text = @"_______";
    labLine0.backgroundColor = [UIColor clearColor];
    labLine0.textColor = [UIColor darkGrayColor];
    [imgView addSubview:labLine0];
    [labLine0 release];
    //1
    UILabel*labLine1 = [[UILabel alloc] initWithFrame:CGRectMake(width + 18 - 80, 0, 80, 21)];
    labLine1.text = @"_______";
    labLine1.backgroundColor = [UIColor clearColor];
    labLine1.textColor = [UIColor darkGrayColor];
    [imgView addSubview:labLine1];
    [labLine1 release];
    
    return imgView;
}
@end


@implementation NSObject (Extend)

/**************************************************************
 ** 功能:     协助解析 将object对象转成数组
 ** 参数:     无
 ** 返回:     数组
 **************************************************************/
- (NSArray*)convertToArray{
    if ([self isKindOfClass:[NSArray class]]) {
        return (NSArray*)self;
    }else if ([self isKindOfClass:[NSDictionary class]]){
        NSArray *array = [NSArray arrayWithObject:(NSDictionary*)self];
        return array;
    }else{
        NSArray *array = [NSArray arrayWithObject:self];
        return array;
    }
}

/**************************************************************
 ** 功能:     协助解析 将object对象转成字典
 ** 参数:     无
 ** 返回:     数组
 **************************************************************/
- (NSDictionary*)convertToDict{
    if ([self isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary*)self;
    }else if ([self isKindOfClass:[NSString class]]){
        NSDictionary *dict = [NSDictionary dictionaryWithObject:(NSString*)self forKey:@"a"];
        return dict;
    }else{
        return [NSDictionary dictionaryWithObject:@"" forKey:@""];
    }
}

@end



@implementation UIImage (Extend)

+ (UIImage *)imageNamedNoCache:(NSString *)imageName
{
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSString *filePath = nil;
    if ([imageName hasSuffix:@"png"]) {
        filePath = [NSString stringWithFormat:@"%@/%@", bundlePath, imageName];
    } else {
        filePath = [NSString stringWithFormat:@"%@/%@.png",bundlePath, imageName];
    }
    UIImage *image = [UIImage imageWithContentsOfFile:filePath];
    return image;
}



- (UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}




@end





