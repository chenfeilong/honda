//
//  CalendarLabel.m
//  eBox
//
//  Created by cloudpower on 14-5-2.
//  Copyright (c) 2014年 cloudpower. All rights reserved.
//

#import "CalendarLabel.h"

@implementation CalendarLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        [self initCalendarLabel];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame date:(NSDate *)date
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initCalendarLabel:date];
    }
    
    return self;
}

- (void)initCalendarLabel:(NSDate *)date
{
    CGRect frame = self.frame;
    
    UILabel *weekDay = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, frame.size.width, frame.size.height / 2 - 5)];
    weekDay.font = [UIFont fontWithName:@"Arial" size:12.f];
    weekDay.text = [DateUtil weekDate:date];
    self.weekDayLabel = weekDay;
    [self addSubview:self.weekDayLabel];
    
    UILabel *month = [[UILabel alloc] initWithFrame:CGRectMake(5, frame.size.height / 2, frame.size.width / 2 - 5, frame.size.height / 2 - 5)];
    month.font = [UIFont fontWithName:@"Arial" size:11.f];
    month.text = [NSString stringWithFormat:@"%d月",[DateUtil getMonthWithDate:date]];
    self.monthLabel = month;
    [self addSubview:self.monthLabel];
    
    UILabel *day = [[UILabel alloc] initWithFrame:CGRectMake( 5 + frame.size.width / 2, frame.size.height / 2, frame.size.width / 2 - 5,frame.size.height / 2 - 5)];
    day.font = [UIFont fontWithName:@"Arial" size:17.f];
    day.textAlignment = NSTextAlignmentCenter;
    day.text = [NSString stringWithFormat:@"%d",[DateUtil getDayWithDate:date]];
    self.dayLabel = day;
    [self addSubview:self.dayLabel];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
