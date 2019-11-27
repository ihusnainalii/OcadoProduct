//
//  ProductDetailViewModelTests.swift
//  OcadoProductTests
//
//  Created by Lucas Correa on 26/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import XCTest
@testable import OcadoProduct

class ProductDetailViewModelTests: XCTestCase {

    var productDetailViewModel: ProductDetailViewModel!

       override func setUp() {
           let productClient = MockProductClient()
           let service = ProductService(client: productClient)
           productDetailViewModel = ProductDetailViewModel(service: service)
       }

       override func tearDown() {
           // Put teardown code here. This method is called after the invocation of each test method in the class.
       }

       func testProductDetailViewModelHasExpectedProductDetail() {
           productDetailViewModel.productDetail(idProduct: 309396011, success: {
               XCTAssertNotNil(self.productDetailViewModel.productDetail)
           }) { error in
               XCTFail()
           }
       }
       func testProductDetailViewModelHasExpectedProductHandlingUnexpectedErrors() {
           productDetailViewModel.productDetail(idProduct: 666, success: {
               XCTFail()
           }) { error in
               XCTAssertNotNil(error)
           }
       }

}
