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
    var clusterItems: [Cluster] {
        didSet {
            self.clusterItems.sort { cluster1, cluster2  in
                //I am checking with lowercase so I can order correctly.
                return cluster1.tag.lowercased() < cluster2.tag.lowercased()
            }
        }
    }
    
    var service: ProductService
    
    //
    // MARK: - Initializer DI
    init(service: ProductService = ProductService(client: ProductClient())) {
        self.service = service
        self.clusterItems = [Cluster]()
    }
    
    //
    // MARK: - Public Functions
    
    /// Cluster list
    /// - Parameters:
    ///   - success: Closure Void
    ///   - failure: Closure Errors
    func clusterList(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        self.service.clusterList { result in
            switch result {
            case .success(let clusterList):
                self.clusterItems = clusterList.clusters
                success()
            case .failure(let error):
                failure(error)
            }
        }
    }
}
