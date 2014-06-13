//
//  CHTabBar.h
//  weibo
//
//  Created by apple on 13-8-15.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHTabBarItem.h"

@protocol CHTabBarDelegate <NSObject>

-(void)tabChangeFrom:(NSUInteger)from to:(NSUInteger)to;

@end

@interface CHTabBar : UIView
{
    CHTabBarItem *currentSelectedItem;
}

//items里面存放着CHTabBarItemDesc 对象
-(id)initWithFrame:(CGRect)frame items:(NSArray *)items;

@property (nonatomic, assign) id<CHTabBarDelegate> delegate;
@property (nonatomic, assign) int selectedIndex;
@end

