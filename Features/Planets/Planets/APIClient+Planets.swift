//
//  APIClient+Planets.swift
//  Planets
//
//  Created by Dieter Vogels on 24/12/2018.
//  Copyright © 2018 Jidoka BVBA. All rights reserved.
//

import Foundation
import Services
import Model

private enum Router {
    
    case planets(Int)
    
    func asURLRequest() -> URLRequest {
        switch self {
        case .planets(let page):
            return URLRequest(url: URL(string: "\(APIClient.baseURLString)planets/?page=\(page)")!)
        }
    }
}

extension APIClient {
    
    typealias SuccessHandler = (Page<Planet>) -> Void
    
    func planets(page: Int, successHandler: @escaping SuccessHandler, failureHandler: @escaping FailureHandler) {
        self.doRequest(urlRequest: Router.planets(page).asURLRequest(),
                       successHandler: { (page: Page<Planet>) in successHandler(page) },
                       failureHandler: failureHandler)
    }
    
}
