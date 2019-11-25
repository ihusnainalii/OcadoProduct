//
//  ItemTests.swift
//  OcadoProductTests
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import XCTest
@testable import OcadoProduct

class ItemTests: XCTestCase {
    
    var item: Item!
    
    override func setUp() {
       
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testItemHasExpectedToBeEmpty() {
        item = Item()
        XCTAssertEqual(item.id, 0)
        XCTAssertEqual(item.price, "")
        XCTAssertEqual(item.title, "")
        XCTAssertEqual(item.size, "")
        XCTAssertEqual(item.imageURL, "")
    }
    
    func testItemHasExpectedTheId() {
        item = Item(id: 309396011)
        XCTAssertEqual(item.id, 309396011)
        XCTAssertNotEqual(item.id, 227255011)
    }
    
    func testItemHasExpectedThePrice() {
        item = Item(price: "1.45")
        XCTAssertEqual(item.price, "1.45")
        XCTAssertNotEqual(item.price, "4.45")
    }
    
    func testItemHasExpectedTheTitle() {
        item = Item(title: "Ocado Organic Fairtrade Bananas")
        XCTAssertEqual(item.title, "Ocado Organic Fairtrade Bananas")
        XCTAssertNotEqual(item.title, "Ocado Fairtrade Ripen at Home Bananas")
    }
    
    func testItemHasExpectedTheSize() {
        item = Item(size: "6 per pack")
        XCTAssertEqual(item.size, "6 per pack")
        XCTAssertNotEqual(item.size, "5 per pack")
    }
    
    func testItemHasExpectedTheImageURL() {
        item = Item(imageURL: "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
        XCTAssertEqual(item.imageURL, "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
        XCTAssertNotEqual(item.imageURL, "https://mobile.ocado.com/webservices/catalogue/items/item/227255011/images/image/0/240x240.jpg")
    }
    
    func testItemHasExpectedTheIdTitlePriceImage() {
        item = Item(id: 309396011, price: "1.45", title: "Ocado Organic Fairtrade Bananas", imageURL: "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
        XCTAssertEqual(item.id, 309396011)
        XCTAssertEqual(item.price, "1.45")
        XCTAssertEqual(item.title, "Ocado Organic Fairtrade Bananas")
        XCTAssertEqual(item.imageURL, "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
        XCTAssertEqual(item.size, "")
    }
}
