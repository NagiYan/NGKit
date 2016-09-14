//
//  NSDate+NGFS.swift
//  NGKit
//
//  Created by westonnaki on 16/9/14.
//  Copyright © 2016年 ARIA. All rights reserved.
//

import Foundation


public extension Calendar
{
    static func ng_fs_sharedCalendar() -> Calendar
    {
        struct StaticP
        {
            static let instance = Calendar.current
        }
        return StaticP.instance
    }
}

public extension DateFormatter
{
    static func ng_fs_sharedDateFormatter() -> DateFormatter
    {
        struct StaticP
        {
            static let instance = DateFormatter()
        }
        return StaticP.instance
    }
}

public extension DateComponents
{
    static func ng_fs_sharedDateComponents() -> DateComponents
    {
        struct StaticP
        {
            static let instance = DateComponents()
        }
        return StaticP.instance
    }
}

public extension Date
{
    // MARK: part
    public var ng_fs_year:Int
    {
        return Calendar.ng_fs_sharedCalendar().component(.year, from: self)
    }
    
    public var ng_fs_day:Int
    {
        return Calendar.ng_fs_sharedCalendar().component(.day, from: self)
    }
    
    public var ng_fs_month:Int
    {
        return Calendar.ng_fs_sharedCalendar().component(.month, from: self)
    }
    
    public var ng_fs_weekday:Int
    {
        return Calendar.ng_fs_sharedCalendar().component(.weekday, from: self)
    }
    
    public var ng_fs_weekOfYear:Int
    {
        return Calendar.ng_fs_sharedCalendar().component(.weekOfYear, from: self)
    }
    
    public var ng_fs_hour:Int
    {
        return Calendar.ng_fs_sharedCalendar().component(.hour, from: self)
    }
    
    public var ng_fs_minute:Int
    {
        return Calendar.ng_fs_sharedCalendar().component(.minute, from: self)
    }
    
    public var ng_fs_second:Int
    {
        return Calendar.ng_fs_sharedCalendar().component(.second, from: self)
    }
    
    // MARK:
    func ng_fs_dateByIgnoringTimeComponents() -> Date
    {
        let calendar = Calendar.ng_fs_sharedCalendar()
        let components = calendar.dateComponents([.year, .month, .day], from: self)
        return calendar.date(from: components)!
    }
    
    func ng_fs_firstDayOfMonth() -> Date
    {
        let calendar = Calendar.ng_fs_sharedCalendar()
        var components = calendar.dateComponents([.year, .month, .day], from: self)
        components.day = 1
        return calendar.date(from: components)!
    }
    
    func ng_fs_lastDayOfMonth() -> Date
    {
        let calendar = Calendar.ng_fs_sharedCalendar()
        var components = calendar.dateComponents([.year, .month, .day], from: self)
        components.month = components.month! + 1
        components.day = 0
        return calendar.date(from: components)!
    }
    
    func ng_fs_firstDayOfWeek() -> Date
    {
        let calendar = Calendar.ng_fs_sharedCalendar()
        let weekdayComponents = calendar.dateComponents([.weekday], from: self)
        var componentsToSubtract = DateComponents.ng_fs_sharedDateComponents()
        componentsToSubtract.day = -(weekdayComponents.weekday! - calendar.firstWeekday)
        var beginningOfWeek = calendar.date(byAdding: componentsToSubtract, to: self)
        let components = calendar.dateComponents([.year, .month, .day], from: beginningOfWeek!)
        beginningOfWeek = calendar.date(from: components)
        componentsToSubtract.day = NSIntegerMax;
        return beginningOfWeek!
     }

    func ng_fs_middleOfWeek() -> Date
    {
        let calendar = Calendar.ng_fs_sharedCalendar()
        let weekdayComponents = calendar.dateComponents([.weekday], from: self)
        var componentsToSubtract = DateComponents.ng_fs_sharedDateComponents()
        componentsToSubtract.day = -(weekdayComponents.weekday! - calendar.firstWeekday) + 3
        var middleOfWeek = calendar.date(byAdding: componentsToSubtract, to: self)
        let components = calendar.dateComponents([.year, .month, .day], from: middleOfWeek!)
        middleOfWeek = calendar.date(from: components)
        componentsToSubtract.day = NSIntegerMax;
        return middleOfWeek!
    }
    
    func ng_fs_tomorrow() -> Date
    {
        let calendar = Calendar.ng_fs_sharedCalendar()
        var components = calendar.dateComponents([.year, .month, .day], from: self)
        components.day = components.day! + 1
        return calendar.date(from: components)!
    }
    
    func ng_fs_yesterday() -> Date
    {
        let calendar = Calendar.ng_fs_sharedCalendar()
        var components = calendar.dateComponents([.year, .month, .day], from: self)
        components.day = components.day! - 1
        return calendar.date(from: components)!
    }
    
    func ng_fs_numberOfDaysInMonth() -> Int
    {
        let calendar = Calendar.ng_fs_sharedCalendar()
        let days:Range<Int> = calendar.range(of: .day, in: .month, for: self)!
        return days.count
    }
    
    // MARK:
    static func ng_fs_dateFrom(string:String, format:String) -> Date
    {
        let formatter = DateFormatter.ng_fs_sharedDateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: string)!
    }
    
    static func ng_fs_dateWith(year:Int, month:Int, day:Int) -> Date
    {
        let calendar = Calendar.ng_fs_sharedCalendar()
        var components = DateComponents.ng_fs_sharedDateComponents()
        components.year = year
        components.month = month
        components.day = day
        let date = calendar.date(from: components)!
        components.year = Int.max
        components.month = Int.max
        components.day = Int.max
        return date
    }
    
    func ng_fs_dateByAdding(years:Int) -> Date
    {
        let calendar = Calendar.ng_fs_sharedCalendar()
        var components = DateComponents.ng_fs_sharedDateComponents()
        components.year = years
        let date = calendar.date(byAdding: components, to: self)
        components.year = Int.max
        return date!
    }
    
    func ng_fs_dateBySubtracting(years:Int) -> Date
    {
        return ng_fs_dateByAdding(years: -years)
    }
    
    func ng_fs_dateByAdding(months:Int) -> Date
    {
        let calendar = Calendar.ng_fs_sharedCalendar()
        var components = DateComponents.ng_fs_sharedDateComponents()
        components.month = months
        let date = calendar.date(byAdding: components, to: self)
        components.month = Int.max
        return date!
    }
    
    func ng_fs_dateBySubtracting(months:Int) -> Date
    {
        return ng_fs_dateByAdding(months: -months)
    }
    
    func ng_fs_dateByAdding(weeks:Int) -> Date
    {
        let calendar = Calendar.ng_fs_sharedCalendar()
        var components = DateComponents.ng_fs_sharedDateComponents()
        components.weekOfYear = weeks
        let date = calendar.date(byAdding: components, to: self)
        components.weekOfYear = Int.max
        return date!
    }
    
    func ng_fs_dateBySubtracting(weeks:Int) -> Date
    {
        return ng_fs_dateByAdding(weeks: -weeks)
    }
    
    func ng_fs_dateByAdding(days:Int) -> Date
    {
        let calendar = Calendar.ng_fs_sharedCalendar()
        var components = DateComponents.ng_fs_sharedDateComponents()
        components.day = days
        let date = calendar.date(byAdding: components, to: self)
        components.day = Int.max
        return date!
    }
    
    func ng_fs_dateBySubtracting(days:Int) -> Date
    {
        return ng_fs_dateByAdding(days: -days)
    }
    
    func ng_fs_yearsFrom(date:Date) -> Int
    {
        let calendar = Calendar.ng_fs_sharedCalendar()
        let components = calendar.dateComponents([.year], from: date, to: self)
        return components.year!
    }
    
    func ng_fs_monthsFrom(date:Date) -> Int
    {
        let calendar = Calendar.ng_fs_sharedCalendar()
        let components = calendar.dateComponents([.month], from: date, to: self)
        return components.month!
    }
    
    func ng_fs_weeksFrom(date:Date) -> Int
    {
        let calendar = Calendar.ng_fs_sharedCalendar()
        let components = calendar.dateComponents([.weekOfYear], from: date, to: self)
        return components.weekOfYear!
    }
    
    func ng_fs_daysFrom(date:Date) -> Int
    {
        let calendar = Calendar.ng_fs_sharedCalendar()
        let components = calendar.dateComponents([.day], from: date, to: self)
        return components.day!
    }
    
    func ng_fs_stringWith(format:String) -> String
    {
        let formatter = DateFormatter.ng_fs_sharedDateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func ng_fs_string() -> String
    {
        return ng_fs_stringWith(format: "yyyyMMdd")
    }
    
    func ng_fs_isEqualToDateForMonth(date:Date) -> Bool
    {
        return self.ng_fs_year == date.ng_fs_year && self.ng_fs_month == date.ng_fs_month
    }
    
    func ng_fs_isEqualToDateForWeek(date:Date) -> Bool
    {
        return self.ng_fs_year == date.ng_fs_year && self.ng_fs_weekOfYear == date.ng_fs_weekOfYear
    }
    
    func ng_fs_isEqualToDateForDay(date:Date) -> Bool
    {
        return self.ng_fs_year == date.ng_fs_year && self.ng_fs_month == date.ng_fs_month && self.ng_fs_day == date.ng_fs_day
    }
}
