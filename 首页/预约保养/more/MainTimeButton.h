//
//  MainTimeButton.h
//  HondaEBox
//
//  Created by cloudpower on 14-5-16.
//  Copyright (c) 2014年 cloudPower. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Define.h"

//typedef struct _MainTime {
//    NSInteger row;
//    NSInteger index;
//} MainTime;

struct MainTime {
    NSInteger row;
    NSInteger index;
};
typedef struct MainTime MainTime;

@interface MainTimeButton : UIButton

@property (nonatomic) MainTime time;

@end
