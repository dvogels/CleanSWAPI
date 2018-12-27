//
//  Page.swift
//  Model
//
//  Created by Dieter Vogels on 25/12/2018.
//  Copyright © 2018 Jidoka BVBA. All rights reserved.
//

import Foundation

public struct Page<T: Decodable> {
    public let next: Int?
    public let results: [T]
}

extension Page: Decodable {
    enum Keys: String, CodingKey {
        case next = "next"
        case results = "results"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        
        var next: Int?
        if let nextURLString: String = try container.decode(String?.self, forKey: .next),
            let urlComponents = URLComponents(string: nextURLString),
            let pageQueryItem = urlComponents.queryItems?.filter({ $0.name == "page" }).first,
            let nextPage: Int = Int(pageQueryItem.value ?? "") {
            
            next = nextPage
        }
        
        let results: [T] = try container.decode([T].self, forKey: .results)

        self.init(next: next, results: results)
    }
}

public extension Page {
    
    public var hasResults: Bool {
        return results.count > 0
    }
    
    public var isLast: Bool {
        return next == nil
    }
    
}
