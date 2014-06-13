//
//  CHTabBarItem.m
//  weibo
//
//  Created by apple on 13-8-15.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#define kTextSize 10
#define kPadding 5
#import "CHTabBarItem.h"

@interface CHTabBarItem (){
    CGSize _imageSize; //图标的大小

}

@end

@implementation CHTabBarItem

#pragma mark -生命周期方法
-(id)initWithFrame:(CGRect)frame andDesc:(CHTabBarItemDesc *)desc{
    self = [super initWithFrame:frame];
    if (self) {
        
        //设置按钮背景图片
        //高亮状态下显示背景图片
//        [self setBackgroundImage:[UIImage imageNamed:@"tabbar_slider.png"] forState:UIControlStateHighlighted];
        
        //选择时,背景图片消失
//        [self setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
//        self.selected = YES;
        
        //设置内部图片
        UIImage *normal = [UIImage imageNamed:desc.normal];
        _imageSize = normal.size;
        //在高亮状态下,不要调整内部图片的颜色
        self.adjustsImageWhenHighlighted = NO;
        [self setImage:normal forState:UIControlStateNormal];
        //设置按钮被选中时的内部图片
        UIImage *highlighted = [UIImage imageNamed:desc.highlighted];
        [self setImage:highlighted forState:UIControlStateSelected];
        
        //设置文字
        //设置粗细
        self.titleLabel.font = [UIFont systemFontOfSize:kTextSize];
        //设置内容位置
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [self setTitle:desc.title forState:UIControlStateNormal];
        
        
        
    }
    return self;

}

#pragma mark - 重写父类的方法
#pragma mark 用来决定按钮文字的frame

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
   
    CGFloat titleWidth = contentRect.size.width;
    CGFloat titleHeight = kTextSize;
    CGFloat titleX;
    CGFloat titleY = contentRect.size.height - titleHeight-2;
    
    if (self.tag == 0) {
        
        titleX = -27;
       
    }
   
    if (self.tag == 2) {
        titleX = 27;
        
    }

    
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
}

#pragma mark 用来决定按钮内部图片的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect{

    CGFloat imageX;
    CGFloat imageY;
    if (self.tag == 0) {
      
        imageX = 10;
        imageY = 5;
    }
    if (self.tag == 1) {
        imageX = 30;
        imageY = 5;
    }
    if (self.tag == 2) {
        imageX = 70;
        imageY = 5;
    }
    
    return  CGRectMake(imageX, imageY, _imageSize.width*0.5, _imageSize.height*0.5);
}

#pragma mark 改变选中状态
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    self.userInteractionEnabled = !selected;

}

@end

@implementation CHTabBarItemDesc

- (void)dealloc
{
    [_highlighted release];
    [_normal release];
    [_title release];
    [super dealloc];
}
@end