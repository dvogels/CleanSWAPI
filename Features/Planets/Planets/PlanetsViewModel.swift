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
    var state: State<Planet> = .loading {
        didSet {
            refreshHandler()
        }
    }
    
    private var pages: [Page<Planet>] = []
    
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
        loadPage(page: 1)
    }
    
    func loadPage(page: Int) {
        dependencies.apiClient.planets(page: page,
                                       successHandler: { [weak self] loadedPage in
                                        guard let s = self else {
                                            return
                                        }
                                        
                                        if loadedPage.hasResults {
                                            s.pages.append(loadedPage)
                                            s.state = .populated(s.pages)
                                        } else if s.pages.count > 0 {
                                            s.state = .populated(s.pages)
                                        } else {
                                            s.state = .empty
                                        }
            },
                                       failureHandler: { [weak self] error in
                                        guard let s = self else {
                                            return
                                        }
                                        
                                        s.state = .error(error)
            }
        )
    }
    
    func loadNextPageWhenNeeded() {
        if case .populated(let pages) = state, let page = pages.last, let nextPage = page.next {
            loadPage(page: nextPage)
        }
    }
    
}
