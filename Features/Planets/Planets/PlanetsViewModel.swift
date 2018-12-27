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
    
    var currentPage: Page<Planet>?
    
    var state: State<Planet> = .loading {
        didSet {
            refreshHandler()
        }
    }
    
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
        state = .loading
        dependencies.apiClient.planets(page: currentPage?.next ?? 1,
            successHandler: { [weak self] page in
                guard let s = self else {
                    return
                }
                
                s.currentPage = page
                s.state = page.hasResults ? .populated(page.results) : .empty
            },
            failureHandler: { [weak self] error in
                guard let s = self else {
                    return
                }
                
                s.state = .error(error)
            }
        )
    }
    
}
