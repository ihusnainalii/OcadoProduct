//
//  ProductListViewControllerTests.swift
//  OcadoProductTests
//
//  Created by Lucas Correa on 26/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import XCTest
@testable import OcadoProduct

class ProductListViewControllerTests: XCTestCase {
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    var viewController: ProductListViewController!
    var productClient: MockProductClient!
    var service: ProductService!
    
    override func setUp() {
        productClient = MockProductClient()
        service = ProductService(client: productClient)
        
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: Bundle.main)
        viewController = storyboard.instantiateViewController(withIdentifier: "ProductListViewController") as? ProductListViewController
        
        window.makeKeyAndVisible()
        window.rootViewController = viewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testProductListViewControllerShouldBePresented() {
        viewController.viewDidLoad()
        XCTAssertNotNil(viewController.view)
    }
    
    func testProductListViewControllerHasExpectedClustersCount() {
        viewController.productListViewModel = ProductListViewModel(service: service)
        viewController.viewDidLoad()
        XCTAssert(viewController.productListViewModel.clusterItems.count == 5)
    }
    
    func testProductListViewControllerHasExpectedCannotFindEndpoint() {
        productClient.shouldReturnError = true
        viewController.productListViewModel = ProductListViewModel(service: service)
        viewController.viewDidLoad()
        XCTAssert(viewController.loadingIndicator.isHidden)
    }
    
    func testProductListViewControllerPrepareSegueShouldBeCalled() {
        viewController.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: Bundle.main)
        let productDetailViewController = storyboard.instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController
        
        let targetSegue: UIStoryboardSegue = UIStoryboardSegue(identifier: viewController.productDetailSegue, source: viewController, destination: productDetailViewController)
        
        let product = Product(id: 309396011, price: "1.45", title: "Ocado Organic Fairtrade Bananas", imageURL: "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
        
        viewController.prepare(for: targetSegue, sender: product)
    
        XCTAssertEqual(product.id, productDetailViewController.productDetailViewModel.product?.id)
        XCTAssertNotNil(viewController.view)
    }
    
}
