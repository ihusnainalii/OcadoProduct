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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productTableView.register(
            ClusterHeaderView.self,
            forHeaderFooterViewReuseIdentifier:
                ClusterHeaderView.reuseIdentifier
        )
        
        
        productListViewModel.list(success: {
            self.productTableView.isHidden = false
            self.productTableView.reloadData()
        }) { error in
            
        }
    }
}

// MARK: - UITableViewDataSource
extension ProductListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return productListViewModel.productItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productListViewModel.productItems[section].items.count
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
//        let book = bookListViewModel.bookItems[indexPath.row]
//        performSegue(withIdentifier: bookDetailSegue, sender: book)
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView,
                   estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }

    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: ClusterHeaderView.reuseIdentifier) as? ClusterHeaderView else {
            return nil
        }

        view.titleLabel.text = productListViewModel.productItems[section].tag

        return view
    }
}


