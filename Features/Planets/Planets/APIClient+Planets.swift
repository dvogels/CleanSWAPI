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

/*private enum Router: URLRequestConvertible {
 static let baseURLString = "https://swapi.co/api/"
 
 case planets(Int?)
 
 func asURLRequest() throws -> URLRequest {
 var method: HTTPMethod {
 switch self {
 case .planets:
 return .get
 }
 }
 
 let params: ([String: Any]?) = {
 switch self {
 case .planets:
 return nil
 }
 }()
 
 let url: URL = {
 // build up and return the URL for each endpoint
 let relativePath: String?
 switch self {
 case .planets(let identifier):
 if let identifier = identifier {
 relativePath = "planets/\(identifier)"
 } else {
 relativePath = "planets/"
 }
 }
 
 var url = URL(string: Router.baseURLString)!
 if let relativePath = relativePath {
 url = url.appendingPathComponent(relativePath)
 }
 return url
 }()
 
 var urlRequest = URLRequest(url: url)
 urlRequest.httpMethod = method.rawValue
 
 let encoding: ParameterEncoding = {
 switch method {
 case .get:
 return URLEncoding.default
 default:
 return JSONEncoding.default
 }
 }()
 return try encoding.encode(urlRequest, with: params)
 }
 }*/

extension APIClient {
    
    typealias SuccessHandler = ([Planet]) -> Void
    
    func planets(successHandler: @escaping SuccessHandler, failureHandler: @escaping FailureHandler) {
        let urlRequest = URLRequest(url: URL(string: "https://swapi.co/api/planets/")!)
        self.doRequest(urlRequest: urlRequest,
                       successHandler: { (page: Page<Planet>) in successHandler(page.results) },
                       failureHandler: failureHandler)
    }
    
}
