//
//  ProductClient.swift
//  OcadoProduct
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import Foundation

struct ProductClient: NetworkClient {
    
    //
    // MARK: - Public Functions
    
    /// This method is responsible for requesting with the API.
    /// - Parameters:
    ///   - router: Router contains which method, path, headers, parameters and url will be used in the request.
    ///   - returnType: Which is the type of model returned in the result.
    ///   - completion: Result<Type of model, NetworkError>
    func request<T>(router: Router, returnType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable {
        
        var urlRequest = URLRequest(url: router.url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: Config.timeout)
        urlRequest.httpMethod = router.method
        
        for (key, value) in router.headers {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                
                guard let data = data, error == nil else {
                    if let error = error as NSError?, error.domain == NSURLErrorDomain {
                        completion(.failure(.domainError))
                    }
                    return
                }
                
                if let response = response as? HTTPURLResponse {
                    // 200 OK, 201 Created, 202 Accepted, 204 No content (PUT, POST or DELETE)
                    if (200...204).contains(response.statusCode) {
                        guard let object = try? JSONDecoder().decode(returnType, from: data) else {
                            return completion(.failure(.decodingError))
                        }
                        completion(.success(object))
                    } else {
                        completion(.failure(.statusCodeError(message: "StatusCode invalid", code: response.statusCode)))
                    }
                }
                
            }
        }.resume()
    }
}
