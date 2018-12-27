//
//  State.swift
//  Common
//
//  Created by Dieter Vogels on 27/12/2018.
//  Copyright © 2018 Jidoka BVBA. All rights reserved.
//

public enum State<T> {
    case loading
    case populated([T])
    //case paging([T], next: Int)
    case empty
    case error(Error)
    
}

public extension State {
    
    var objects: [T] {
        switch self {
        case .populated(let objects):
            return objects
        default:
            return []
        }
    }
    
}
