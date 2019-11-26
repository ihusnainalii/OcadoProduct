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
    
    override func setUp() {
       
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testProductHasExpectedToBeEmpty() {
        product = Product()
        XCTAssertEqual(product.id, 0)
        XCTAssertEqual(product.price, "")
        XCTAssertEqual(product.title, "")
        XCTAssertEqual(product.size, "")
        XCTAssertEqual(product.imageURL, "")
    }
    
    func testProductHasExpectedTheId() {
        product = Product(id: 309396011)
        XCTAssertEqual(product.id, 309396011)
        XCTAssertNotEqual(product.id, 227255011)
    }
    
    func testProductHasExpectedThePrice() {
        product = Product(price: "1.45")
        XCTAssertEqual(product.price, "1.45")
        XCTAssertNotEqual(product.price, "4.45")
    }
    
    func testProductHasExpectedTheTitle() {
        product = Product(title: "Ocado Organic Fairtrade Bananas")
        XCTAssertEqual(product.title, "Ocado Organic Fairtrade Bananas")
        XCTAssertNotEqual(product.title, "Ocado Fairtrade Ripen at Home Bananas")
    }
    
    func testProductHasExpectedTheSize() {
        product = Product(size: "6 per pack")
        XCTAssertEqual(product.size, "6 per pack")
        XCTAssertNotEqual(product.size, "5 per pack")
    }
    
    func testProductHasExpectedTheImageURL() {
        product = Product(imageURL: "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
        XCTAssertEqual(product.imageURL, "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
        XCTAssertNotEqual(product.imageURL, "https://mobile.ocado.com/webservices/catalogue/items/item/227255011/images/image/0/240x240.jpg")
    }
    
    func testProductHasExpectedTheIdTitlePriceImage() {
        product = Product(id: 309396011, price: "1.45", title: "Ocado Organic Fairtrade Bananas", imageURL: "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
        XCTAssertEqual(product.id, 309396011)
        XCTAssertEqual(product.price, "1.45")
        XCTAssertEqual(product.title, "Ocado Organic Fairtrade Bananas")
        XCTAssertEqual(product.imageURL, "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
        XCTAssertEqual(product.size, "")
    }
}
