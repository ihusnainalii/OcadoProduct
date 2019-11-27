//
//  ClusterHeaderViewTests.swift
//  OcadoProductTests
//
//  Created by Lucas Correa on 27/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import XCTest
@testable import OcadoProduct

class ClusterHeaderViewTests: XCTestCase {

    var tableView: UITableView!
    
    override func setUp() {
        var viewController: ProductListViewController!
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: Bundle.main)
        viewController = storyboard.instantiateViewController(withIdentifier: "ProductListViewController") as? ProductListViewController
        
        window.makeKeyAndVisible()
        window.rootViewController = viewController
        
        tableView = viewController.productTableView
        
        tableView.register(ClusterHeaderView.self, forHeaderFooterViewReuseIdentifier: ClusterHeaderView.reuseIdentifier)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testClusterHeaderViewHasExpectedNotToBeNil() {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: ClusterHeaderView.reuseIdentifier)
        XCTAssertNotNil(cell)
    }
    
    func testClusterHeaderViewHasExpectedTitleLabelNotToBeNil() {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: ClusterHeaderView.reuseIdentifier) as? ClusterHeaderView
        XCTAssertNotNil(cell?.titleLabel)
    }
}
