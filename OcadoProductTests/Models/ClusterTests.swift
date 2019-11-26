//
//  ClusterTests.swift
//  OcadoProductTests
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import XCTest
@testable import OcadoProduct

class ClusterTests: XCTestCase {
    
    var cluster: Cluster!
    var products: [Product]!
    
    override func setUp() {
        let item = Product(id: 309396011, price: "1.45", title: "Ocado Organic Fairtrade Bananas", size: "6 per pack", imageURL: "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
        
        products = [Product]()
        products.append(item)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testClusterHasExpectedToBeEmpty() {
        cluster = Cluster()
        XCTAssertEqual(cluster.tag, "")
        XCTAssertEqual(cluster.products.count, 0)
    }
    
    func testClusterHasExpectedTheTag() {
        cluster = Cluster(tag: "Fresh > Fruit > Bananas")
        XCTAssertEqual(cluster.tag, "Fresh > Fruit > Bananas")
        XCTAssertNotEqual(cluster.tag, "Fresh > Salads & Herbs > Cucumber")
        XCTAssertTrue(cluster.products.count == 0)
    }
    
    func testClusterHasExpectedTheProducts() {
        cluster = Cluster(tag: "Fresh > Fruit > Bananas", products: products)
        let product = cluster.products.first
        XCTAssertEqual(product?.price, "1.45")
        XCTAssertEqual(product?.title, "Ocado Organic Fairtrade Bananas")
        XCTAssertEqual(product?.size, "6 per pack")
        XCTAssertEqual(product?.imageURL, "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
        XCTAssertTrue(cluster.products.count == 1)
    }
    
}
