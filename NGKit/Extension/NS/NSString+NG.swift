//
//  NSString+NG.swift
//  NGKit
//
//  Created by nagi on 16/8/10.
//  Copyright © 2016年 aria. All rights reserved.
//

import Foundation

public extension NSString{

    fileprivate static let ngMobile = "^1[3578]\\d{9}$"
    fileprivate static let ngNumberAlpha = "^(?=.*[0-9].*)(?=.*[a-zA-Z].*).{6,20}$"
    fileprivate static let ngNumberSymbol = "^(?=.*[0-9].*)(?=.*[-_.=;:!@#$%^&*()+/?><].*).{6,20}$"
    fileprivate static let ngAlphaSymbol = "^(?=.*[a-zA-Z].*)(?=.*[-_.;:=!@#$%^&*()+/?><].*).{6,20}$"
    fileprivate static let ngHttp = "^([hH][tT]{2}[pP]://|[hH][tT]{2}[pP][sS]://)(([A-Za-z0-9-~]+).)+([A-Za-z0-9-~/])+$"
    
    fileprivate func ng_evaluate(with regex:String) -> Bool
    {
        let regextestmobile = NSPredicate.init(format: "SELF MATCHES %@", regex)
        return regextestmobile.evaluate(with: self)
    }
    
    /**
     校验字符串是否是中国手机号
     
     - returns: 结果
     */
    func ng_regexIsChinaPhoneNumber() -> Bool
    {
        return ng_evaluate(with: NSString.ngMobile)
    }

    /**
     校验字符串是否包含数字、字母、符号中的两种 且大于6位 小于20位
     
     - returns: 结果
     */
    func ng_regexContainTwoOfNumberAlphaSymbol6To20() -> Bool
    {
        return ng_evaluate(with: NSString.ngNumberAlpha) || ng_evaluate(with: NSString.ngNumberSymbol) || ng_evaluate(with: NSString.ngAlphaSymbol)
    }
    
    /**
     检验是网址开头
     
     - returns: 结果
     */
    func ng_regexIsWebUrl() -> Bool
    {
        return ng_evaluate(with: NSString.ngHttp)
    }
    
    
    fileprivate static let ngHex:Array<String> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
    /**
     将字符转化为16进制
     'abz' -> '00610062007A
     - returns: 结果
     */
    func ng_toHexString() -> NSString
    {
        var result = ""
        
        for index in 0..<length
        {
            let nChar = character(at: index)
            let v1 = (Int)(0x0F & nChar);
            let v2 = (Int)(0x0F & (nChar>>4));
            let v3 = (Int)(0x0F & (nChar>>8));
            let v4 = (Int)(0x0F & (nChar>>12));
            let hex = "\(NSString.ngHex[v4])\(NSString.ngHex[v3])\(NSString.ngHex[v2])\(NSString.ngHex[v1])"
            result = result + hex
        }
        
        return result as NSString
    }
    
//    #import <CommonCrypto/CommonCrypto.h>
//    func ng_md5() -> NSString
//    {
//        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
//        let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
//        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
//        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
//        
//        CC_MD5(str, strLen, result)
//        
//        let hash = NSMutableString()
//        for i in 0..<digestLen {
//            hash.appendFormat("%02x", result[i])
//        }
//        
//        result.destroy()
//        
//        return String(format: hash as String)
//    }
}
