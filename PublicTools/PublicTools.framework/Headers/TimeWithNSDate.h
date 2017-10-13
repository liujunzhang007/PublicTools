//
//  TimeWithNSDate.h
//  TourWay
//
//  Created by WuTongAlvin on 12/26/15.
//  Copyright © 2015 OneThousandandOneNights. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeWithNSDate : NSObject

/**
 显示时分的方法
 */
+(NSString *)OclockWithDateFormatterStr:(NSString *)timeStr;

/**
 显示星期的方法
 */
+(NSString *)WeekWithDateFormatterStr:(NSString *)timeStr;

/**
 显示年月日的方法
 */
+(NSString *)MonthWithDateFormatterStr:(NSString *)timeStr;

+(NSString *)YearWithDateFormatterStr:(NSString *)timeStr;

/**
 按既定规则自动选择显示格式的方法
 */
+(NSString *)AutoDateWthFormatterStr:(NSString *)timeStr;



@end
