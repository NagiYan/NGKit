//
//  NSStringExtensionTest.swift
//  NGKit
//
//  Created by nagi on 16/8/16.
//  Copyright © 2016年 aria. All rights reserved.
//

import XCTest

@testable import NGKit

class NSStringExtensionTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRegex()
    {
        // 校验字符串是否是中国手机号
        let phoneA:NSString = "13911111111"
        let phoneB:NSString = "23911111111"
        let phoneC:NSString = "139111111111"
        let phoneD:NSString = "1391111111"
        
        XCTAssert(phoneA.ng_regexIsChinaPhoneNumber())
        XCTAssertFalse(phoneB.ng_regexIsChinaPhoneNumber())
        XCTAssertFalse(phoneC.ng_regexIsChinaPhoneNumber())
        XCTAssertFalse(phoneD.ng_regexIsChinaPhoneNumber())
        
        // 校验字符串是否包含数字、字母、符号中的两种
        let number:NSString = "123123"
        let numberSymbol:NSString = "123#123"
        let numberAlpha:NSString = "1x123123"
        let symbol:NSString = "#"
        let symbolAlpha:NSString = "#d123123123"
        let alpha:NSString = "x"
        let numberSymbolAlpha:NSString = "1x#12cd23e"
        
        XCTAssertTrue(numberAlpha.ng_regexContainTwoOfNumberAlphaSymbol6To20())
        XCTAssertTrue(numberSymbol.ng_regexContainTwoOfNumberAlphaSymbol6To20())
        XCTAssertTrue(symbolAlpha.ng_regexContainTwoOfNumberAlphaSymbol6To20())
        XCTAssertTrue(numberSymbolAlpha.ng_regexContainTwoOfNumberAlphaSymbol6To20())
        XCTAssertFalse(number.ng_regexContainTwoOfNumberAlphaSymbol6To20())
        XCTAssertFalse(symbol.ng_regexContainTwoOfNumberAlphaSymbol6To20())
        XCTAssertFalse(alpha.ng_regexContainTwoOfNumberAlphaSymbol6To20())
        
        // 检验是否以http开头
        let http:NSString = "hTtp://asd.as"
        let nothttpA:NSString = "http://"
        let nothttpB:NSString = "https//asd"
        let nothttpC:NSString = "htp://asd"
        XCTAssertTrue(http.ng_regexIsWebUrl())
        XCTAssertFalse(nothttpA.ng_regexIsWebUrl())
        XCTAssertFalse(nothttpB.ng_regexIsWebUrl())
        XCTAssertFalse(nothttpC.ng_regexIsWebUrl())
        
        // 将字符转化为16进制 'abz' -> '00610062007A
        let beforeA:NSString = "abz"
        let after:NSString = "00610062007A"
        XCTAssert(after.isEqual(to: beforeA.ng_toHexString() as String))
    }
    
}
