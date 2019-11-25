//
//  NetworkError.swift
//  OcadoProduct
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case statusCodeError(message: String, code: Int)
    case domainError
    case decodingError
    case unknownError
}

extension NetworkError: LocalizedError {
    
    //
    // MARK: - Properties
    public var errorDescription: String? {
        
        switch self {
        case .statusCodeError(let message, let code):
            return NSLocalizedString("GET/POST request not successful. \(code) \(message)", comment: "NetworkError")
        case .domainError:
            return NSLocalizedString("Domain error", comment: "NetworkError")
        case .decodingError:
            return NSLocalizedString("Decoding error", comment: "NetworkError")
        case .unknownError:
            return NSLocalizedString("Unknown error", comment: "NetworkError")
        }
        
    }
}
