//
//  TimeWithNSDate.m
//  TourWay
//
//  Created by WuTongAlvin on 12/26/15.
//  Copyright © 2015 OneThousandandOneNights. All rights reserved.
//



#import "TimeWithNSDate.h"

@implementation TimeWithNSDate

/**
 显示时分的方法
 */
+(NSString *)OclockWithDateFormatterStr:(NSString *)timeStr{
    
    //转化成时间戳
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate* date = [formatter dateFromString:timeStr];
    //时间戳转时间的方法
    NSDateFormatter *currentFormatter=[[NSDateFormatter alloc]init];
    [currentFormatter setDateFormat:@"HH:mm"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[date timeIntervalSince1970]];
    NSString *confromTimespStr = [currentFormatter stringFromDate:confromTimesp];

    return confromTimespStr;
}

/**
 显示星期的方法
 */
+(NSString *)WeekWithDateFormatterStr:(NSString *)timeStr{
    
    //转化成时间戳
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate* date = [formatter dateFromString:timeStr];
    
    //时间戳转时间的方法
    NSDateFormatter *currentFormatter=[[NSDateFormatter alloc]init];
    [currentFormatter setDateFormat:@"MM-d EEEE "];//@"EEEE MMMM d, YYYY"  星期，月份，日期，年份  （Tuesday December 22, 2015）
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[date timeIntervalSince1970]];
    NSString *confromTimespStr = [currentFormatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
}

/**
 显示月日的方法
 */
+(NSString *)MonthWithDateFormatterStr:(NSString *)timeStr{
    
    //转化成时间戳
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate* date = [formatter dateFromString:timeStr];
    
    //时间戳转时间的方法
    NSDateFormatter *currentFormatter=[[NSDateFormatter alloc]init];
    [currentFormatter setDateFormat:@"MM-dd"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[date timeIntervalSince1970]];
    NSString *confromTimespStr = [currentFormatter stringFromDate:confromTimesp];

    return confromTimespStr;
}
/**
 显示年月日的方法
 */
+(NSString *)YearWithDateFormatterStr:(NSString *)timeStr{
    
    //转化成时间戳
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate* date = [formatter dateFromString:timeStr];
    
    //时间戳转时间的方法
    NSDateFormatter *currentFormatter=[[NSDateFormatter alloc]init];
    [currentFormatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[date timeIntervalSince1970]];
    NSString *confromTimespStr = [currentFormatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
}

/**
 按既定规则自动选择显示格式的方法
 */
+(NSString *)AutoDateWthFormatterStr:(NSString *)timeStr{
    
    /*
     交流类时间显示（参考微信）：
     1﹜	当天的显示时间到分 如：xx：xx
     2﹜	昨天的内容显示到分 如：昨天 12:34
     3﹜	本周的显示到具体周几和几点几分 如：星期三 12:34
     4﹜	跨月及以上的显示年月日 如：xx-xx-xx
     5﹜	有重合关系优先级从上至下
     */
    
    /*
     代码判断顺序
     是否是今天
        一小时内  “HH:mm:ss”（时:分:秒）
        一小时之后  “HH:mm”（时:分）
     是否是本月
        是否是昨天  “昨天 HH:mm”（昨天 时:分）
        是否是本星期   “EEEE HH:mm”(星期几 时:分)
        是本月，不是昨天也不是本星期  “MM-dd”（月:日）
     是否是本年
        是本年度   “yy-MM-dd”（年:月:日）
        不是本年   “yy-MM-dd”（年:月:日）
     */
    
    
    /*
     2016-02-24新规则
     是今天   时分秒
     是今年   月日时分
     不是今年 年月日时分
     */
    
    
    NSDate *currentDate = [NSDate date];//当前的系统时间
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];//设置需要被识别的时间格式
    NSDate *date = [formatter dateFromString:timeStr];//将获取到的时间转化成NSDate
    
    NSString *displayDate=[self YearWithDateFormatterStr:timeStr];//需要展示的时间字符串
    
    NSDateFormatter *yearFomatter=[[NSDateFormatter alloc]init];
    [yearFomatter setDateFormat:@"YYYY"];
    
    NSDateFormatter *monthFormatter=[[NSDateFormatter alloc]init];
    [monthFormatter setDateFormat:@"YYYY-MM"];
    
    NSDateFormatter *todayFormatter=[[NSDateFormatter alloc]init];
    [todayFormatter setDateFormat:@"YYYY-MM-dd"];
    
    NSDateFormatter *yestodayFormatter=[[NSDateFormatter alloc]init];
    [yestodayFormatter setDateFormat:@"dd"];
    
    
    //如果是今天（年月日相等）*******************************************************************************
    if ([[todayFormatter stringFromDate:date]isEqualToString:[todayFormatter stringFromDate:currentDate]]) {
        NSTimeInterval differenceCount=[currentDate timeIntervalSince1970]-[date timeIntervalSince1970];//获取到的时间戳与现在的时间戳的差值
        NSTimeInterval OneHourCount=(double)60*60;//一个小时的时间戳差值
        if (differenceCount<OneHourCount) {
            NSDateFormatter *displayFormatter=[[NSDateFormatter alloc]init];
            [displayFormatter setDateFormat:@"HH:mm:ss"];
            displayDate=[displayFormatter stringFromDate:date];
        }else{
            NSDateFormatter *displayFormatter=[[NSDateFormatter alloc]init];
            [displayFormatter setDateFormat:@"HH:mm:ss"];
            displayDate=[displayFormatter stringFromDate:date];
        }
    }
    //如果是本月 (年月相等) *******************************************************************************
   else if ([[monthFormatter stringFromDate:date]isEqualToString:[monthFormatter stringFromDate:currentDate]]){
        //获取时间戳
        NSTimeInterval differenceCount=[currentDate timeIntervalSince1970]-[date timeIntervalSince1970];//获取到的时间戳与现在的时间戳的差值
        NSTimeInterval OneWeekCount=(double)7*24*60*60;//一个星期的时间戳差值
        //获取日期
        NSDateFormatter *dayFormatter=[[NSDateFormatter alloc]init];
        [dayFormatter setDateFormat:@"dd"];
        NSString *dateDayStr=[dayFormatter stringFromDate:date];//获取到的日期
        NSString *currentDataDayStr=[dayFormatter stringFromDate:currentDate];//今天的日期
        if ([dateDayStr intValue]+1==[currentDataDayStr intValue]) {//如果获取到的日期加1等于今天的日期（昨天）
            NSDateFormatter *displayFormatter=[[NSDateFormatter alloc]init];
            [displayFormatter setDateFormat:@"MM-dd HH:mm"];
//            displayDate=[NSString stringWithFormat:@"昨天 %@",[displayFormatter stringFromDate:date]];
            displayDate=[NSString stringWithFormat:@"%@",[displayFormatter stringFromDate:date]];

        }else if (differenceCount<OneWeekCount) {//如果获取到的时间戳和现在的时间戳相差一个星期
            //获取到的时间的星期
            NSDateComponents *Componets = [[NSCalendar autoupdatingCurrentCalendar] components:NSCalendarUnitWeekday fromDate:date];
            NSInteger DateWeekday = [Componets weekday];//a就是星期几，1代表星期日，2代表星期一，后面依次
            //今天的星期
            NSDateComponents *CurrentComponets = [[NSCalendar autoupdatingCurrentCalendar] components:NSCalendarUnitWeekday fromDate:currentDate];
            NSInteger CurrentDateWeekday = [CurrentComponets weekday];//a就是星期几，1代表星期日，2代表星期一，后面依次
            if (DateWeekday<CurrentDateWeekday) {//如果是本周
                NSDateFormatter *weekDateFormatter=[[NSDateFormatter alloc]init];
//                [weekDateFormatter setDateFormat:@"EEEE HH:mm"];
                [weekDateFormatter setDateFormat:@"MM-dd HH:mm"];
                displayDate=[weekDateFormatter stringFromDate:date];
            }else{//如果不是本周
                NSDateFormatter *month_dayDateFormatter=[[NSDateFormatter alloc]init];
                [month_dayDateFormatter setDateFormat:@"MM-dd HH:mm"];
                displayDate=[month_dayDateFormatter stringFromDate:date];
            }
        }else{
            NSDateFormatter *month_dayDateFormatter=[[NSDateFormatter alloc]init];
            [month_dayDateFormatter setDateFormat:@"MM-dd HH:mm"];
            displayDate=[month_dayDateFormatter stringFromDate:date];

        }
    }
   //如果是今年 （年相等）*******************************************************************************
   else if ([[yearFomatter stringFromDate:date]isEqualToString:[yearFomatter stringFromDate:currentDate]]){
       NSDateFormatter *month_dayDateFormatter=[[NSDateFormatter alloc]init];
       [month_dayDateFormatter setDateFormat:@"MM-dd HH:mm"];
       displayDate=[month_dayDateFormatter stringFromDate:date];
    }
    //如果不是今年  *******************************************************************************
   else{
       NSDateFormatter *month_dayDateFormatter=[[NSDateFormatter alloc]init];
       [month_dayDateFormatter setDateFormat:@"yyyy-MM-dd"];
       displayDate=[month_dayDateFormatter stringFromDate:date];
   }
    return displayDate;
}

@end