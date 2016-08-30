//
//  NSDate+FSExtension.m
//  Pods
//
//  Created by Wenchao Ding on 29/1/15.
//
//

#import "NSDate+FSExtension.h"

@implementation NSDate (NGFSExtension)

- (NSInteger)ng_fs_year
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitYear fromDate:self];
    return component.year;
}

- (NSInteger)ng_fs_month
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitMonth
                                              fromDate:self];
    return component.month;
}

- (NSInteger)ng_fs_day
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitDay
                                              fromDate:self];
    return component.day;
}

- (NSInteger)ng_fs_weekday
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitWeekday fromDate:self];
    return component.weekday;
}

- (NSInteger)ng_fs_weekOfYear
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitWeekOfYear fromDate:self];
    return component.weekOfYear;
}

- (NSInteger)ng_fs_hour
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitHour
                                              fromDate:self];
    return component.hour;
}

- (NSInteger)ng_fs_minute
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitMinute
                                              fromDate:self];
    return component.minute;
}

- (NSInteger)ng_fs_second
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitSecond
                                              fromDate:self];
    return component.second;
}

- (NSDate *)ng_fs_dateByIgnoringTimeComponents
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    return [calendar dateFromComponents:components];
}

- (NSDate *)ng_fs_firstDayOfMonth
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth| NSCalendarUnitDay fromDate:self];
    components.day = 1;
    return [calendar dateFromComponents:components];
}

- (NSDate *)ng_fs_lastDayOfMonth
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    components.month++;
    components.day = 0;
    return [calendar dateFromComponents:components];
}

- (NSDate *)ng_fs_firstDayOfWeek
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *weekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:self];
    NSDateComponents *componentsToSubtract = [NSDateComponents ng_fs_sharedDateComponents];
    componentsToSubtract.day = - (weekdayComponents.weekday - calendar.firstWeekday);
    NSDate *beginningOfWeek = [calendar dateByAddingComponents:componentsToSubtract toDate:self options:0];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:beginningOfWeek];
    beginningOfWeek = [calendar dateFromComponents:components];
    componentsToSubtract.day = NSIntegerMax;
    return beginningOfWeek;
}

- (NSDate *)ng_fs_middleOfWeek
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *weekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:self];
    NSDateComponents *componentsToSubtract = [NSDateComponents ng_fs_sharedDateComponents];
    componentsToSubtract.day = - (weekdayComponents.weekday - calendar.firstWeekday) + 3;
    NSDate *middleOfWeek = [calendar dateByAddingComponents:componentsToSubtract toDate:self options:0];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:middleOfWeek];
    middleOfWeek = [calendar dateFromComponents:components];
    componentsToSubtract.day = NSIntegerMax;
    return middleOfWeek;
}

- (NSDate *)ng_fs_tomorrow
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    components.day++;
    return [calendar dateFromComponents:components];
}

- (NSDate *)ng_fs_yesterday
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    components.day--;
    return [calendar dateFromComponents:components];
}

- (NSInteger)ng_fs_numberOfDaysInMonth
{
    NSCalendar *c = [NSCalendar ng_fs_sharedCalendar];
    NSRange days = [c rangeOfUnit:NSCalendarUnitDay
                           inUnit:NSCalendarUnitMonth
                          forDate:self];
    return days.length;
}

+ (instancetype)ng_fs_dateFromString:(NSString *)string format:(NSString *)format
{
    NSDateFormatter *formatter = [NSDateFormatter ng_fs_sharedDateFormatter];
    formatter.dateFormat = format;
    return [formatter dateFromString:string];
}

+ (instancetype)ng_fs_dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *components = [NSDateComponents ng_fs_sharedDateComponents];
    components.year = year;
    components.month = month;
    components.day = day;
    NSDate *date = [calendar dateFromComponents:components];
    components.year = NSIntegerMax;
    components.month = NSIntegerMax;
    components.day = NSIntegerMax;
    return date;
}

- (NSDate *)ng_fs_dateByAddingYears:(NSInteger)years
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *components = [NSDateComponents ng_fs_sharedDateComponents];
    components.year = years;
    NSDate *date = [calendar dateByAddingComponents:components toDate:self options:0];
    components.year = NSIntegerMax;
    return date;
}

- (NSDate *)ng_fs_dateBySubtractingYears:(NSInteger)years
{
    return [self ng_fs_dateByAddingYears:-years];
}

- (NSDate *)ng_fs_dateByAddingMonths:(NSInteger)months
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *components = [NSDateComponents ng_fs_sharedDateComponents];
    components.month = months;
    NSDate *date = [calendar dateByAddingComponents:components toDate:self options:0];
    components.month = NSIntegerMax;
    return date;
}

- (NSDate *)ng_fs_dateBySubtractingMonths:(NSInteger)months
{
    return [self ng_fs_dateByAddingMonths:-months];
}

- (NSDate *)ng_fs_dateByAddingWeeks:(NSInteger)weeks
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *components = [NSDateComponents ng_fs_sharedDateComponents];
    components.weekOfYear = weeks;
    NSDate *date = [calendar dateByAddingComponents:components toDate:self options:0];
    components.weekOfYear = NSIntegerMax;
    return date;
}

-(NSDate *)ng_fs_dateBySubtractingWeeks:(NSInteger)weeks
{
    return [self ng_fs_dateByAddingWeeks:-weeks];
}

- (NSDate *)ng_fs_dateByAddingDays:(NSInteger)days
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *components = [NSDateComponents ng_fs_sharedDateComponents];
    components.day = days;
    NSDate *date = [calendar dateByAddingComponents:components toDate:self options:0];
    components.day = NSIntegerMax;
    return date;
}

- (NSDate *)ng_fs_dateBySubtractingDays:(NSInteger)days
{
    return [self ng_fs_dateByAddingDays:-days];
}

- (NSInteger)ng_fs_yearsFrom:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear
                                               fromDate:date
                                                 toDate:self
                                                options:0];
    return components.year;
}

- (NSInteger)ng_fs_monthsFrom:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitMonth
                                               fromDate:date
                                                 toDate:self
                                                    options:0];
    return components.month;
}

- (NSInteger)ng_fs_weeksFrom:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekOfYear
                                               fromDate:date
                                                 toDate:self
                                                options:0];
    return components.weekOfYear;
}

- (NSInteger)ng_fs_daysFrom:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar ng_fs_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitDay
                                               fromDate:date
                                                 toDate:self
                                                options:0];
    return components.day;
}

- (NSString *)ng_fs_stringWithFormat:(NSString *)format
{
    NSDateFormatter *formatter = [NSDateFormatter ng_fs_sharedDateFormatter];
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

- (NSString *)ng_fs_string
{
    return [self ng_fs_stringWithFormat:@"yyyyMMdd"];
}


- (BOOL)ng_fs_isEqualToDateForMonth:(NSDate *)date
{
    return self.ng_fs_year == date.ng_fs_year && self.ng_fs_month == date.ng_fs_month;
}

- (BOOL)ng_fs_isEqualToDateForWeek:(NSDate *)date
{
    return self.ng_fs_year == date.ng_fs_year && self.ng_fs_weekOfYear == date.ng_fs_weekOfYear;
}

- (BOOL)ng_fs_isEqualToDateForDay:(NSDate *)date
{
    return self.ng_fs_year == date.ng_fs_year && self.ng_fs_month == date.ng_fs_month && self.ng_fs_day == date.ng_fs_day;
}

@end


@implementation NSCalendar (FSExtension)

+ (instancetype)ng_fs_sharedCalendar
{
    static id instance;
    static dispatch_once_t ng_fs_sharedCalendar_onceToken;
    dispatch_once(&ng_fs_sharedCalendar_onceToken, ^{
        instance = [NSCalendar currentCalendar];
    });
    return instance;
}

@end


@implementation NSDateFormatter (FSExtension)

+ (instancetype)ng_fs_sharedDateFormatter
{
    static id instance;
    static dispatch_once_t ng_fs_sharedDateFormatter_onceToken;
    dispatch_once(&ng_fs_sharedDateFormatter_onceToken, ^{
        instance = [[NSDateFormatter alloc] init];
    });
    return instance;
}

@end

@implementation NSDateComponents (FSExtension)

+ (instancetype)ng_fs_sharedDateComponents
{
    static id instance;
    static dispatch_once_t ng_fs_sharedDateFormatter_onceToken;
    dispatch_once(&ng_fs_sharedDateFormatter_onceToken, ^{
        instance = [[NSDateComponents alloc] init];
    });
    return instance;
}

@end


