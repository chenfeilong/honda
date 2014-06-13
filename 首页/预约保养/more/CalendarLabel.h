//
//  CalendarLabel.h
//  eBox
//
//  Created by cloudpower on 14-5-2.
//  Copyright (c) 2014年 cloudpower. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateUtil.h"

@interface CalendarLabel : UILabel

@property (nonatomic, strong) UILabel *weekDayLabel;
@property (nonatomic, strong) UILabel *monthLabel;
@property (nonatomic, strong) UILabel *dayLabel;

- (id)initWithFrame:(CGRect)frame date:(NSDate *)date;

@end
