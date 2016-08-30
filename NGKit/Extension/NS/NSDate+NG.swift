//
//  NSDate+NG.swift
//  NGKit
//
//  Created by nagi on 16/8/10.
//  Copyright © 2016年 aria. All rights reserved.
//

import Foundation

extension NSDate {
    
    /**
     仅返回当天的年月日
     
     - returns: 仅包含年月的日期
     */
    static func ng_today() -> NSDate
    {
        let today = NSDate()
        let date = NSDate.ng_fs_dateWithYear(today.ng_fs_year, month: today.ng_fs_month, day: today.ng_fs_day)
        return date
    }
    
    /**
     去掉时分秒
     
     - returns: 仅包含年月的日期
     */
    func ng_date() -> NSDate
    {
        let date = NSDate.ng_fs_dateWithYear(self.ng_fs_year, month: self.ng_fs_month, day: self.ng_fs_day)
        return date
    }
    
    /**
     是否是今天
     
     - returns: 是否
     */
    func ng_isToday() -> Bool
    {
        let today = NSDate.ng_today()
        let timeInterval = self.timeIntervalSinceDate(today)
        return timeInterval < 24*60*60*1000 && timeInterval > 0
    }
    
    
    /**
     现在多大了
     
     - returns: 年龄
     */
    func ng_howOld() -> Int
    {
       return NSDate().ng_fs_yearsFrom(self)
    }
    
}