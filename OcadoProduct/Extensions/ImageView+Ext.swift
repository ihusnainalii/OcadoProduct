//
//  ImageView+Ext.swift
//  OcadoProduct
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import UIKit

extension UIImageView {
    
    //
    // MARK: - Functions
    func setImage(withUrl url: String) {
        self.image = UIImage(named: "OcadoEmpty")
        ImageDownload.shared.downloadImageFrom(urlString: url) { (image) in
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
