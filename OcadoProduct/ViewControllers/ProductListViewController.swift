//
//  ProductListViewController.swift
//  OcadoProduct
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {

    //
    // MARK: - Properties
    lazy var productListViewModel: ProductListViewModel = {
        let productListViewModel = ProductListViewModel()
        return productListViewModel
    }()
    
    let productCellIdentifier = "ProductCell"
    let productDetailSegue = "productDetailSegue"
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var productTableView: UITableView!
    
    //
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Register Header Footer
        productTableView.register(ClusterHeaderView.self, forHeaderFooterViewReuseIdentifier: ClusterHeaderView.reuseIdentifier)
        
        loadClusters()
    }
    
    //
    // MARK: - Private Functions
    
    /// Load cluster list
    fileprivate func loadClusters() {
        productListViewModel.clusterList(success: {
            self.productTableView.isHidden = false
            self.productTableView.reloadData()
        }) { error in
            //We could put a message more user friendly.
            switch error {
            case .statusCodeError(let message, _):
                self.loadingIndicator.isHidden = true
                let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            case .domainError, .decodingError, .unknownError:
                // Do something here if it is the business rule.
                break
            }
        }
    }
    
    //
    // MARK: - Public Functions
    
    //
    // MARK: - UIStoryboardSegueDelegate
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == productDetailSegue {
            let destination: ProductDetailViewController = (segue.destination as? ProductDetailViewController)!
            if let product = sender as? Product {
                destination.productDetailViewModel.product = product
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension ProductListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return productListViewModel.clusterItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productListViewModel.clusterItems[section].products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProductCell = (tableView.dequeueReusableCell(withIdentifier: productCellIdentifier, for: indexPath) as? ProductCell)!
        
        cell.configure(withViewModel: productListViewModel, indexPath: indexPath)
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension ProductListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let product = productListViewModel.clusterItems[indexPath.section].products[indexPath.row]
        performSegue(withIdentifier: productDetailSegue, sender: product)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: ClusterHeaderView.reuseIdentifier) as? ClusterHeaderView else {
            return nil
        }

        view.titleLabel.text = productListViewModel.clusterItems[section].tag
        return view
    }
}


