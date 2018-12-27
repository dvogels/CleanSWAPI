//
//  APIClient.swift
//  Services
//
//  Created by Dieter Vogels on 24/12/2018.
//  Copyright © 2018 Jidoka BVBA. All rights reserved.
//

import Foundation
import Alamofire

open class APIClient {
    
    public let baseURLString = "https://swapi.co/api/"
    
    public init() {}
}

extension APIClient {
    
    public typealias FailureHandler = (Error) -> Void

    public func doRequest<T: Decodable>(urlRequest: URLRequest, successHandler: @escaping (T) -> Void, failureHandler: @escaping FailureHandler) {
        Alamofire.request(urlRequest)
            .responseData { response in
                let decoder = JSONDecoder()
                let result: Result<T> = decoder.decodeResponse(from: response)
                
                switch (result) {
                case .success(let data):
                    successHandler(data)
                case .failure(let error):
                    failureHandler(error)
                }
        }
    }
}

extension JSONDecoder {
    func decodeResponse<T: Decodable>(from response: DataResponse<Data>) -> Result<T> {
        guard response.error == nil else {
            print(response.error!)
            return .failure(response.error!)
        }
        
        guard let responseData = response.data else {
            print("didn't get any data from API")
            fatalError()
            //return .failure(BackendError.parsing(reason: "Did not get data in response"))
        }
        
        do {
            let item = try decode(T.self, from: responseData)
            return .success(item)
        } catch {
            print("error trying to decode response")
            print(error)
            return .failure(error)
        }
    }
}
