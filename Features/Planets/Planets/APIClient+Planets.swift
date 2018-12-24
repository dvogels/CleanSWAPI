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

extension APIClient {
    
    typealias CompletionHandler = ([Planet]) -> Void
    
    func getPlanets(completionHandler: CompletionHandler) {
        let tatooine = Planet(name: "Tatooine")
        let alderaan = Planet(name: "Alderaan")
        
        completionHandler([tatooine, alderaan])
    }
}

