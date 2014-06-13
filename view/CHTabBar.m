//
//  CHTabBar.m
//  weibo
//
//  Created by apple on 13-8-15.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "CHTabBar.h"
#import "CHTabBarItem.h"

@implementation CHTabBar



#pragma mark 监听tabBarItem的点击
-(void)tabBarItemClick:(CHTabBarItem *)tabBarItem{

    tabBarItem.selected =YES;
    
    if (currentSelectedItem !=tabBarItem){
        currentSelectedItem.selected = NO;
    }
    
    //通知代理选中的标签位置改变
    //判断代理是否已经遵守协议
    if ([self.delegate respondsToSelector:@selector(tabChangeFrom:to:)]) {
        [self.delegate tabChangeFrom:currentSelectedItem.tag to:tabBarItem.tag];
    }
    
    
   currentSelectedItem = tabBarItem;

}
int a;

- (id)initWithFrame:(CGRect)frame items:(NSArray *)items
{
    self = [super initWithFrame:frame];
    if (self) {
        //根据图片 平铺成一种"背景颜色"
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"底部1"]];

        
        for (int i=0; i<items.count; i++) {
            
            CGRect frame = CGRectMake(i*self.bounds.size.width/3, 0, self.bounds.size.width/3, self.bounds.size.height);
            
            CHTabBarItem *tabBarItem = [[CHTabBarItem alloc]initWithFrame:frame andDesc:items[i]];
            [tabBarItem addTarget:self action:@selector(tabBarItemClick:) forControlEvents:UIControlEventTouchUpInside];
            tabBarItem.tag = i;
            
            [self addSubview:tabBarItem];
        }
        
        
    }
    return self;
}

#pragma mark -公共方法
-(int)selectedIndex{
    if (!currentSelectedItem) return -1;
        
    return currentSelectedItem.tag;

}

-(void)setSelectedIndex:(int)selectedIndex{
    
    if (selectedIndex<0 || selectedIndex>=self.subviews.count) {
        return;
    }
    
    if (self.selectedIndex==selectedIndex) return;
     
   CHTabBarItem *item =  [self.subviews objectAtIndex:selectedIndex];
    item.selected =YES;
    
    if (currentSelectedItem !=item){
        currentSelectedItem.selected = NO;
    }
    
    currentSelectedItem = item;
}
@end
