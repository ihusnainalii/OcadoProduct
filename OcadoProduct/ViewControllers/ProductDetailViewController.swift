//
//  ProductDetailViewController.swift
//  OcadoProduct
//
//  Created by Lucas Correa on 26/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    //
    // MARK: - Properties
    lazy var productDetailViewModel: ProductDetailViewModel = {
        let productDetailViewModel = ProductDetailViewModel()
        return productDetailViewModel
    }()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var allergyLabel: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var productScrollView: UIScrollView!
    
    //
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenItems(isHidden: true)
        loadProductDetail()
    }
    
    //
    // MARK: - Private Functions
    
    /// Get the detail of a product
    fileprivate func loadProductDetail() {
        if let product = productDetailViewModel.product {
            productDetailViewModel.productDetail(idProduct: product.id, success: {
                self.hiddenItems(isHidden: false)
                self.fillProductOnScreen()
            }) { error in
                //We could put a message more user friendly.
                self.hiddenItems(isHidden: true)
                
                switch error {
                case .statusCodeError(let message, _):
                    let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                        self.navigationController?.popViewController(animated: true)
                    }))
                    self.present(alertController, animated: true, completion: nil)
                case .domainError, .decodingError, .unknownError:
                    // Do something here if it is the business rule.
                    break
                }
            }
        }
    }
    
    /// Fill product on screen
    fileprivate func fillProductOnScreen() {
        title = productDetailViewModel.productDetail?.title
        titleLabel.text = productDetailViewModel.productDetail?.title
        priceLabel.text = productDetailViewModel.productDetail?.price
        descriptionLabel.text = productDetailViewModel.productDetail?.productDetailDescription
        allergyLabel.text = productDetailViewModel.productDetail?.allergyInformation
        productImageView.setImage(withUrl: productDetailViewModel.productDetail?.imageURL ?? "")
    }
    
    /// Hide or show components on screen
    /// - Parameter isHidden: Bool
    fileprivate func hiddenItems(isHidden: Bool) {
        productScrollView.isHidden = isHidden
        loadingIndicator.isHidden = !isHidden
    }
    
    //
    // MARK: - Public Functions
    
}
