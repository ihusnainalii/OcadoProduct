//
//  Service.swift
//  OcadoProduct
//
//  Created by Lucas Correa on 25/11/2019.
//  Copyright © 2019 SiriusCode. All rights reserved.
//

import Foundation

typealias SuccessHandler = () -> Void
typealias FailureHandler = (NetworkError) -> Void

protocol Service {
    init(client: NetworkClient)
}
