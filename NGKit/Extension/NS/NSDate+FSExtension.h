//
//  NSDate+FSExtension.h
//  Pods
//
//  Created by Wenchao Ding on 29/1/15.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (NGFSExtension)

@property (readonly, nonatomic) NSInteger ng_fs_year;
@property (readonly, nonatomic) NSInteger ng_fs_month;
@property (readonly, nonatomic) NSInteger ng_fs_day;
@property (readonly, nonatomic) NSInteger ng_fs_weekday;
@property (readonly, nonatomic) NSInteger ng_fs_weekOfYear;
@property (readonly, nonatomic) NSInteger ng_fs_hour;
@property (readonly, nonatomic) NSInteger ng_fs_minute;
@property (readonly, nonatomic) NSInteger ng_fs_second;

@property (readonly, nonatomic) NSDate *ng_fs_dateByIgnoringTimeComponents;
@property (readonly, nonatomic) NSDate *ng_fs_firstDayOfMonth;
@property (readonly, nonatomic) NSDate *ng_fs_lastDayOfMonth;
@property (readonly, nonatomic) NSDate *ng_fs_firstDayOfWeek;
@property (readonly, nonatomic) NSDate *ng_fs_middleOfWeek;
@property (readonly, nonatomic) NSDate *ng_fs_tomorrow;
@property (readonly, nonatomic) NSDate *ng_fs_yesterday;
@property (readonly, nonatomic) NSInteger ng_fs_numberOfDaysInMonth;

+ (instancetype)ng_fs_dateFromString:(NSString *)string format:(NSString *)format;
+ (instancetype)ng_fs_dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

- (NSDate *)ng_fs_dateByAddingYears:(NSInteger)years;
- (NSDate *)ng_fs_dateBySubtractingYears:(NSInteger)years;
- (NSDate *)ng_fs_dateByAddingMonths:(NSInteger)months;
- (NSDate *)ng_fs_dateBySubtractingMonths:(NSInteger)months;
- (NSDate *)ng_fs_dateByAddingWeeks:(NSInteger)weeks;
- (NSDate *)ng_fs_dateBySubtractingWeeks:(NSInteger)weeks;
- (NSDate *)ng_fs_dateByAddingDays:(NSInteger)days;
- (NSDate *)ng_fs_dateBySubtractingDays:(NSInteger)days;
- (NSInteger)ng_fs_yearsFrom:(NSDate *)date;
- (NSInteger)ng_fs_monthsFrom:(NSDate *)date;
- (NSInteger)ng_fs_weeksFrom:(NSDate *)date;
- (NSInteger)ng_fs_daysFrom:(NSDate *)date;

- (BOOL)ng_fs_isEqualToDateForMonth:(NSDate *)date;
- (BOOL)ng_fs_isEqualToDateForWeek:(NSDate *)date;
- (BOOL)ng_fs_isEqualToDateForDay:(NSDate *)date;

- (NSString *)ng_fs_stringWithFormat:(NSString *)format;
- (NSString *)ng_fs_string;

@end


@interface NSCalendar (FSExtension)

+ (instancetype)ng_fs_sharedCalendar;

@end

@interface NSDateFormatter (FSExtension)

+ (instancetype)ng_fs_sharedDateFormatter;

@end

@interface NSDateComponents (FSExtension)

+ (instancetype)ng_fs_sharedDateComponents;

@end



