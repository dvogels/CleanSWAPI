//
//  Planet.swift
//  Model
//
//  Created by Dieter Vogels on 24/12/2018.
//  Copyright © 2018 Jidoka BVBA. All rights reserved.
//

import Foundation

public struct Planet: Decodable {
    public let name: String
    
    public init(name: String) {
        self.name = name
    }
}
