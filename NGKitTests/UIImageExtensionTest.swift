//
//  UIImageExtensionTest.swift
//  NGKit
//
//  Created by nagi on 16/8/16.
//  Copyright © 2016年 aria. All rights reserved.
//

import XCTest
import CoreImage

@testable import NGKit

class UIImageExtensionTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSize() {
        let size = CGSize(width: 100, height: 200)
        
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext();
        context!.setFillColor(UIColor.white.cgColor);
        context!.fill(CGRect.init(origin: CGPoint(x: 0, y: 0), size: size));
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext()
        
        XCTAssertEqual(size, image?.ng_thumbnail(with: CGSize(width: 200, height: 200)).size)
        XCTAssertEqual(CGSize(width: 50, height: 50), image?.ng_thumbnail(with: CGSize(width: 50, height: 50)).size)
    }
}
