//
//  UIColorExtensionTest.swift
//  NGKit
//
//  Created by nagi on 16/8/16.
//  Copyright © 2016年 aria. All rights reserved.
//

import XCTest

@testable import NGKit

class UIColorExtensionTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testColor() {
        
        let color = UIColor.ng_colorWith("#0x0f12")
        var red:CGFloat = 0
        var green:CGFloat = 0
        var blue:CGFloat = 0
        var alpha:CGFloat = 0
        let success = color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssert(success)
        
        XCTAssertEqual(red, 1.0)
        XCTAssertEqual(green, 17.0/255.0)
        XCTAssertEqual(blue, 34.0/255.0)
        XCTAssertEqual(alpha, 0)
    }
        
}
