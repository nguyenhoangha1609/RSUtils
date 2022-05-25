//
//  RSUtilsTests.swift
//  RSUtilsTests
//
//  Created by Nguyễn Hà on 24/05/2022.
//

import XCTest
@testable import RSUtils

class RSUtilsTests: XCTestCase {

    var rsutils: RSUtils!
    
    override func setUp() {
        rsutils = RSUtils()
    }

    func testAdd() {
        XCTAssertEqual(rsutils.add(a: 1, b: 1), 2)
    }
}
