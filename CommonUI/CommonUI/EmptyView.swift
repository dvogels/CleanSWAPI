//
//  EmptyView.swift
//  Common
//
//  Created by Dieter Vogels on 28/12/2018.
//  Copyright © 2018 Jidoka BVBA. All rights reserved.
//

import Foundation

open class EmptyView: UIView {
    
    public init() {
        super.init(frame: .zero)
        
        backgroundColor = .blue
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
