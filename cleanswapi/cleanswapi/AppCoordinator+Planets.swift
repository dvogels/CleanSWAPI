//
//  AppCoordinator+MenuViewController.swift
//  cleanswapi
//
//  Created by Dieter Vogels on 23/12/2018.
//  Copyright © 2018 Jidoka BVBA. All rights reserved.
//

import Foundation
import Planets

extension AppCoordinator : MenuViewControllerDelegate {
    
    func controller(_ controller: MenuViewController, didTap menuItem: MenuItem) {
        switch menuItem {
        case .planets:
            let planetsCoordinator = PlanetsCoordinator(navigationController: self.navigationController)
            planetsCoordinator.delegate = self
            self.addChildCoordinator(planetsCoordinator)
            planetsCoordinator.start()
        }
    }
    
}

extension AppCoordinator: PlanetsCoordinatorDelegate {
    
    func coordinatorDidFinish(_ coordinator: PlanetsCoordinator) {
        self.removeChildCoordinator(coordinator)
        self.navigationController.popToRootViewController(animated: true)
    }
    
}
