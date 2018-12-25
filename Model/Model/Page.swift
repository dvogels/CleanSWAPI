//
//  Page.swift
//  Model
//
//  Created by Dieter Vogels on 25/12/2018.
//  Copyright © 2018 Jidoka BVBA. All rights reserved.
//

import Foundation

public struct Page<T: Decodable> : Decodable {
    public let count: Int
    public let next: String?
    public let previous: String?
    public let results: [T]
}
