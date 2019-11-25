//
//  ProductCell.swift
//  OcadoProduct
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    //
    // MARK: - Properties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    //
    // MARK: - Functions
    
    /// Set up cell based on ViewModel
    /// - Parameters:
    ///   - viewModel: ProductListViewModel
    ///   - indexPath: An IndexPath
    func configure(withViewModel viewModel:ProductListViewModel, indexPath: IndexPath) {
        
        let product = viewModel.productItems[indexPath.section].items[indexPath.row]
        titleLabel.text = product.title
        sizeLabel.text = product.size
        priceLabel.text = product.price
        productImageView.setImage(withUrl: product.imageURL)
    }

}
