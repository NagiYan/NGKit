//
//  NSFileManager+NG.swift
//  NGKit
//
//  Created by nagi on 16/8/10.
//  Copyright © 2016年 aria. All rights reserved.
//

import Foundation

public extension FileManager{
    
    /**
     获取资源文件
     
     - parameter name: 文件名
     - parameter type: 文件类型
     
     - returns: 文件路径
     */
    static func ng_getFullPathOfResourceFile(_ name:String, type:String) -> String?
    {
        return Bundle.main.path(forResource: name, ofType: type)
    }
    
    /**
     获取缓存目录
     
     - returns: 路径
     */
    static func ng_getDirectoryPathCache() -> String
    {
        return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
    }
    
    /**
     获取文档目录
     
     - returns: 路径
     */
    static func ng_getDirectoryPathDocument() -> String
    {
        return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
    }
    
    /**
     确保路径存在
     
     - parameter path: 路径
     */
    static func ng_makeSurePath(_ path:String)
    {
        let fileManager = FileManager.default
        try! fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
    }
    
    /**
     路径文件总大小(MB)
     
     - parameter path: 路径
     */
    static func ng_fileSize(at path:String) -> Float
    {
        let attribute = try! FileManager.default.attributesOfItem(atPath: path) as NSDictionary
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
        
        let fileManager = FileManager.default
        let isDir:UnsafeMutablePointer<ObjCBool> = UnsafeMutablePointer<ObjCBool>.init(bitPattern: 0)!
        let exist = fileManager.fileExists(atPath: path, isDirectory: isDir)
        guard exist else
        {
            return result
        }
        
        if isDir[0].boolValue
        {
            var result:Float = 0.0
            if FileManager.default.fileExists(atPath: path)
            {
                // 子目录会摊平
                for subPath in FileManager.default.subpaths(atPath: path)!
                {
                    result += FileManager.ng_fileSize(at: (path as NSString).appendingPathComponent(subPath))
                }
            }
        }
        else
        {
            result = FileManager.ng_fileSize(at: path)
        }
        
        return result
    }

    /**
     清空路径
     
     - parameter path: 路径
     */
    static func ng_clean(_ path:String)
    {
        if FileManager.default.fileExists(atPath: path)
        {
            for subPath in FileManager.default.subpaths(atPath: path)!
            {
                try! FileManager.default.removeItem(atPath: (path as NSString).appendingPathComponent(subPath))
            }
        }
    }
}
