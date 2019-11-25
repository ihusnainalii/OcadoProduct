//
//  Item.swift
//  OcadoProduct
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import Foundation

struct Item: Codable {
    
    //
    // MARK: - Properties
    let id: Int
    let price, title, size: String
    let imageURL: String
    
    //
    // MARK: - Initializers
    
    /// The initializer of Item that contains id, price, title and imageURL
    /// - Parameters:
    ///   - id: id of the item (Int)
    ///   - price: Price of the item (String)
    ///   - title: Title of the item (String)
    ///   - imageURL: Image URL of the item (String)
    init(id: Int, price: String, title: String, imageURL: String) {
        self.id = id
        self.price = price
        self.title = title
        self.size = ""
        self.imageURL = imageURL
    }
    
    /// The initializer of Item that contains id, price, title, size  and imageURL
    /// - Parameters:
    ///   - id: id of the item (Int)
    ///   - price: Price of the item (String)
    ///   - title: Title of the item (String)
    ///   - size: Size of the item (String)
    ///   - imageURL: Image URL of the item (String)
    init(id: Int = 0, price: String = "", title: String = "", size: String = "", imageURL: String = "") {
        self.id = id
        self.price = price
        self.title = title
        self.size = size
        self.imageURL = imageURL
    }

    //
    // MARK: - Codable
    enum CodingKeys: String, CodingKey {
        case id, price, title, size
        case imageURL = "imageUrl"
    }
}
