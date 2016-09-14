//
//  NSArray+NG.swift
//  NGKit
//
//  Created by westonnaki on 16/9/12.
//  Copyright © 2016年 ARIA. All rights reserved.
//

import Foundation

public extension NSArray
{
    /**
     数组转json字符串
     
     - returns: json字符串
     */
    func ng_jsonStringEncoded() -> String?
    {
        if JSONSerialization.isValidJSONObject(self)
        {
            let jsonData = try! JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            let json = String.init(data: jsonData, encoding: String.Encoding.utf8)
            return json
        }
        return nil
    }
}
