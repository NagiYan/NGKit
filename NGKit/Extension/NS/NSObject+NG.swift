//
//  NSObject+NG.swift
//  NGKit
//
//  Created by nagi on 16/8/10.
//  Copyright © 2016年 aria. All rights reserved.
//

import Foundation

// MARK: - 扩展
extension NSObject {
    
    static func ng_getIVars(cls: AnyClass!) -> Array<String>
    {
        var count:UInt32 = 0
        let ivars = class_copyIvarList(cls, &count)
        var result: Array<String> = []
        for i in 0 ..< Int(count)
        {
            let ivar = ivars[i]
            let name = ivar_getName(ivar)
            if let varName = String.fromCString(name)
            {
                result.append(varName)
            }
        }
        return result
    }
    
    
    static func ng_getPropertys(cls: AnyClass!) -> Array<String>
    {
        var count:UInt32 = 0
        let properties = class_copyPropertyList(cls, &count)
        var result: Array<String> = []
        for i in 0 ..< Int(count)
        {
            let property = properties[i]
            let name = property_getName(property)
            if let propertyName = String.fromCString(name)
            {
                result.append(propertyName)
            }
        }
        return result
    }
}