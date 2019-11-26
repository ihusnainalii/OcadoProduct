//
//  ProductService.swift
//  OcadoProduct
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import Foundation

typealias ResultClusterList = Result<(ClusterList), NetworkError>
typealias ResultProductDetail = Result<ProductDetail, NetworkError>

class ProductService: Service {
    
    //
    // MARK: - Properties
    var client: NetworkClient
    
    //
    // MARK: - Initializer DI
    required init(client: NetworkClient) {
        self.client = client
    }
    
    //
    // MARK: - Public Functions
    
    /// Cluster list - get all clusters
    /// - Parameter completion: Result<(ClusterList), NetworkError>
    func clusterList(completion: @escaping (ResultClusterList) -> Void) {
        client.request(router: ProductRouter.products, returnType: ClusterList.self) { result in
            completion(result)
        }
    }
    
    /// Get the detail of a product
    /// - Parameters:
    ///   - idProduct: Int
    ///   - completion: Result<ProductDetail, NetworkError>
    func productDetail(idProduct: Int, completion: @escaping (ResultProductDetail) -> Void) {
        client.request(router: ProductRouter.productDetail(idProduct: idProduct), returnType: ProductDetail.self) { result in
            completion(result)
        }
    }
}
