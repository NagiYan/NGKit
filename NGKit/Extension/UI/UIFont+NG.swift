//
//  UIFont+NG.swift
//  NGKit
//
//  Created by nagi on 16/8/11.
//  Copyright © 2016年 aria. All rights reserved.
//

import Foundation

public extension UIFont{
    
    /**
     获取某字符串的显示尺寸
     
     - parameter string: 字符串
     - parameter width:  最大宽度
     
     - returns: 尺寸
     */
    func ng_size(for string:NSString, max width:CGFloat = 320) -> CGSize
    {
        return string.boundingRect(with: CGSize(width: width, height: CGFloat(Int.max))
            , options: NSStringDrawingOptions([.usesLineFragmentOrigin, .usesFontLeading])
            , attributes: [NSFontAttributeName:self]
            , context: nil).size
    }
    
    /**
     获取某字符串的显示尺寸
     
     - parameter string: 字符串
     - parameter width:  最大宽度
     
     - returns: 尺寸
     */
    static func ng_size(forAttribute string:NSAttributedString, max width:CGFloat = 320) -> CGSize
    {
        return string.boundingRect(with: CGSize(width: width, height: CGFloat(Int.max))
            , options: NSStringDrawingOptions([.usesLineFragmentOrigin, .usesFontLeading])
            , context: nil).size
    }
    
    
    /**
     获取某字符串的显示高度
     
     - parameter string: 字符串
     - parameter width:  最大宽度
     
     - returns: 高度
     */
    func ng_height(for string:NSString, max width:CGFloat = 320) -> Float
    {
        return ceilf(Float(ng_size(for: string, max: width).height))
    }
    
    /**
     获取某字符串的显示宽度
     
     - parameter string: 字符串
     - parameter width:  最大宽度
     
     - returns: 宽度
     */
    func ng_width(for string:NSString, max width:CGFloat = 320) -> Float
    {
        return ceilf(Float(ng_size(for: string, max: width).width))
    }
    
}
