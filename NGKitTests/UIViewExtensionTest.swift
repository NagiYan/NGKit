//
//  UIViewExtensionTest.swift
//  NGKit
//
//  Created by nagi on 16/8/16.
//  Copyright © 2016年 aria. All rights reserved.
//

import XCTest

@testable import NGKit

class UIViewExtensionTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSubView() {
        let viewChildA = UIView()
        viewChildA.tag = 1
        let viewChildB = UIView()
        viewChildB.tag = 2
    
        viewChildA.addSubview(viewChildB)
        let viewMain = UIView()
        viewMain.tag = 1
        viewMain.addSubview(viewChildA)
        
        XCTAssertEqual(viewChildA, viewMain.ng_getFirstSubView(by: 1))
        XCTAssertEqual(nil, viewMain.ng_getFirstSubView(by: 2))
        XCTAssertEqual(viewChildB, viewMain.ng_getFirstSubView(by: 2, recurison: true))
        XCTAssertEqual(1, viewMain.subviews.count)
        
        
        let viewChildC = UILabel()
        viewChildC.tag = 1
        viewMain.addSubview(viewChildC)
        
        XCTAssertEqual(viewChildC, viewMain.ng_getFirstSubView(by: 1, and: NSStringFromClass(UILabel.self)))
        viewMain.ng_freeSubViews(by: 1)
        XCTAssertEqual(0, viewMain.subviews.count)
    }
}
