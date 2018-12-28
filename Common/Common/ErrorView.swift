//
//  ErrorView.swift
//  Common
//
//  Created by Dieter Vogels on 28/12/2018.
//  Copyright © 2018 Jidoka BVBA. All rights reserved.
//

import Foundation

open class ErrorView : UIView {
    
    let error: Error
    
    public init(error: Error) {
        self.error = error
        
        super.init(frame: .zero)
        
        backgroundColor = .red
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
