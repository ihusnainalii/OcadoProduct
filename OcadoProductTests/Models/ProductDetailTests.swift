//
//  ProductDetailTests.swift
//  OcadoProductTests
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import XCTest
@testable import OcadoProduct

class ProductDetailTests: XCTestCase {
    
    var productDetail: ProductDetail!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testProductDetailHasExpectedToBeEmpty() {
        productDetail = ProductDetail()
        XCTAssertEqual(productDetail.id, 0)
        XCTAssertEqual(productDetail.price, "")
        XCTAssertEqual(productDetail.title, "")
        XCTAssertEqual(productDetail.imageURL, "")
        XCTAssertEqual(productDetail.productDetailDescription, "")
        XCTAssertEqual(productDetail.allergyInformation, "")
    }
    
    func testProductDetailHasExpectedTheId() {
        productDetail = ProductDetail(id: 309396011)
        XCTAssertEqual(productDetail.id, 309396011)
        XCTAssertNotEqual(productDetail.id, 227255011)
    }
    
    func testProductDetailHasExpectedThePrice() {
        productDetail = ProductDetail(price: "1.45")
        XCTAssertEqual(productDetail.price, "1.45")
        XCTAssertNotEqual(productDetail.price, "4.45")
    }
    
    func testProductDetailHasExpectedTheTitle() {
        productDetail = ProductDetail(title: "Ocado Organic Fairtrade Bananas")
        XCTAssertEqual(productDetail.title, "Ocado Organic Fairtrade Bananas")
        XCTAssertNotEqual(productDetail.title, "Ocado Fairtrade Ripen at Home Bananas")
    }
    
    func testProductDetailHasExpectedTheImageURL() {
        productDetail = ProductDetail(imageURL: "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
        XCTAssertEqual(productDetail.imageURL, "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
        XCTAssertNotEqual(productDetail.imageURL, "https://mobile.ocado.com/webservices/catalogue/items/item/227255011/images/image/0/240x240.jpg")
    }
    
    func testProductDetailHasExpectedTheIdTitleImageProductDetailDescriptionAllergyInformation() {
        productDetail = ProductDetail(id: 309396011, title: "Ocado Organic Fairtrade Bananas", imageURL: "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg", productDetailDescription: "Organic. Suitable for vegetarians", allergyInformation: "May contain traces of Sesame Seeds")
        XCTAssertEqual(productDetail.id, 309396011)
        XCTAssertEqual(productDetail.title, "Ocado Organic Fairtrade Bananas")
        XCTAssertEqual(productDetail.imageURL, "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
        XCTAssertEqual(productDetail.productDetailDescription, "Organic. Suitable for vegetarians")
        XCTAssertEqual(productDetail.allergyInformation, "May contain traces of Sesame Seeds")
        XCTAssertEqual(productDetail.price, "")
    }
}
