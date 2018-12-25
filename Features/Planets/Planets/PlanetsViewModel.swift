//
//  PlanetsViewModel.swift
//  Planets
//
//  Created by Dieter Vogels on 24/12/2018.
//  Copyright © 2018 Jidoka BVBA. All rights reserved.
//

import Foundation
import Common
import Model

class PlanetsViewModel {
    
    typealias Dependencies = HasAPIClient
    typealias RefreshHandler = () -> Void
    
    //MARK: - Properties
    
    private let dependencies: Dependencies
    var planets: [Planet] = []
    
    //MARK: - Closures
    
    var refreshHandler: RefreshHandler = {}
    
    //MARK: - Init
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
}

//MARK: - Networking

extension PlanetsViewModel {
    
    func fetchPlanets() {
        dependencies.apiClient.planets(
            successHandler: { [weak self] planets in
                self?.planets = planets
                self?.refreshHandler()
            },
            failureHandler: { _ in
                //TODO: error handling with states
            }
        )
    }
    
}
