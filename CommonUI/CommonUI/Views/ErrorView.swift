//
//  ErrorView.swift
//  Common
//
//  Created by Dieter Vogels on 28/12/2018.
//  Copyright © 2018 Jidoka BVBA. All rights reserved.
//

import Foundation

open class ErrorView : UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    public init(error: Error) {
        super.init(frame: .zero)
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        
        titleLabel.text = error.localizedDescription
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
