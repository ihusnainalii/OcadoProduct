//
//  ProductTests.swift
//  OcadoProductTests
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import XCTest
@testable import OcadoProduct

class ProductTests: XCTestCase {
    
    var product: Product!
    var items: [Item]!
    
    override func setUp() {
        let item = Item(id: 309396011, price: "1.45", title: "Ocado Organic Fairtrade Bananas", size: "6 per pack", imageURL: "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
        
        items = [Item]()
        items.append(item)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testProductHasExpectedToBeEmpty() {
        product = Product()
        XCTAssertEqual(product.tag, "")
        XCTAssertEqual(product.items.count, 0)
    }
    
    func testProductHasExpectedTheTag() {
        product = Product(tag: "Fresh > Fruit > Bananas")
        XCTAssertEqual(product.tag, "Fresh > Fruit > Bananas")
        XCTAssertNotEqual(product.tag, "Fresh > Salads & Herbs > Cucumber")
        XCTAssertTrue(product.items.count == 0)
    }
    
    func testProductHasExpectedTheItems() {
        product = Product(tag: "Fresh > Fruit > Bananas", items: items)
        let item = product.items.first
        XCTAssertEqual(item?.price, "1.45")
        XCTAssertEqual(item?.title, "Ocado Organic Fairtrade Bananas")
        XCTAssertEqual(item?.size, "6 per pack")
        XCTAssertEqual(item?.imageURL, "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
        XCTAssertTrue(product.items.count == 1)
    }
    
}
