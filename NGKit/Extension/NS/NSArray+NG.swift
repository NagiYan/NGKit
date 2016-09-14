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
        if NSJSONSerialization.isValidJSONObject(self)
        {
            let jsonData = try! NSJSONSerialization.dataWithJSONObject(self, options: .PrettyPrinted)
            let json = String.init(data: jsonData, encoding: NSUTF8StringEncoding)
            return json
        }
        return nil
    }
}