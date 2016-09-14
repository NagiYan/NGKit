//
//  UIImage+NG.swift
//  NGKit
//
//  Created by nagi on 16/8/10.
//  Copyright © 2016年 aria. All rights reserved.
//

import Foundation
import CoreImage

public extension UIImage{
    
    /**
     改变图片颜色
     
     - parameter color: 要变更的颜色
     - parameter gradient: 是否保留渐变
     - returns: 变化后的图片
     */
    func ng_changeColor(to color:UIColor, with gradient:Bool = true) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        color.setFill()
        let bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIRectFill(bounds)
        if gradient
        {
            draw(in: bounds, blendMode: .overlay, alpha: 1.0)
        }
        draw(in: bounds, blendMode: .destinationIn, alpha: 1.0)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
    
    /**
     黑白化图片
     
     - returns: 结果
     */
    func ng_toGreyScale() -> UIImage
    {
        return ng_changeColor(to: UIColor.black)
        
//        let context = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: 8, bytesPerRow: 0, space: CGColorSpaceCreateDeviceGray(), bitmapInfo: 0)
//        draw(in: CGRect(x:0, y:0, width:size.width, height:size.height))
//        CGContextDrawImage(context, CGRect(x:0, y:0, width:size.width, height:size.height), self.cgImage);
//        return UIImage.init(cgImage: context!.makeImage()!)
    }
    
    /**
     将大图变小图
     
     - parameter size: 变更后的尺寸
     
     - returns: 结果
     */
    func ng_thumbnail(with thumbSize:CGSize) -> UIImage
    {
        guard thumbSize.width < size.width || thumbSize.height < size.height else
        {
            return self
        }
        
        UIGraphicsBeginImageContext(thumbSize)
        draw(in: CGRect(x:0, y:0, width:thumbSize.width, height:thumbSize.height))
        let result = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext()
        return result!
    }
}
