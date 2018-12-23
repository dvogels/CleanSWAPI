//
//  PlanetsCoordinator.swift
//  Planets
//
//  Created by Dieter Vogels on 23/12/2018.
//  Copyright © 2018 Jidoka BVBA. All rights reserved.
//

import Foundation
import Common

public protocol PlanetsCoordinatorDelegate: class {
    
    func coordinatorDidFinish(_ coordinator: PlanetsCoordinator)
    
}

open class PlanetsCoordinator : Coordinator {
    
    //MARK: Private Properties
    
    private let navigationController: UINavigationController
    
    //MARK: Public Properties
    
    public weak var delegate: PlanetsCoordinatorDelegate?
    
    //MARK: Init
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
    deinit {
        NSLog("💥 PlanetsCoordinator 💥", "")
    }
    
    //MARK: 
    
    open override func start() {
        let planetsViewController = PlanetsViewController()
        planetsViewController.delegate = self
        
        self.navigationController.pushViewController(planetsViewController, animated: true)
    }
    
    open override func finish() {
        delegate?.coordinatorDidFinish(self)
    }
    
}

extension PlanetsCoordinator: PlanetsViewControllerDelegate {
    
    func controllerWillDissappear(_ controller: PlanetsViewController) {
        finish()
    }
    
}
