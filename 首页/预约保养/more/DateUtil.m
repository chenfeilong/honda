//
//  DateUtil.m
//  HondaEBox
//
//  Created by cloudpower on 14-5-15.
//  Copyright (c) 2014年 cloudPower. All rights reserved.
//

#import "DateUtil.h"

@implementation DateUtil

/**
 *  根据样式获取当天日期
 *
 *  @param formatter 日期样式
 *
 *  @return 返回当天日期字条串
 */
+ (NSString *)getNowDate:(NSString *)formatter
{
    NSDate *date = [NSDate date];
    NSDateFormatter *formater=[[NSDateFormatter alloc] init];
    [formater setDateFormat:formatter];
    //设置当前时区
    NSTimeZone *timezone = [NSTimeZone timeZoneWithName:@"GMT"];
    [formater setTimeZone:timezone];
    NSString *dateStr=[formater stringFromDate:date];
    [formater release];
    return dateStr;
}

/**
 *  将NSDate转换成字符串
 *
 *  @param date      需要转换的字符串
 *  @param formatter 需要转换的样式
 *
 *  @return 转换的结果字符串
 */
+ (NSString *)dateStrWithDate:(NSDate *)date format:(NSString *)format
{
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:format];
    NSString *dateStr = [formater stringFromDate:date];
    [formater release];
    
    return dateStr;
}

/**
 *  根据日期计算三天内的日期时间
 *
 *  @param date 选择的时间
 *
 *  @return 日期时间数组
 */
+ (id)getDatesWithinThreeDays:(NSDate *)date
{
    NSDate *nowDate = date;        //当前选择时间
    
    NSMutableArray *days = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
    int count = 3;                   //3天内
    for (int i = 0; i < count; i++)
    {
        NSTimeInterval timeInterval = 24 * 60 * 60 * i;
        NSDate *dateTemp = [nowDate dateByAddingTimeInterval:timeInterval];
        [days addObject:dateTemp];
    }
    
    return days;
}

/**
 *  获取星期
 *
 *  @param date 当前日期
 *
 *  @return 星期
 */
+ (NSString *)weekDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger unitFlags = NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit | NSWeekdayCalendarUnit;
    NSDateComponents *components = [calendar components:unitFlags fromDate:date];
    NSString *weekDay = @"";
    NSInteger dayInt = 0;
    switch ([components weekday])
    {
        case 1:
            weekDay = @"星期日";
            dayInt = 1;
            break;
        case 2:
            weekDay = @"星期一";
            dayInt = 2;
            break;
        case 3:
            weekDay = @"星期二";
            dayInt = 3;
            break;
        case 4:
            weekDay = @"星期三";
            dayInt = 4;
            break;
        case 5:
            weekDay = @"星期四";
            dayInt = 5;
            break;
        case 6:
            weekDay = @"星期五";
            dayInt = 6;
            break;
        case 7:
            weekDay = @"星期六";
            dayInt = 7;
            break;
            
        default:
            break;
    }
    
    return weekDay;
}

/**
 *  获取月份
 *
 *  @param date 当前选择日期
 *
 *  @return 月份(NSIntger)
 */
+ (NSInteger)getMonthWithDate:(NSDate *)date
{
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekdayCalendarUnit | NSDayCalendarUnit;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSInteger month = comps.month;
    return month;
}

/**
 *  获取Day
 *
 *  @param date 当前选择日期
 *
 *  @return Day
 */
+ (NSInteger)getDayWithDate:(NSDate *)date
{
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekdayCalendarUnit | NSDayCalendarUnit;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSInteger day = comps.day;
    return day;
}

@end
