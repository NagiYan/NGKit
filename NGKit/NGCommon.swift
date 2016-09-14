//
//  NGCommon.swift
//  NGKit
//
//  Created by nagi on 16/8/9.
//  Copyright © 2016年 aria. All rights reserved.
//

import Foundation
import UIKit

/**
 日志输出，仅调试模式，带位置
 
 - parameter message: 消息内容
 */
public func NSLogEx<T>(message:T, file:String = "\(#file)", line:String = "\(#line)", column:String = "\(#column)", function:String = "\(#function)")
{
    #if !DEBUG
        NSLog("\(file)(\(line),\(column)) \(function) : \(message)")
    #endif
}

// 局部scope
public func local(closure: ()->()) {closure()}

public func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat)->UIColor { return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a) }


/**
 计算某代码执行消耗时间
 
 - parameter process:  要执行的代码块
 - parameter complete: ms数
 */
public func ng_performance(process:()->(), complete:(Double)->())
{
    var t0 = timeval(), t1 = timeval()
    gettimeofday(&t0, nil)
    process()
    gettimeofday(&t1, nil)
    let ms = Double(t1.tv_sec - t0.tv_sec) * 1e3 + Double(t1.tv_usec - t0.tv_usec) * 1e-3
    complete(ms)
}

public func ng_performance(process:()->())
{
    var t0 = timeval(), t1 = timeval()
    gettimeofday(&t0, nil)
    process()
    gettimeofday(&t1, nil)
    let ms = Double(t1.tv_sec - t0.tv_sec) * 1e3 + Double(t1.tv_usec - t0.tv_usec) * 1e-3
    NSLog("cost %g ms", ms)
}

// MARK:  泛型工具

/**
 泛型工具函数
 
 - parameter isSeparator:  判断条件
 - parameter array: 被查找的数组
 
 - returns: 结果
 */
@warn_unused_result
public func ng_find<T>(in array:Array<T>, @noescape isSeparator:(T) throws -> Bool) rethrows -> T?
{
    let filted = try array.filter { (item) -> Bool in
        return (try isSeparator(item))
    }
    
    if filted.count == 0
    {
        return nil
    }
    
    return filted[0]
}
