//
//  ViewController.swift
//  cleanswapi
//
//  Created by Dieter Vogels on 23/12/2018.
//  Copyright © 2018 Jidoka BVBA. All rights reserved.
//

import UIKit

enum MenuItem {
    
    case planets
    
}

protocol MenuViewControllerDelegate: class {
    
    func controller(_ controller: MenuViewController, didTap menuItem: MenuItem)
    
}

class MenuViewController: UIViewController {
    
    // MARK: Properties
    
    weak var delegate: MenuViewControllerDelegate?
    
    // MARK: Subviews
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [planetsButton])
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private lazy var planetsButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.roundedRect)
        button.setTitle("Planets", for: .normal)
        button.addTarget(self, action: #selector(didTapPlanets), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: Init

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
}

extension MenuViewController {
    
    @objc func didTapPlanets() {
        delegate?.controller(self, didTap: .planets)
    }
    
}
