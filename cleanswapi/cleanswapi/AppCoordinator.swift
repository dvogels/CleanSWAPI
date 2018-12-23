//
//  AppCoordinator.swift
//  cleanswapi
//
//  Created by Dieter Vogels on 23/12/2018.
//  Copyright © 2018 Jidoka BVBA. All rights reserved.
//

import Common

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    
    let window: UIWindow?
    let navigationController : UINavigationController
    
    // MARK: - Coordinator
    
    init(window: UIWindow?) {
        self.window = window
        
        let menuViewController = MenuViewController()
        self.navigationController = UINavigationController(rootViewController: menuViewController)
        
        super.init()
        
        menuViewController.delegate = self
    }
    
    override func start() {
        guard let window = window else {
            return
        }
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
        
}
