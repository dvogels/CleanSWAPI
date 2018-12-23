//
//  PlanetsViewController.swift
//  Planets
//
//  Created by Dieter Vogels on 23/12/2018.
//  Copyright © 2018 Jidoka BVBA. All rights reserved.
//

import Foundation

protocol PlanetsViewControllerDelegate: class {
    
    func controllerWillDissappear(_ controller: PlanetsViewController)
    
}

class PlanetsViewController : UIViewController {
    
    weak var delegate: PlanetsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.controllerWillDissappear(self)
    }
    
}
