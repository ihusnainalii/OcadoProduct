//
//  MockProductClient.swift
//  OcadoProductTests
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import Foundation

@testable import OcadoProduct

class MockProductClient: NetworkClient {
    
    var shouldReturnError = false
    
    //
    // MARK: - Public Functions
    
    /// This method is responsible for requesting with the  API.
    /// - Parameters:
    ///   - router: Router contains which method, path, headers, parameters and url will be used in the request.
    ///   - returnType: Which is the type of model returned in the result.
    ///   - completion: Result<Type of model, NetworkError>
    func request<T>(router: Router, returnType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable {
        
        let productRouter = router as! ProductRouter
        let bundle = Bundle(for: type(of: self))
        
        switch productRouter {
        case .products:
            
            if shouldReturnError {
                return completion(.failure(.statusCodeError(message: "StatusCode 404", code: 404)))
            }
            
            guard let url = bundle.url(forResource: "products", withExtension: "json") else {
                return
            }
            
            guard let data = try? Data(contentsOf: url) else {
                return
            }
            
            guard let object = try? JSONDecoder().decode(returnType, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(object))
            
        case .productDetail(let idProduct):
            
            if idProduct != 309396011 && idProduct != 666 {
                return completion(.failure(.decodingError))
            } else if idProduct == 666 {
                return completion(.failure(.statusCodeError(message: "StatusCode 500", code: 500)))
            }
            
            guard let url = bundle.url(forResource: "productDetail", withExtension: "json") else {
                return
            }
            
            guard let data = try? Data(contentsOf: url) else {
                return
            }
            
            guard let object = try? JSONDecoder().decode(returnType, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(object))
        }
    }
}
