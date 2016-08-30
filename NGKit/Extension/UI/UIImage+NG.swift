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
     黑白化图片
     
     - returns: 结果
     */
    func ng_toGreyScale() -> UIImage
    {
        let context = CGBitmapContextCreate(nil, Int(size.width), Int(size.height), 8, 0, CGColorSpaceCreateDeviceGray(), 0)
        CGContextDrawImage(context, CGRectMake(0, 0, size.width, size.height), CGImage);
        return UIImage.init(CGImage: CGBitmapContextCreateImage(context)!)
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
        drawInRect(CGRectMake(0, 0, thumbSize.width, thumbSize.height))
        let result = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext()
        return result
    }
}
