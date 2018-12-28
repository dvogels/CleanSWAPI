//
//  Error.swift
//  Model
//
//  Created by Dieter Vogels on 28/12/2018.
//  Copyright © 2018 Jidoka BVBA. All rights reserved.
//

import Foundation

public enum BackendError {
    
    case noResponse
    
    var description: String {
        switch self {
        case .noResponse:
            return "Did not get data in response"
        }
    }

}

extension BackendError: LocalizedError {
    
    public var errorDescription: String? {
        get {
            return description
        }
    }
    
}
