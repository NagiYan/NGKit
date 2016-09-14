//
//  UIScreen+NG.swift
//  NGKit
//
//  Created by nagi on 16/8/9.
//  Copyright © 2016年 aria. All rights reserved.
//

import Foundation
import UIKit

public extension UIScreen{
    
    static func ng_width() -> CGFloat
    {
        struct ngStatic{ static let width = UIScreen.main.bounds.size.width }
        return ngStatic.width
    }
    
    static func ng_height() -> CGFloat
    {
        struct ngStatic{ static let height = UIScreen.main.bounds.size.height }
        return ngStatic.height
    }
}
