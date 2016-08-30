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
        let size = CGSizeMake(100, 200)
        
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor);
        CGContextFillRect(context, CGRect.init(origin: CGPointMake(0, 0), size: size));
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext()
        
        XCTAssertEqual(size, image.ng_thumbnail(with: CGSize(width: 200, height: 200)).size)
        XCTAssertEqual(CGSizeMake(50, 50), image.ng_thumbnail(with: CGSizeMake(50, 50)).size)
    }
}
