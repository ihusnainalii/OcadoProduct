//
//  ProductDetail.swift
//  OcadoProduct
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import Foundation

struct ProductDetail: Codable {
    
    //
    // MARK: - Properties
    let id: Int
    let price, title: String
    let imageURL: String
    let productDetailDescription, allergyInformation: String
    
    //
    // MARK: - Initializers
    
    /// The initializer of Product detail that contains id, title, imageURL, description and allergy information.
    /// - Parameters:
    ///   - id: id of the product detail (Int)
    ///   - title: Title of the product detail  (String)
    ///   - imageURL: Image URL of the product detail  (String)
    ///   - productDetailDescription: Description of the product detail  (String)
    ///   - allergyInformation: Allergy information of the product detail  (String)
    init(id: Int, title: String, imageURL: String, productDetailDescription: String, allergyInformation: String) {
        self.id = id
        self.price = ""
        self.title = title
        self.productDetailDescription = productDetailDescription
        self.imageURL = imageURL
        self.allergyInformation = allergyInformation
    }
    
    /// The initializer of Product detail that contains id, price, title, imageURL, description and allergy information.
    /// - Parameters:
    ///   - id: id of the product detail (Int)
    ///   - price: Price of the product detail  (String)
    ///   - title: Title of the product detail  (String)
    ///   - imageURL: Image URL of the product detail  (String)
    ///   - productDetailDescription: Description of the product detail  (String)
    ///   - allergyInformation: Allergy information of the product detail  (String)
    init(id: Int = 0, price: String = "", title: String = "", imageURL: String = "", productDetailDescription: String = "", allergyInformation: String = "") {
        self.id = id
        self.price = price
        self.title = title
        self.productDetailDescription = productDetailDescription
        self.imageURL = imageURL
        self.allergyInformation = allergyInformation
    }
    
    //
    // MARK: - Codable
    enum CodingKeys: String, CodingKey {
        case id, price, title
        case imageURL = "imageUrl"
        case productDetailDescription = "description"
        case allergyInformation
    }
}
