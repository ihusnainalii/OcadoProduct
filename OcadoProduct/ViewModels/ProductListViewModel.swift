//
//  ProductListViewModel.swift
//  OcadoProduct
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import Foundation

class ProductListViewModel {
    
    //
    // MARK: - Properties
    var productItems: [Product] {
        didSet {
            self.productItems.sort { product1, product2  in
                //I am checking with lowercase so I can order correctly.
                return product1.tag.lowercased() < product2.tag.lowercased()
            }
        }
    }
    
    var service: ProductService
    
    //
    // MARK: - Initializer DI
    init(service: ProductService = ProductService(client: ProductClient())) {
        self.service = service
        self.productItems = [Product]()
    }
    
    //
    // MARK: - Public Functions
    
    /// Product list
    /// - Parameters:
    ///   - success: Closure Void
    ///   - failure: Closure Errors
    func list(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        self.service.productList { result in
            switch result {
            case .success(let productList):
                self.productItems = productList.products
                success()
            case .failure(let error):
                failure(error)
            }
        }
    }
}
