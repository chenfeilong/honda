//
//  DateUtil.h
//  HondaEBox
//
//  Created by cloudpower on 14-5-15.
//  Copyright (c) 2014年 cloudPower. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtil : NSObject

/**
 *  根据样式获取当天日期
 *
 *  @param formatter 日期样式
 *
 *  @return 返回当天日期字条串
 */
+ (NSString *)getNowDate:(NSString *)formatter;

/**
 *  将NSDate转换成字符串
 *
 *  @param date      需要转换的字符串
 *  @param format 需要转换的样式
 *
 *  @return 转换的结果字符串
 */
+ (NSString *)dateStrWithDate:(NSDate *)date format:(NSString *)format;

/**
 *  根据日期计算三天内的日期时间
 *
 *  @param date 选择的时间
 *
 *  @return 三天之内的日期时间集合
 */
+ (id)getDatesWithinThreeDays:(NSDate *)date;

/**
 *  获取星期
 *
 *  @param date 当前选择日期
 *
 *  @return 星期
 */
+ (NSString *)weekDate:(NSDate *)date;

/**
 *  获取月份
 *
 *  @param date 当前选择日期
 *
 *  @return 月份
 */
+ (NSInteger)getMonthWithDate:(NSDate *)date;

/**
 *  获取Day
 *
 *  @param date 当前选择日期
 *
 *  @return Day
 */
+ (NSInteger)getDayWithDate:(NSDate *)date;

@end
