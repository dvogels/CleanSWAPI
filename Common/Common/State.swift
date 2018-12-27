//
//  State.swift
//  Common
//
//  Created by Dieter Vogels on 27/12/2018.
//  Copyright © 2018 Jidoka BVBA. All rights reserved.
//
import Model

public enum State<T> where T : Decodable {
    case loading
    case populated([Page<T>])
    case empty
    case error(Error)
    
}

public extension State {
    
    var objects: [T] {
        switch self {
        case .populated(let pages):
            return pages.flatMap { $0.results }
        default:
            return []
        }
    }
    
}
