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
func NSLogEx<T>(message:T, file:String = "\(#file)", line:String = "\(#line)", column:String = "\(#column)", function:String = "\(#function)")
{
    #if !DEBUG
        NSLog("\(file)(\(line),\(column)) \(function) : \(message)")
    #endif
}

// 局部scope
func local(closure: ()->()) {closure()}

func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat)->UIColor { return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a) }

// MARK:  泛型工具

/**
 泛型工具函数
 
 - parameter isSeparator:  判断条件
 - parameter array: 被查找的数组
 
 - returns: 结果
 */
@warn_unused_result
func ng_find<T>(in array:Array<T>, @noescape isSeparator:(T) throws -> Bool) rethrows -> T?
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
