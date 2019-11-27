//
//  ProductListViewModelTests.swift
//  OcadoProductTests
//
//  Created by Lucas Correa on 26/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import XCTest
@testable import OcadoProduct

class ProductListViewModelTests: XCTestCase {

    var productListViewModel: ProductListViewModel!
    var productClient: MockProductClient!
    
    override func setUp() {
        productClient = MockProductClient()
        let service = ProductService(client: productClient)
        productListViewModel = ProductListViewModel(service: service)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testProductListViewModelHasExpectedClustersCount() {
        
        productListViewModel.clusterList(success: {
            XCTAssert(self.productListViewModel.clusterItems.count == 5)
        }) { error in
            XCTFail()
        }
    }
    
    func testProductListViewModelHasExpectedCannotFindEndpoint() {
        
        productClient.shouldReturnError = true
        
        productListViewModel.clusterList(success: {
            XCTFail()
        }) { error in
            XCTAssertNotNil(error)
        }
    }

}
