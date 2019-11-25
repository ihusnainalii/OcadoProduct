//
//  Product.swift
//  OcadoProduct
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import Foundation

struct Product: Codable {
    
    //
    // MARK: - Properties
    let tag: String
    let items: [Item]
    
    //
    // MARK: - Initializers
    init(tag: String = "", items: [Item] = []) {
        self.tag = tag
        self.items = items
    }
}
