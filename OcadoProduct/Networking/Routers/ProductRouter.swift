//
//  ProductRouter.swift
//  OcadoProduct
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import Foundation

enum ProductRouter: Router {
    case products
    case productDetail(idProduct: Int)
}

extension ProductRouter {
    
    //
    // MARK: - Properties
    var method: String {
        switch self {
        case .products, .productDetail:
            return "GET"
        }
    }
    
    var path: String {
        switch self {
        case .products:
            return "product/all.json"
        case .productDetail(let idProduct):
            return "product/\(idProduct).json"
        }
    }
    
    var headers: [String: String] {
        return ["Accept": "application/json",
                "Content-Type": "application/json"]
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .products, .productDetail:
            return [:]
        }
    }
    
    var url: URL {
        switch self {
        case .products, .productDetail:
            return URL(string: "\(Config.baseURL)\(path)")!
        }
    }
}
