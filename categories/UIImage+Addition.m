//
//  UIImage+Addition.m
//  my_weibo
//
//  Created by apple on 13-8-15.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "UIImage+Addition.h"

@implementation UIImage (Addition)

+(UIImage *)stretchImage:(NSString*)name{
    UIImage *temp = [UIImage imageNamed:name];
    return [temp stretchableImageWithLeftCapWidth:temp.size.width *0.5f topCapHeight:temp.size.height * 0.5f];

}
@end
