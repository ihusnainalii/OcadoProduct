//
//  ProductDetailViewControllerTests.swift
//  OcadoProductTests
//
//  Created by Lucas Correa on 26/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import XCTest
@testable import OcadoProduct

class ProductDetailViewControllerTests: XCTestCase {
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    var viewController: ProductDetailViewController!
    
    override func setUp() {
        
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: Bundle.main)
        viewController = storyboard.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController
        
        window.makeKeyAndVisible()
        window.rootViewController = viewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testProductDetailViewControllerShouldBePresented() {
        viewController.viewDidLoad()
        XCTAssertNotNil(viewController.view)
    }
    
    func testProductDetailViewControllerHasExpectedProduct() {
        let product = Product(id: 309396011, price: "1.45", title: "Ocado Organic Fairtrade Bananas", imageURL: "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
        
        let productClient = MockProductClient()
        let service = ProductService(client: productClient)
        viewController.productDetailViewModel = ProductDetailViewModel(service: service)
        
        viewController.productDetailViewModel.product = product
        viewController.viewDidLoad()
        XCTAssertNotNil(viewController.productDetailViewModel.productDetail)
    }
    
    func testProductDetailViewControllerHasExpectedProductHandlingUnexpectedErrors() {
        let product = Product(id: 666, price: "1.45", title: "Ocado Organic Fairtrade Bananas", imageURL: "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
        
        let productClient = MockProductClient()
        let service = ProductService(client: productClient)
        viewController.productDetailViewModel = ProductDetailViewModel(service: service)
        
        viewController.productDetailViewModel.product = product
        viewController.viewDidLoad()
        XCTAssertTrue(viewController.loadingIndicator.isHidden == false)
    }
}
