//
//  ClusterListTests.swift
//  OcadoProductTests
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import XCTest
@testable import OcadoProduct

class ClusterListTests: XCTestCase {
    
    var clusters: [Cluster]!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testClusterListHasExpectedToBeEmpty() {
        clusters = [Cluster]()
        XCTAssert(clusters.count == 0)
    }
    
    func testClusterListHasExpectedOneProduct() {
        clusters = [Cluster]()
        
        let product = Product(id: 309396011, price: "1.45", title: "Ocado Organic Fairtrade Bananas", size: "6 per pack", imageURL: "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
        
        var products = [Product]()
        products.append(product)
        let cluster = Cluster(tag: "Fresh > Fruit > Bananas", products: products)
        
        clusters.append(cluster)
        
        XCTAssert(clusters.count == 1)
        
    }


}
