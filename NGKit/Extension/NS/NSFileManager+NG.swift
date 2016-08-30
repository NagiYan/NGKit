//
//  NSFileManager+NG.swift
//  NGKit
//
//  Created by nagi on 16/8/10.
//  Copyright © 2016年 aria. All rights reserved.
//

import Foundation

extension NSFileManager{
    
    /**
     获取资源文件
     
     - parameter name: 文件名
     - parameter type: 文件类型
     
     - returns: 文件路径
     */
    static func ng_getFullPathOfResourceFile(name:String, type:String) -> String?
    {
        return NSBundle.mainBundle().pathForResource(name, ofType: type)
    }
    
    /**
     获取缓存目录
     
     - returns: 路径
     */
    static func ng_getDirectoryPathCache() -> String
    {
        return NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
    }
    
    /**
     获取文档目录
     
     - returns: 路径
     */
    static func ng_getDirectoryPathDocument() -> String
    {
        return NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
    }
    
    /**
     确保路径存在
     
     - parameter path: 路径
     */
    static func ng_makeSurePath(path:String)
    {
        let fileManager = NSFileManager.defaultManager()
        try! fileManager.createDirectoryAtPath(path, withIntermediateDirectories: true, attributes: nil)
    }
    
    /**
     路径文件总大小(MB)
     
     - parameter path: 路径
     */
    static func ng_fileSize(at path:String) -> Float
    {
        let attribute = try! NSFileManager.defaultManager().attributesOfItemAtPath(path) as NSDictionary
        let size = attribute.fileSize()
        return Float(size)/1024.0/1024.0
    }
    
    /**
     取路径文件大小
     
     - parameter path: 路径
     
     - returns: 大小
     */
    static func ng_dirSize(at path:String) -> Float
    {
        var result:Float = 0.0
        
        let fileManager = NSFileManager.defaultManager()
        let isDir:UnsafeMutablePointer<ObjCBool> = UnsafeMutablePointer<ObjCBool>.init(bitPattern: 0)
        let exist = fileManager.fileExistsAtPath(path, isDirectory: isDir)
        guard exist else
        {
            return result
        }
        
        if isDir[0]
        {
            var result:Float = 0.0
            if NSFileManager.defaultManager().fileExistsAtPath(path)
            {
                // 子目录会摊平
                for subPath in NSFileManager.defaultManager().subpathsAtPath(path)!
                {
                    result += NSFileManager.ng_fileSize(at: (path as NSString).stringByAppendingPathComponent(subPath))
                }
            }
        }
        else
        {
            result = NSFileManager.ng_fileSize(at: path)
        }
        
        return result
    }

    /**
     清空路径
     
     - parameter path: 路径
     */
    static func ng_clean(path:String)
    {
        if NSFileManager.defaultManager().fileExistsAtPath(path)
        {
            for subPath in NSFileManager.defaultManager().subpathsAtPath(path)!
            {
                try! NSFileManager.defaultManager().removeItemAtPath((path as NSString).stringByAppendingPathComponent(subPath))
            }
        }
    }
}