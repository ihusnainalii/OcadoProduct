//
//  ProductDetailViewModel.swift
//  OcadoProduct
//
//  Created by Lucas Correa on 26/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import Foundation

class ProductDetailViewModel {
    
    //
    // MARK: - Properties
    var product: Product?
    var productDetail: ProductDetail?
    var service: ProductService
    
    //
    // MARK: - Initializer DI
    init(service: ProductService = ProductService(client: ProductClient())) {
        self.service = service
    }
    
    //
    // MARK: - Public Functions
    
    /// Get Detail of a product
    /// - Parameters:
    ///   - idProduct: Int
    ///   - success: Closure Void
    ///   - failure: Closure Errors
    func productDetail(idProduct: Int, success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        self.service.productDetail(idProduct: idProduct, completion: { result in
            switch result {
            case .success(let productDetail):
                self.productDetail = productDetail
                success()
            case .failure(let error):
                failure(error)
            }
        })
    }
}
