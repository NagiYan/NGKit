//
//  UIWindow+NG.swift
//  NGKit
//
//  Created by nagi on 16/8/9.
//  Copyright © 2016年 aria. All rights reserved.
//

import Foundation
import UIKit

public extension UIWindow{
    
    /**
     默认截屏
     
     - returns: 截屏
     */
    static func ng_clipImageCurrent() -> UIImage?
    {
        let window = UIApplication.shared.keyWindow
        return window?.ng_clipImage()
    }
    
    /**
     截屏
     
     - returns: 截屏
     */
    func ng_clipImage() -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: UIScreen.ng_width(), height: UIScreen.ng_height()), true, 0);     //设置截屏大小
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!;
    }
}
