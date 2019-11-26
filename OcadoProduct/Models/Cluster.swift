//
//  Cluster.swift
//  OcadoProduct
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import Foundation

struct Cluster: Codable {
    
    //
    // MARK: - Properties
    let tag: String
    let products: [Product]
    
    //
    // MARK: - Initializers
    
    /// The initializer of cluster that contains tag and products
    /// - Parameters:
    ///   - tag: Header title
    ///   - products: [Product]
    init(tag: String = "", products: [Product] = []) {
        self.tag = tag
        self.products = products
    }
    
    //
    // MARK: - Codable
    enum CodingKeys: String, CodingKey {
        case tag
        case products = "items"
    }
}
