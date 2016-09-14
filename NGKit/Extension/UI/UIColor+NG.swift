//
//  UIColor+NG.swift
//  NGKit
//
//  Created by nagi on 16/8/9.
//  Copyright © 2016年 aria. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    
    /**
     变化当前颜色的透明度，目前支持 WA 和 RGBA 两种模式
     
     - parameter alpha: 目标透明度
     
     - returns: 变化后的颜色
     */
//    func ng_makeAlpha(alpha:CGFloat) -> UIColor
//    {
//        let numberComponents = CGColorGetNumberOfComponents(self.CGColor)
//        let components = CGColorGetComponents(self.CGColor)
//        
//        switch numberComponents {
//        case 2:
//            return UIColor.init(white: components[0], alpha: alpha)
//        case 4:
//            return UIColor.init(red: components[0], green: components[1], blue: components[2], alpha: alpha)
//        default:
//            return self
//        }
//    }
    
    // use colorWithAlphaComponent
    
    
    /**
     16进制RGB ARGB字符串转UIColor
     
     - parameter hexString: #ffffff ffffff 00ffffff
     
     - returns: UIColor
     */
    static func ng_colorWith(_ hexString:String) -> UIColor
    {
        func colorComponentFrom(_ string:String, start:Int, length:Int) -> CGFloat
        {
            let substring = (string as NSString).substring(with: NSRange(location: start, length: length))
            let fullHex = length == 2 ? substring : "\(substring)\(substring)"
            var hexComponent:UInt32 = 0
            Scanner.init(string: fullHex).scanHexInt32(&hexComponent)
            return CGFloat(hexComponent)
        }
        
        var colorString = (hexString as NSString).replacingOccurrences(of: "#", with: "").uppercased()
        colorString = (colorString as NSString).replacingOccurrences(of: "0X", with: "").uppercased()
        
        var a:CGFloat = 1, r:CGFloat, g:CGFloat, b:CGFloat
        
        switch colorString.characters.count
        {
        case 3:
            r = colorComponentFrom(colorString, start: 0, length: 1)
            g = colorComponentFrom(colorString, start: 1, length: 1)
            b = colorComponentFrom(colorString, start: 2, length: 1)
        case 4:
            a = colorComponentFrom(colorString, start: 0, length: 1)
            r = colorComponentFrom(colorString, start: 1, length: 1)
            g = colorComponentFrom(colorString, start: 2, length: 1)
            b = colorComponentFrom(colorString, start: 3, length: 1)
        case 6:
            r = colorComponentFrom(colorString, start: 0, length: 2)
            g = colorComponentFrom(colorString, start: 2, length: 2)
            b = colorComponentFrom(colorString, start: 4, length: 2)
        case 8:
            a = colorComponentFrom(colorString, start: 0, length: 2)
            r = colorComponentFrom(colorString, start: 0, length: 2)
            g = colorComponentFrom(colorString, start: 2, length: 2)
            b = colorComponentFrom(colorString, start: 4, length: 2)
        default:
            return black
        }
        
        return RGBA(r, g: g, b: b, a: a)
    }
    
    //MARK:预设颜色
    static func ngColorTextGrey() -> UIColor
    {
        struct sparam { static let color = RGBA(162, g: 162, b: 162, a: 1.0) }
        return sparam.color
    }
    
    static func ngColorTextGreyDark() -> UIColor
    {
        struct sparam { static let color = RGBA(132, g: 132, b: 132, a: 1.0) }
        return sparam.color
    }
    
    static func ngColorNaviBackground() -> UIColor
    {
        struct sparam { static let color = RGBA(248, g: 248, b: 248, a: 1.0) }
        return sparam.color
    }
    
    static func ngColorNaviLine() -> UIColor
    {
        struct sparam { static let color = RGBA(215, g: 215, b: 215, a: 1.0) }
        return sparam.color
    }  
    
}
