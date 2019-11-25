//
//  ProductListTests.swift
//  OcadoProductTests
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import XCTest
@testable import OcadoProduct

class ProductListTests: XCTestCase {
    
    var products: [Product]!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testProductListHasExpectedToBeEmpty() {
        products = [Product]()
        XCTAssert(products.count == 0)
    }
    
    func testProductListHasExpectedOneItem() {
        products = [Product]()
        
        let item = Item(id: 309396011, price: "1.45", title: "Ocado Organic Fairtrade Bananas", size: "6 per pack", imageURL: "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
        
        var items = [Item]()
        items.append(item)
        let product = Product(tag: "Fresh > Fruit > Bananas", items: items)
        
        products.append(product)
        
        XCTAssert(products.count == 1)
        
    }


}
