//
//  UIFontExtensionTest.swift
//  NGKit
//
//  Created by nagi on 16/8/16.
//  Copyright © 2016年 aria. All rights reserved.
//

import XCTest

@testable import NGKit

class UIFontExtensionTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFontSize()
    {
        let font = UIFont.systemFont(ofSize: 15)
        let string = "test test test test test test test test test test "

        let size = UIFont.ng_size(forAttribute: NSAttributedString.init(string: string, attributes: [NSFontAttributeName:font]), max: 100)
        XCTAssertEqual(302, font.ng_width(for: string as NSString, max:10000))
        XCTAssertEqual(72, font.ng_height(for: string as NSString, max: 100))
        XCTAssertEqual(72, ceil(size.height))
        XCTAssertEqual(91, ceil(size.width))
    }
    
}
