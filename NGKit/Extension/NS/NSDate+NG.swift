//
//  NSDate+NG.swift
//  NGKit
//
//  Created by nagi on 16/8/10.
//  Copyright © 2016年 aria. All rights reserved.
//

import Foundation

public extension Date {
    
    /**
     仅返回当天的年月日
     
     - returns: 仅包含年月的日期
     */
    static func ng_today() -> Date
    {
        let today = Date()
        let date = Date.ng_fs_dateWith(year: today.ng_fs_year, month: today.ng_fs_month, day: today.ng_fs_day)
        return date
    }
    
    /**
     去掉时分秒
     
     - returns: 仅包含年月的日期
     */
    func ng_date() -> Date
    {
        let date = Date.ng_fs_dateWith(year: self.ng_fs_year, month: self.ng_fs_month, day: self.ng_fs_day)
        return date
    }
    
    /**
     是否是今天
     
     - returns: 是否
     */
    func ng_isToday() -> Bool
    {
        let today = Date.ng_today()
        let timeInterval = self.timeIntervalSince(today)
        return timeInterval < 24*60*60*1000 && timeInterval >= 0
    }
    
    /**
     上个月
     
     - returns: 上个月
     */
    func ng_lastMonth() -> Int
    {
        return self.ng_fs_dateBySubtracting(months: 1).ng_fs_month
    }
    
    /**
     现在多大了
     
     - returns: 年龄
     */
    func ng_howOld() -> Int
    {
       return Date().ng_fs_yearsFrom(date: self)
    }
    
}
