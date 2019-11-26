//
//  ProductServiceTests.swift
//  OcadoProductTests
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import XCTest

@testable import OcadoProduct

class ProductServiceTests: XCTestCase {
    
    var productClient: MockProductClient!
    var productService: ProductService!
    
    override func setUp() {
        productClient = MockProductClient()
    }
    
    override func tearDown() {
        productClient = nil
    }
    
    func testProductServiceHasExpectedRequestClustersCount() {
        productService = ProductService(client: productClient)
        
        productService.clusterList { result in
            switch result {
            case .success(let clusterList):
                XCTAssert(clusterList.clusters.count == 5)
            case .failure(_):
                XCTFail("ProductService has expected request clusters count equal 5")
            }
        }
    }
    
    func testProductServiceHasExpectedRequestProductDetail() {
        productService = ProductService(client: productClient)
        
        productService.productDetail(idProduct: 309396011) { result in
            switch result {
            case .success(let productDetail):
                XCTAssert(productDetail.title == "Ocado Organic Fairtrade Bananas")
            case .failure(_):
                XCTFail("ProductService has expected request productDetail title equal Ocado Organic Fairtrade Bananas")
            }
        }
    }
    
    func testProductServiceHasExpectedRequestProductDetailFailure() {
        productService = ProductService(client: productClient)
        
        productService.productDetail(idProduct: 227255011) { result in
            switch result {
            case .success(_):
                XCTFail("")
            case .failure(let error):
                XCTAssert(error.localizedDescription == "Decoding error")
            }
        }
    }
    
}
