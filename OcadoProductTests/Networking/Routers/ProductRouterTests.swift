//
//  ProductRouterTests.swift
//  OcadoProductTests
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import XCTest
@testable import OcadoProduct

class ProductRouterTests: XCTestCase {
    
    let productRouter = ProductRouter.products

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBookRouterHasExpectedPath() {
        XCTAssertEqual(productRouter.path, "product/all.json")
    }
    
    func testBookRouterHasExpectedParameters() {
        XCTAssert(productRouter.parameters?.count == 0)
    }
    
    func testBookRouterHasExpectedHeaders() {
        XCTAssert(productRouter.headers == ["Accept": "application/json",
        "Content-Type": "application/json"])
    }
    
    func testBookRouterHasExpectedMethod() {
        XCTAssertEqual(productRouter.method, "GET")
    }
    
    func testBookRouterHasExpected() {
        XCTAssertEqual(productRouter.url, URL(string: "\(Config.baseURL)\(productRouter.path)")!)
    }

}
