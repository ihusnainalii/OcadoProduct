//
//  NetworkClient.swift
//  OcadoProduct
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import Foundation

protocol NetworkClient {
    func request<T: Decodable>(router: Router, returnType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void)
}
 
