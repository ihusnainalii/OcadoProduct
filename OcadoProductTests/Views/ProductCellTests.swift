//
//  ProductCellTests.swift
//  OcadoProductTests
//
//  Created by Lucas Correa on 26/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import XCTest
@testable import OcadoProduct

class ProductCellTests: XCTestCase {
    
    var tableView: UITableView!
    var productCellIdentifier = "ProductCell"
    var productListViewModel: ProductListViewModel!
    
    override func setUp() {
        
        var viewController: ProductListViewController!
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: Bundle.main)
        viewController = storyboard.instantiateViewController(withIdentifier: "ProductListViewController") as? ProductListViewController
        
        window.makeKeyAndVisible()
        window.rootViewController = viewController
        
        tableView = viewController.productTableView
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testProductCellHasExpectedNotToBeNil() {
        let cell = tableView.dequeueReusableCell(withIdentifier: productCellIdentifier)
        XCTAssertNotNil(cell)
    }
    
    func testProductCellHasExpectedToConfigureCell() {
        let cell = tableView.dequeueReusableCell(withIdentifier: productCellIdentifier) as? ProductCell
        
        var products = [Product]()
        let product = Product(id: 309396011, price: "1.45", title: "Ocado Organic Fairtrade Bananas", imageURL: "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg")
        products.append(product)
        
        var clusters = [Cluster]()
        let cluster = Cluster(tag: "Fresh > Fruit > Bananas", products: products)
        clusters.append(cluster)
        
        productListViewModel = ProductListViewModel()
        productListViewModel.clusterItems = clusters
        
        cell?.configure(withViewModel: productListViewModel, indexPath: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(cell?.titleLabel.text, "Ocado Organic Fairtrade Bananas")
    }
    
}
