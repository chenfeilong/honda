//
//  CHTabBarItem.h
//  weibo
//
//  Created by apple on 13-8-15.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CHTabBarItemDesc : NSObject

@property (nonatomic, copy)NSString *title;//标签的文字
@property (nonatomic, copy)NSString *normal;//标签默认图标
@property (nonatomic, copy)NSString *highlighted;//标签的高亮图标

@end

@interface CHTabBarItem : UIButton

-(id)initWithFrame:(CGRect)frame andDesc:(CHTabBarItemDesc *)desc;

@end
